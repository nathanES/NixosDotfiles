{ pkgs, ... }:
{
    imports = [
        ./common.nix
        ./services/hyprland.nix
	    ./services/games.nix
        ./services/nvidia.nix
    ];
}
