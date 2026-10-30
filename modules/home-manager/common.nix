{ pkgs, ... }:
{
    home.username = "nathan";
    home.homeDirectory = "/home/nathan";

    home.stateVersion = "26.05";

    # Packages for all hosts
    home.packages = with pkgs; [
        wget
        curl
        hyprpaper
        alacritty
    ];

	programs.bash = {
		enable = true;
		shellAliases = {
			nrs = "sudo nixos-rebuild switch";
			nrsf = "sudo nixos-rebuild switch --flake";
		};
	};

    xdg.configFile."alacritty/alacritty.toml".source = ../../config/alacritty/alacritty.toml;
    xdg.configFile."hypr".source = ../../config/hypr;
}
