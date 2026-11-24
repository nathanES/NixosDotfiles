{ pkgs, config, hostname, ... }:
let
    dotfiles = "/home/nathan/NixosDotfiles";
    link = config.lib.file.mkOutOfStoreSymlink;
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
        yazi
    ];

	programs.bash = {
		enable = true;
		shellAliases = {
		    nrs = "sudo nixos-rebuild switch --flake $HOME/NixosDotfiles#$(hostname)";
		    nrt = "sudo nixos-rebuild test --flake $HOME/NixosDotfiles#$(hostname)";
		};
	};

    xdg.configFile."alacritty/common.toml".source = link "${dotfiles}/config/alacritty/common.toml";
    xdg.configFile."alacritty/${hostname}.toml".source = link "${dotfiles}/config/alacritty/${hostname}.toml";
    xdg.configFile."alacritty/alacritty.toml".text = ''
    [general]
    import = [
        "${config.home.homeDirectory}/.config/alacritty/common.toml",
        "${config.home.homeDirectory}/.config/alacritty/${hostname}.toml"
    ]
    '';

    xdg.configFile."hypr/common.lua".source  = link "${dotfiles}/config/hypr/common.lua";
    xdg.configFile."hypr/${hostname}.lua".source  = link "${dotfiles}/config/hypr/${hostname}.lua";
    xdg.configFile."hypr/hyprland.lua".text = ''
    require("common")
    require("${hostname}")
    '';

    xdg.configFile."git/config".source = link "${dotfiles}/config/git/config";
}
