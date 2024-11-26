return {
  {
    "aserowy/tmux.nvim",
    config = function()
      return require("tmux").setup()
    end,
  },
  {
    "alexghergh/nvim-tmux-navigation",
    event = "VeryLazy",
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")
      nvim_tmux_nav.setup({
        disable_when_zoomed = true,
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          last_active = "<C-\\>",
          next = "<C-Space>",
        },
      })
    end,
  },
  {
    "christoomey/vim-tmux-navigator",

    keys = {

      { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Go to the previous pane" },

      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Got to the left pane" },

      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Got to the down pane" },

      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Got to the up pane" },

      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Got to the right pane" },
    },
  },
}
