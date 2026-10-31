{ config, pkgs, lib, ... }:
{
    nixpkgs.config.allowUnfreePredicate = [
        "steam"
        "steam-unwrapped"
    ];

    programs.steam = {
        enable = true;
    };

    programs = {
        gamescope = {
            enable = true;
            capSysNice = true;
        };
        steam.gamescopeSession.enable = true;
    };
}
