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
			nrs = "sudo nixos-rebuild switch --flake $HOME/NixosDotfiles#$(hostname)";
            nrt = "sudo nixos-rebuild test --flake $HOME/NixosDotfiles#$(hostname)";
		};
	};

    xdg.configFile."alacritty/alacritty.toml".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/config/alacritty/alacritty.toml";
    xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/config/hypr";
    xdg.configFile."git/config".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/config/git/config";
}
