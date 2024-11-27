# Nushell configuration

let-env config = {
  # Enable syntax highlighting
  syntax_highlight = true

  # Customize syntax highlighting colors
  color_config = {
    commands = "green bold"
    parameters = "cyan"
    operators = "purple"
    # ... other color settings
  }

  # Line editor settings for autocompletion
  line_editor = {
    completion_type = "list" # options: circular, list, none
    max_history_size = 1000
    # ... other line editor settings
  }
}

