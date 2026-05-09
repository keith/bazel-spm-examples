"""Pulls .swiftinterface and .a outputs from a swift_library, after forcing
the underlying compile to enable library evolution + swiftinterface emission.
"""

load("@rules_cc//cc/common:cc_info.bzl", "CcInfo")
load("@rules_swift//swift:providers.bzl", "SwiftInfo")

_EVOLUTION_FEATURES = [
    "swift.enable_library_evolution",
    "swift.emit_swiftinterface",
]

def _force_evolution_transition_impl(settings, _attr):
    return {
        "//command_line_option:features": (
            settings["//command_line_option:features"] + _EVOLUTION_FEATURES
        ),
    }

_force_evolution_transition = transition(
    implementation = _force_evolution_transition_impl,
    inputs = ["//command_line_option:features"],
    outputs = ["//command_line_option:features"],
)

def _split_swift_outputs_impl(ctx):
    target = ctx.attr.target[0]
    swift_info = target[SwiftInfo]
    cc_info = target[CcInfo]

    # `target` may be a `swift_library_group` (rspm wraps the real
    # swift_library in one) so `direct_modules` is empty. Locate the
    # requested module by name among the transitive modules instead.
    module_name = ctx.attr.module_name
    swift = None
    for module in swift_info.transitive_modules.to_list():
        if module.name == module_name and module.swift:
            swift = module.swift
            break
    if not swift:
        fail("no Swift module named '{}' found in transitive SwiftInfo".format(module_name))
    if not swift.swiftinterface:
        fail("module '{}' did not emit a .swiftinterface; enable swift.emit_swiftinterface".format(module_name))

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

split_swift_outputs = rule(
    implementation = _split_swift_outputs_impl,
    attrs = {
        "module_name": attr.string(
            mandatory = True,
            doc = "Name of the Swift module whose .swiftinterface should be extracted.",
        ),
        "target": attr.label(
            providers = [SwiftInfo, CcInfo],
            mandatory = True,
            cfg = _force_evolution_transition,
        ),
    },
)
