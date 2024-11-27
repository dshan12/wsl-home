{config, pkgs, ...}:
{
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.ohMyZsh = {
      enable = true;
    }
}
