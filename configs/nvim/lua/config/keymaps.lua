local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Trouble mappings
map("n", "<leader>tx", function()
  require("trouble").toggle("diagnostics")
end, opts)

map("n", "<leader>tq", function()
  require("trouble").toggle("quickfix")
end, opts)

map("n", "tn", function()
  require("trouble").next({ skip_groups = true, jump = true })
end, opts)

map("n", "tp", function()
  require("trouble").prev({ skip_groups = true, jump = true })
end, opts)

map("n", "<leader>xc", function()
  require("trouble").close()
end, opts)

-- General mappings
map("n", ";", ":", opts)
map("i", "jk", "<ESC>")

-- Save and quit mappings

map("n", "<leader>qq", ":q<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>x", ":bd<CR>", opts)
-- Split window
map("n", "ss", ":split<CR>", opts)
map("n", "vs", ":vsplit<CR>", opts)

-- Move windows
map("n", "<A-a>", "<C-w>", opts)

map("n", "<A-l>", ":vertical resize +2<cr>", opts)
map("n", "<A-h>", ":vertical resize -2<cr>", opts)
map("n", "<A-j>", ":resize -2<cr>", opts)
map("n", "<A-k>", ":resize +2<cr>", opts)
