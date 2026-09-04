# lz4

[lz4](https://github.com/lz4/lz4) — extremely fast lossless compression (the `lz4` command-line program, plus the `lz4cat` and `unlz4` shortcuts). A single self-contained binary, built natively for Linux, macOS, and Windows.

[![CI](https://github.com/unpins/lz4/actions/workflows/lz4.yml/badge.svg)](https://github.com/unpins/lz4/actions)
![Linux](https://img.shields.io/badge/Linux-✓-success?logo=linux&logoColor=white)
![macOS](https://img.shields.io/badge/macOS-✓-success?logo=apple&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-✓-success?logo=windows&logoColor=white)

Part of the [unpins](https://unpins.org) catalog; install it with [`unpin`](https://github.com/unpins/unpin): `unpin install lz4`.

## Usage

Run with [unpin](https://github.com/unpins/unpin):

```bash
unpin lz4 file              # file -> file.lz4
unpin lz4 -d file.lz4       # decompress
echo hi | unpin lz4 | unpin lz4 -dc
```

To install onto your PATH:

```bash
unpin install lz4
```

`unpin install lz4` creates `lz4`, `lz4cat` (= `lz4 -dc`) and `unlz4` (= `lz4 -d`). `unpin info lz4` lists them.

## Man pages

The `lz4`, `lz4cat` and `unlz4` pages are embedded in the binary — read them with `unpin man lz4`, `unpin man lz4 lz4cat` and `unpin man lz4 unlz4`.

## Build locally

```bash
nix build github:unpins/lz4
./result/bin/lz4 --version
```

Or run directly:

```bash
nix run github:unpins/lz4 -- --version
```

The first invocation will offer to add the [unpins.cachix.org](https://unpins.cachix.org) substituter so most pulls come pre-built.

## Manual download

The [Releases](https://github.com/unpins/lz4/releases) page has standalone binaries for manual download.

## Build notes

- **Platforms:** Linux (x86_64, i686, ppc64le, riscv64, aarch64, armv7l), macOS (x86_64, aarch64), Windows (x86_64).
- **Aliases:** `lz4cat`/`unlz4` are `argv[0]`-dispatch names of the one `lz4` binary, embedded as unpin aliases.
- **Windows:** a single `lz4.exe` targeting the mingw-w64 runtime — no companion DLLs.
- **Tests:** lz4's upstream `make test` is a long-running fuzzer/benchmark harness (not a quick pass/fail suite), so it isn't wired into the build; the release smoke test exercises a compress/decompress round-trip instead.
