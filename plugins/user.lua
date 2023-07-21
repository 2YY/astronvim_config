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
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'User AstroFile',
    cmd = { 'TodoQuickFix' },
    -- TODO: エラーが出る
    -- keys = {
    --   { '<leader>T', '<cmd>TodoTelescope<cr>', desc = 'TODOリストをTelescopeで開く' }
    -- }
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
  {
    'Pocco81/auto-save.nvim',
    lazy = false
  },
  {
    'mattn/emmet-vim',
    lazy = false
  },
  {
    'olimorris/onedarkpro.nvim',
    name = 'onedark',
    priority = 1000
  }
}

