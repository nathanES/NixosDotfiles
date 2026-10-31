{ config, lib, pkgs, ... }:
{
    imports = [
        ./hardware-configuration.nix
        ../../modules/nixos/desktop.nix
    ];

    networking.hostName = "desktop";

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    environment.systemPackages = with pkgs; [
        vim
        git
	    chromium
    ];

    system.stateVersion = "26.05"; # NEVER delete this line
}

