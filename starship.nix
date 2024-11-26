{config, pkgs, ...}:
{ 
  programs.starship.enable = true;
  home.file.".config/starship/starship.toml".source = ./configs/starship/starship.toml;
}
