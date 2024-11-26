{ config, pkgs, ... }:
{
   programs.tmux.enable = true;
   home.file.".config/tmux".source = ./configs/tmux;
   home.file.".config/tmux".recursive = true;
}
