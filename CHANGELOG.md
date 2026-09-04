# Changelog

## [Unreleased]

Initial release — `lz4` 1.10.0 as a single self-contained binary, built
natively for Linux, macOS, and Windows.

### Added

- Builds for Linux (x86_64, aarch64, armv7l, i686, ppc64le, riscv64), macOS
  (Intel and Apple Silicon), and Windows (x86_64).
- `lz4cat` and `unlz4` are created alongside `lz4` when you install it.
- The `lz4`, `lz4cat` and `unlz4` pages are embedded in the binary — read them
  with `unpin man lz4`.
- The Windows binary uses the Universal C Runtime, which is part of Windows 10
  and later. On Windows 7 or 8.1 that runtime has to be installed first — it
  comes through Windows Update.
