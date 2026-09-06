{
  description = "Vladimir's Neovim configuration powered by NixVim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      ...
    }@inputs:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;

      # Evaluates standalone nixvim package for a given system
      mkNixvimPackage =
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        in
        (nixvim.lib.evalNixvim {
          inherit pkgs;
          modules = [
            ./modules
          ];
        }).config.build.package;

      # Evaluates nixvim test derivation for flake check
      mkNixvimTest =
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        in
        (nixvim.lib.evalNixvim {
          inherit pkgs;
          modules = [
            ./modules
          ];
        }).config.build.test;
    in
    {
      # Standalone packages: `nix run github:withoutboat/nix-neovim` or `nix build`
      packages = forAllSystems (system: {
        default = mkNixvimPackage system;
        neovim = mkNixvimPackage system;
      });

      # Flake checks: `nix flake check`
      checks = forAllSystems (system: {
        default = mkNixvimTest system;
      });

      # Home Manager modules (for import in withoutboat/nix-home)
      homeManagerModules = {
        default =
          { lib, ... }:
          {
            imports = [
              nixvim.homeModules.default
              {
                programs.nixvim = {
                  enable = lib.mkDefault true;
                  defaultEditor = lib.mkDefault true;
                  imports = [
                    ./modules
                  ];
                };
              }
            ];
          };
      };

      # Alias for modern Home Manager module convention
      homeModules.default = self.homeManagerModules.default;

      # NixOS modules (for system-wide installation)
      nixosModules = {
        default =
          { lib, ... }:
          {
            imports = [
              nixvim.nixosModules.default
              {
                programs.nixvim = {
                  enable = lib.mkDefault true;
                  defaultEditor = lib.mkDefault true;
                  imports = [
                    ./modules
                  ];
                };
              }
            ];
          };
      };

      # Direct NixVim module export for standalone eval reuse
      nixvimModules.default = ./modules;
    };
}
