return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>ff",
      function()
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")
        require("telescope.builtin").find_files({
          find_command = { "git", "ls-files", "--cached", "--others", "--exclude-standard" },
          attach_mappings = function(prompt_bufnr, map)
            local function on_select()
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)

              if selection then
                local current_win = vim.api.nvim_get_current_win()
                local current_buf = vim.api.nvim_get_current_buf()
                local new_file = selection.value

                -- Load the new file into the buffer
                vim.cmd("edit " .. vim.fn.fnameescape(new_file))

                -- Delete the original buffer if it is not displayed elsewhere
                if vim.fn.buflisted(current_buf) == 1 and vim.fn.bufwinnr(current_buf) == -1 then
                  vim.api.nvim_buf_delete(current_buf, { force = true })
                end

                -- Trigger a custom event for integrations
                vim.api.nvim_exec_autocmds("User", { pattern = "TelescopeFileOpened", data = { filename = new_file } })
              end
            end

            -- Replace the default action with our custom logic
            actions.select_default:replace(on_select)

            return true
          end,
        })
      end,
      desc = "Find files (replace current buffer)",
    },
  },
}
