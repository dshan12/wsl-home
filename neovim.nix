{ config, pkgs, ... }:

{
    programs.neovim.enable = true;
    programs.neovim.viAlias = true;
    programs.neovim.vimAlias = true;
    home.file.".config/nvim".source = ./configs/nvim
    home.file.".config/nvim".recursive = true;
  }
