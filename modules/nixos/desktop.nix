{ pkgs, ... }:
{
    imports = [
        ./services/hyprland.nix
	./services/games.nix
        ./services/nvidia.nix
    ];
}
