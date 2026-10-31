{ config, pkgs, lib, ... }:
{
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
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
