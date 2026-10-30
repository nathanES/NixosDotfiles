{ pkgs, ...}:
{
    imports = [
        ./common.nix
    ];

    # Packages only for framework host
    home.packages = with pkgs; [
        waybar
        hyprpaper
    ];
}
