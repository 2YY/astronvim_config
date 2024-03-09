return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "User AstroFile",
    opts = {
      suggestion = { auto_trigger = true, debounce = 150 },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        html = false,
        tsx = false,
        css = false,
        scss = false,
        sass = false,
        stylus = false,
        ["."] = false,
      }
    },
  },
  { "mattn/emmet-vim", event = "User AstroFile" },
  { "dcampos/cmp-emmet-vim", event = "User AstroFile" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = function(_, opts)
      local cmp, copilot = require "cmp", require "copilot.suggestion"

      -- NOTE: ポップアップメニューの挙動をカスタマイズしています
      -- 詳細 -> https://vim-jp.org/vimdoc-ja/options.html#'completeopt'
      cmp.setup {
        completion = {
          completeopt = 'menu,menuone,noinsert'
        }
      }

      -- NOTE: Tab キーで展開するために最適な優先度を設定しています。
      -- NOTE: emmet 使うファイルでは emmet を使い、さもなければスニペットか LSP を使う。
      opts.sources = cmp.config.sources {
        { name = "luasnip", priority = 1002 },
        { name = "emmet_vim", priority = 1001 },
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
        if copilot.is_visible() then
          copilot.accept()

        -- NOTE: If no completion is selected, insert the first one in the list.
        -- NOTE: If a completion is selected, insert this one.
        elseif cmp.visible() then
          local entry = cmp.get_selected_entry()
          if not entry then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          end
          cmp.confirm()

        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" })

      opts.mapping["<C-x>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.next() end
      end)

      opts.mapping["<C-z>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.prev() end
      end)

      opts.mapping["<C-right>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.accept_word() end
      end)

      opts.mapping["<C-l>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.accept_word() end
      end)

      opts.mapping["<C-down>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.accept_line() end
      end)

      opts.mapping["<C-j>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.accept_line() end
      end)

      opts.mapping["<C-c>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.dismiss() end
      end)

      return opts
    end,
  },
}
