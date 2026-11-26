{ config, pkgs, lib, ... }:
{
    nixpkgs.config.allowUnfreePackages = [
	"ankama-launcher"
        "steam"
        "steam-unwrapped"
    ];
    environment.systemPackages = with pkgs; [
	ankama-launcher
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
