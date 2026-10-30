{ pkgs, ... }:
{
    services.getty.autologinUser = "nathan";

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.nathan = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
        packages = with pkgs; [
        tree
        ];
    };

    time.timeZone = "Europe/Paris";
    i18n.defaultLocale = "fr_FR.UTF-8";

    networking.networkmanager.enable = true;

    fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
    ];

    nix.settings.experimental-features = [
        "nix-command"
        "flakes"
    ];

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;
}
