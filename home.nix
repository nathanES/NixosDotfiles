{ config, pkgs, ...}:
let
	username = "nathan";
	dotfiles ="${config.home.homeDirectory}/dotfiles/config";
	create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
	apps = [
      		"alacritty"
		"hypr"
	];
	configs = builtins.listToAttrs(
		map ( x :{
			name = x;
			value = x;
		}) apps
	);
in
{
	home.username = "${username}";
	home.homeDirectory = "/home/${username}";
	home.stateVersion = "26.05";
	programs.bash = {
		enable = true;
		shellAliases = {
			nrs = "sudo nixos-rebuild switch";
			nrsf = "sudo nixos-rebuild switch --flake";
		};
	};

	xdg.configFile = builtins.mapAttrs (name: subpath: {
		source = create_symlink "${dotfiles}/${subpath}";
		recursive = true;
	}) configs;
}
