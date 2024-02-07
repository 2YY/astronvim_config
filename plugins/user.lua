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
    "danymat/neogen",
    cmd = "Neogen",
    opts = {
      snippet_engine = "luasnip",
      languages = {
        lua = { template = { annotation_convention = "emmylua" } },
        typescript = { template = { annotation_convention = "tsdoc" } },
        typescriptreact = { template = { annotation_convention = "tsdoc" } },
      },
    },
  },
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
    'kylechui/nvim-surround',
      version = '*',
      event = 'VeryLazy',
      config = function()
        require('nvim-surround').setup({})
      end
  },
  {
    'mattn/emmet-vim',
    lazy = false
  },
  {
    'olimorris/onedarkpro.nvim',
    name = 'onedark',
    priority = 1000
  },
  {
    'Pocco81/auto-save.nvim',
    lazy = false
  },
  {
    'sindrets/diffview.nvim',
    lazy = false
  }
}

