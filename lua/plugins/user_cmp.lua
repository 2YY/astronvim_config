return {
  { "mattn/emmet-vim", event = "User AstroFile" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = function(_, opts)
      local cmp = require "cmp"

      -- NOTE: ポップアップメニューの挙動をカスタマイズしています
      -- 詳細 -> https://vim-jp.org/vimdoc-ja/options.html#'completeopt'
      cmp.setup {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
      }

      -- NOTE: Tab キーで展開するために最適な優先度を設定しています。
      -- NOTE: emmet 使うファイルでは emmet を使い、さもなければスニペットか LSP を使う。
      opts.sources = cmp.config.sources {
        { name = "luasnip", priority = 1002 },
        { name = "nvim_lsp", priority = 1000 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      }

      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then return end
      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end
      if not opts.mapping then opts.mapping = {} end

      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        -- NOTE: If no completion is selected, insert the first one in the list.
        -- NOTE: If a completion is selected, insert this one.
        if cmp.visible() then
          local entry = cmp.get_selected_entry()
          if not entry then cmp.select_next_item { behavior = cmp.SelectBehavior.Select } end
          cmp.confirm()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" })

      return opts
    end,
  },
}
