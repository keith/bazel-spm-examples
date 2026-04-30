"""Macro that creates *_build_test rules for every Apple platform."""

load("@rules_apple//apple:ios.bzl", "ios_build_test")
load("@rules_apple//apple:macos.bzl", "macos_build_test")
load("@rules_apple//apple:tvos.bzl", "tvos_build_test")
load("@rules_apple//apple:visionos.bzl", "visionos_build_test")
load("@rules_apple//apple:watchos.bzl", "watchos_build_test")

_PLATFORMS = [
    ("ios", ios_build_test, "16.0"),
    ("macos", macos_build_test, "13.0"),
    ("tvos", tvos_build_test, "16.0"),
    ("watchos", watchos_build_test, "9.0"),
    ("visionos", visionos_build_test, "1.0"),
]

def apple_build_tests(targets, exclude = []):
    for platform, rule, min_os in _PLATFORMS:
        if platform in exclude:
            continue
        rule(
            name = platform + "_build_test",
            minimum_os_version = min_os,
            target_compatible_with = select({
                "//:apple_build_tests_enabled": [],
                "//conditions:default": ["@platforms//:incompatible"],
            }),
            exec_compatible_with = ["@platforms//os:macos"],
            targets = targets,
        )
