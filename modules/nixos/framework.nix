{ config, lib, pkgs,  ... }:
{
    imports = [
        ./services/hyprland.nix
	./services/games.nix
    ];
    services.upower.enable = true;
}
