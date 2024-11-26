{ config, pkgs, ... }:

{
   programs.tmux.enable = true;
   home.file.".config/tmux/tmux.conf".source = ./configs/tmux/tmux.conf;
  }