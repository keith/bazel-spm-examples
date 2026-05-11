"""A flag indicating if a set of Bazel features are enabled."""

def _features_enabled_impl(ctx):
    enabled = all([
        feature in ctx.features
        for feature in ctx.attr.feature_names
    ])
    return [config_common.FeatureFlagInfo(value = "True" if enabled else "False")]

features_enabled = rule(
    implementation = _features_enabled_impl,
    attrs = {
        "feature_names": attr.string_list(
            mandatory = True,
            doc = "The Bazel features that must all be enabled.",
        ),
    },
    doc = """\
Exposes a string-valued flag that's `"True"` when all requested Bazel features
are enabled and `"False"` otherwise. Use this with
`config_setting(flag_values = {...: "True"})` to drive selects.
""",
)
