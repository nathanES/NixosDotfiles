{ pkgs, caelestia-shell,  ...}:
{
    imports = [
        caelestia-shell.homeManagerModules.default
    ];

    # Packages only for framework host
    #home.packages = with pkgs; [
    #];

    programs.caelestia = {
        enable = true;
        systemd = {
            enable = false; # if you prefer starting from your compositor
            target = "graphical-session.target";
            environment = [];
        };
        settings = {
            bar.statusIcons = [
                { id = "lockStatus"; enabled = true; }
                { id = "network"; enabled = true; }
                { id = "bluetooth"; enabled = true; }
                { id = "battery"; enabled = true; }
            ];
            paths.wallpaperDir = "../../wallpapers/";
        };
        cli = {
            enable = true; # Also add caelestia-cli to path
            settings = {
                theme.enableGtk = false;
            };
        };
    };
}
