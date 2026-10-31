{ pkgs, ... }:
{
    imports = [
        ./common.nix
	./services/games.nix
    ];

    nixpkgs.config.allowUnfree = true;

    # Wayland for Nvidia
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.open = true;
    hardware.nvidia.modesetting.enable = true;
}
