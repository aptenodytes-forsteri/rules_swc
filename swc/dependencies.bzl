"""Starlark helper to fetch rules_swc dependencies.

These are needed for local dev, and users must install them as well.
See https://docs.bazel.build/versions/main/skylark/deploying.html#dependencies

Replaced by bzlmod for users of Bazel 6.0 and above.
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def http_archive(**kwargs):
    maybe(_http_archive, **kwargs)

def rules_swc_dependencies():
    http_archive(
        name = "bazel_skylib",
        sha256 = "cd55a062e763b9349921f0f5db8c3933288dc8ba4f76dd9416aac68acee3cb94",
        urls = ["https://github.com/bazelbuild/bazel-skylib/releases/download/1.5.0/bazel-skylib-1.5.0.tar.gz"],
    )

    http_archive(
        name = "aspect_bazel_lib",
        sha256 = "87ab4ec479ebeb00d286266aca2068caeef1bb0b1765e8f71c7b6cfee6af4226",
        strip_prefix = "bazel-lib-2.7.3",
        url = "https://github.com/aspect-build/bazel-lib/releases/download/v2.7.3/bazel-lib-v2.7.3.tar.gz",
    )

    http_archive(
        name = "aspect_rules_js",
        sha256 = "389021e29b3aeed2f6fb3a7a1478f8fc52947a6500b198a7ec0f3358c2842415",
        strip_prefix = "rules_js-2.0.0-rc0",
        url = "https://github.com/aspect-build/rules_js/releases/download/v2.0.0-rc0/rules_js-v2.0.0-rc0.tar.gz",
    )

    http_archive(
        name = "rules_nodejs",
        sha256 = "dddd60acc3f2f30359bef502c9d788f67e33814b0ddd99aa27c5a15eb7a41b8c",
        strip_prefix = "rules_nodejs-6.1.0",
        url = "https://github.com/bazelbuild/rules_nodejs/releases/download/v6.1.0/rules_nodejs-v6.1.0.tar.gz",
    )
