{ pkgs, ...}:
{
    #imports = [
    #];

    # Packages only for framework host
    home.packages = with pkgs; [
        waybar
        hyprpaper
    ];
}
