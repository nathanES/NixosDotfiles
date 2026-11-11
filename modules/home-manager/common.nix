{ pkgs, config, ... }:
let 
    dotfiles = "/home/nathan/NixosDotfiles";
in
{
    home.username = "nathan";
    home.homeDirectory = "/home/nathan";

    home.stateVersion = "26.05";

    # Packages for all hosts
    home.packages = with pkgs; [
        wget
        curl
        alacritty
        ani-cli
	vlc
    ];

	programs.bash = {
		enable = true;
		shellAliases = {
			nrs = "sudo nixos-rebuild switch";
			nrsf = "sudo nixos-rebuild switch --flake";
		};
	};

    xdg.configFile."alacritty/alacritty.toml".source = ../../config/alacritty/alacritty.toml;
    xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/config/hypr";
    xdg.configFile."git/config".source = ../../config/git/config;
}
