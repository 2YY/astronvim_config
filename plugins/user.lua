return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      cmp.setup {
        completion = {
          completeopt = 'menu,menuone,noinsert'
        }
      }
      opts.mapping["<Tab>"] = vim.NIL
      return opts
    end,
  },
  { "junegunn/vim-easy-align", event = "User AstroFile" },
  {
    'mattn/emmet-vim',
    lazy = false
  },
}

