{config, pkgs, ...}:
{ 
  programs.nushell.enable = true;
  programs.nushell.configFile.source = ./configs/nushell/config.nu;
  programs.nushell.environmentVariables = {
      EDITOR = "nvim";
    };
  programs.nushell.shellAliases = {
      l = "ls -la";
      gs = "git status";
      
    };
}
