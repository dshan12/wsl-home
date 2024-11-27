{config, pkgs, ...}:
{ 
  programs.nushell.enable = true;
  extraConfig = ''
    # Set the color configuration
    let-env config = {
      line_editor: {
        # Enable or disable autocompletion suggestions
        completion_type: "list", # options: circular, list, none
        max_history_size: 1000,
        # ... other line editor settings
      }
      color_config: {
        # Define colors for different syntactic elements
        commands: "green bold",
        parameters: "cyan",
        operators: "purple",
        # ... other color settings
      }
    }
  '';
};
