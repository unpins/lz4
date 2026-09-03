# Changelog

## [Unreleased]

### Changed

- The Windows binary is now built by the same compiler as the Linux and macOS
  ones, and is 35% smaller (389 KB to 251 KB). Checked on Windows 10 under all
  three names, including compressing with `lz4` and reading it back with
  `lz4cat`.

  It now uses the Universal C Runtime, which is part of Windows 10 and later.
  On Windows 7 or 8.1 that runtime has to be installed first — it comes through
  Windows Update. The previous binary did not need it.
