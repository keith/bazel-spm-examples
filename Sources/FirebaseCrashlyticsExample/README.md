# FirebaseCrashlyticsExample

Reproduces a `rules_swift` explicit-modules failure on a SwiftPM `.define(...)`
whose value contains spaces.

```console
# passes
$ bazel test //Sources/FirebaseCrashlyticsExample:ios_build_test

# fails
$ bazel test --config=explicit-modules //Sources/FirebaseCrashlyticsExample:ios_build_test
ERROR: ...swiftpkg_firebase_ios_sdk/BUILD.bazel:127:11: Precompiling C module
  @@...+swiftpkg_firebase_ios_sdk//:FirebaseCrashlytics.rspm_c failed
<unknown>:0: error: unable to handle compilation, expected exactly one compiler job
<unknown>:0: error: clang importer creation failed
```

## Cause

`firebase-ios-sdk`'s `FirebaseCrashlytics` target declares:

```swift
.define("CLS_SDK_NAME", to: "Crashlytics iOS SDK", .when(platforms: [.iOS])),
```

Bazel applies Bourne shell tokenization to `copts` on C/Objective-C rules, so a
define whose value contains spaces has to arrive backslash-escaped to survive as
a single argument. `rules_swift_package_manager` emits exactly that:

```python
copts = ["-DCLS_SDK_NAME=Crashlytics\\ iOS\\ SDK"]
```

`swift_clang_module_aspect` then harvests raw `-D` copts as `user_compile_flags`
for the PCM action without re-tokenizing them:

```python
local_defines = [
    copt
    for copt in getattr(attr, "copts", [])
    if copt.startswith("-D") and "$(" not in copt
]
```

The trip through `-Xcc` into the ClangImporter lexes them a second time. The
escaped value collapses into a single `'-DCLS_SDK_NAME=Crashlytics iOS SDK'`
token — quote characters included — which clang treats as an input file rather
than a flag. The driver then has two inputs and emits two jobs:

```
"-cc1" ... "-main-file-name" "<swift-imported-modules>" ...
"-cc1" ... "-main-file-name" "'-DCLS_SDK_NAME=Crashlytics iOS SDK'" ...
```

Unescaping in the aspect does not fix it, it just moves the breakage to that
second lex pass, which splits the value:

```
<unknown>:0: error: error opening input file 'iOS' (No such file or directory)
<unknown>:0: error: error opening input file 'SDK'' (No such file or directory)
```

## Notes

Two bits of setup keep this example focused on the above:

- `//patches:firebase_core_module_deps.patch` fixes unrelated missing-dep
  failures on the `Firebase` and `FirebaseCoreExtension` modules, which would
  otherwise stop the build first.
- `.bazelrc` scopes `-Wno-unknown-pragmas` to this package, because Crashlytics
  uses `#pragma clang diagnostic ignored` for diagnostics this clang doesn't
  know about, which trips the repo-wide `-Werror`.
