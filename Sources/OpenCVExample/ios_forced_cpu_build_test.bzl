"""Build-test helper for the OpenCV example's forced iOS CPU."""

load("@rules_apple//apple/internal:transition_support.bzl", "transition_support")

_PASSING_TEST_SCRIPT = """#!/bin/bash
exit 0
"""

def _ios_forced_cpu_build_test_impl(ctx):
    target = ctx.attr.target[0][DefaultInfo]

    ctx.actions.write(
        content = _PASSING_TEST_SCRIPT,
        output = ctx.outputs.executable,
        is_executable = True,
    )

    return [DefaultInfo(
        executable = ctx.outputs.executable,
        runfiles = ctx.runfiles(
            transitive_files = depset(transitive = [target.files]),
        ),
    )]

ios_forced_cpu_build_test = rule(
    implementation = _ios_forced_cpu_build_test_impl,
    attrs = {
        "forced_cpus": attr.string_list(
            default = ["x86_64"],
            doc = "Apple CPU archs to force for iOS builds.",
        ),
        "minimum_os_version": attr.string(default = "16.0"),
        "platform_type": attr.string(default = "ios"),
        "target": attr.label(
            cfg = transition_support.apple_universal_binary_rule_transition,
            mandatory = True,
        ),
    },
    test = True,
)
