{ config, lib, pkgs, ... }:
{
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    programs.bash.loginShellInit = ''
        if [ "$(tty)" = "/dev/tty1" ] && [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
            exec start-hyprland
        fi
    '';

    environment.systemPackages = with pkgs; [
        kitty
    ];

}
