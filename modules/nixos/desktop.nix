{ pkgs, ... }:
{
    imports = [
        ./common.nix
	    ./services/games.nix
        ./services/nvidia.nix
    ];
}
