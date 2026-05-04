"""Pulls .swiftinterface and .a outputs from a swift_library that was built
with `swift.enable_library_evolution` + `swift.emit_swiftinterface`, so a
`swift_import` can reconsume them and force every downstream compile through
the interface-recompile path (rather than the binary .swiftmodule).
"""

load("@rules_cc//cc/common:cc_info.bzl", "CcInfo")
load("@rules_swift//swift:providers.bzl", "SwiftInfo")

def _swift_evolved_outputs_impl(ctx):
    swift_info = ctx.attr.target[SwiftInfo]
    cc_info = ctx.attr.target[CcInfo]

    direct = list(swift_info.direct_modules)
    if len(direct) != 1:
        fail("expected exactly one direct module, got {}".format(len(direct)))
    swift = direct[0].swift
    if not swift or not swift.swiftinterface:
        fail("target did not emit a .swiftinterface; enable swift.emit_swiftinterface")

    archives = []
    for linker_input in cc_info.linking_context.linker_inputs.to_list():
        for lib in linker_input.libraries:
            if lib.static_library:
                archives.append(lib.static_library)

    return [
        DefaultInfo(files = depset([swift.swiftinterface] + archives)),
        OutputGroupInfo(
            swiftinterface = depset([swift.swiftinterface]),
            archives = depset(archives),
        ),
    ]

swift_evolved_outputs = rule(
    implementation = _swift_evolved_outputs_impl,
    attrs = {
        "target": attr.label(providers = [SwiftInfo, CcInfo], mandatory = True),
    },
)
