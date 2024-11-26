{ config, pkgs, ... }:

{
  programs.navi.enable = true;
  programs.navi.enableZshIntegration = true;
  home.file.".config/navi".source = ./configs/navi;
  home.file.".config/navi".recursive = true;
}
