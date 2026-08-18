import FirebaseCrashlytics

// Importing FirebaseCrashlytics is enough to pull in the FirebaseCrashlytics
// C module, whose PCM fails to precompile under explicit modules. See the
// comment in BUILD.bazel for details.
print(Crashlytics.crashlytics())
