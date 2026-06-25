{
  description = "lz4 as a single self-contained binary";

  nixConfig = {
    extra-substituters = [ "https://unpins.cachix.org" ];
    extra-trusted-public-keys = [ "unpins.cachix.org-1:DDaShjbZ8VvcqxeTcAU3kV9vxZQBlyb7V/uLBHfTynI=" ];
  };

  inputs.unpins-lib.url = "github:unpins/nix-lib";

  # lz4 ships the `lz4` binary plus `lz4cat`/`unlz4` argv[0]-dispatch symlinks
  # (lz4cat = lz4 -dc, unlz4 = lz4 -d). Embed those as UNPIN_META aliases.
  # Native from pkgsStatic; Windows via mingw (lz4 is portable C). The lz4/
  # unlz4/lz4cat man pages are exactly what we ship, so no man pruning.
  outputs = { self, unpins-lib }:
    let lib = unpins-lib.lib;
    in
    lib.mkStandaloneFlake {
      inherit self;
      name = "lz4";

      # Build via the unpin-llvm engine + emit a bitcode multicall module.
      engine = "unpin-llvm";
      multicall = {
        programs = [{ name = "lz4"; aliases = [ "lz4cat" "unlz4" ]; }];
      };
      # `lz4 --version` → "*** lz4 v1.10.0 64-bit …, by Yann Collet ***" on every
      # target (native/darwin/wine). Match the stable author string, not the
      # version number, so a future nixpkgs lz4 bump doesn't silently break smoke.
      smoke = [ "--version" ];
      smokePattern = "Yann Collet";
      build = pkgs:
        lib.withAliases pkgs { primary = "lz4"; aliases = [ "lz4cat" "unlz4" ]; }
          pkgs.pkgsStatic.lz4;
      windowsBuild = pkgs:
        lib.withAliases pkgs { primary = "lz4.exe"; aliases = [ "lz4cat" "unlz4" ]; }
          (lib.mingwStaticCross pkgs).lz4;
    };
}
