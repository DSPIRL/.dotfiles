{ config, pkgs, ... };

if stdenv.hostPlatform.system = "linux" then
    {
        environment.systemPackages = [
            nixpkgs.zsh
            nixpkgs.eza
            nixpkgs.zsh-autosuggestions
            nixpkgs.zsh-syntax-highlighting
            nixpkgs.silicon
        ];
    }
else if stdenv.hostPlatform.system = "darwin" then
    {
        environment.systemPackages = [
            nixpkgs.zsh
            nixpkgs.eza
            nixpkgs.zsh-autosuggestions
            nixpkgs.zsh-syntax-highlighting
            nixpkgs.silicon
        ];
    }
