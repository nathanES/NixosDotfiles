{ config, lib, pkgs, ... }:
{
    imports = [
        ./hardware-configuration.nix
        ../../modules/nixos/framework.nix
    ];

    networking.hostName = "framework";

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    #programs.bash.loginShellInit = ''
        #if [ "$(tty)" = "/dev/tty1" ] && [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
        #exec start-hyprland
        #fi
    #'';

    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
        vim
        kitty # For hyprland
        git
        chromium
    ];

    system.stateVersion = "26.05"; # NEVER delete this line
}

