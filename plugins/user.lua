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
    'Pocco81/auto-save.nvim',
    lazy = false
  },
  -- TODO: タブで展開したい (キーマップ)
  'mattn/emmet-vim',
  { 'rose-pine/neovim', name = 'rose-pine' },
}
