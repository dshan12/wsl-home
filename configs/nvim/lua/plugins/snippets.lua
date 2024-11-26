return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = "v2.3.0",
    build = "make install_jsregexp",
    config = function()
      local luasnip = require("luasnip")

      luasnip.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
      })

      -- load snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      local nextjs_snippets_path = vim.fn.stdpath("config") .. "/snippets/nextjs.lua"
      local nextjs_snippets = dofile(nextjs_snippets_path)

      -- Add snippets for each filetype
      for filetype, snips in pairs(nextjs_snippets) do
        luasnip.add_snippets(filetype, snips)
      end
      -- extend filetypes
      luasnip.filetype_extend("javascript", { "javascriptreact" })
      luasnip.filetype_extend("typescript", { "typescriptreact" })
      luasnip.filetype_extend("typescript", { "typescriptreact", "javascript", "javascriptreact" })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      opts.experimental = {
        ghost_text = false,
      }

      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" })
      opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" })

      -- Add luasnip as a completion source
      table.insert(opts.sources, { name = "luasnip" })
      table.insert(opts.sources, { name = "supermaven" })
      -- Add tailwindcss-colorizer-cmp formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end

      return opts
    end,
  },
}
