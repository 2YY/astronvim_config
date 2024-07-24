return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      show_help = true,
      debug = false,
      model= "gpt-4-0125-preview",
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      { "<Leader><Leader>", ":CopilotChat ", desc = "CopilotChat" },
      { "<Leader>1", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle Vsplit" },
      { "<Leader>2", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix diagnostic", mode = "v" },
      { "<Leader>3", "<cmd>CopilotChatDocs<cr>", desc = "CopilotChat - Add documentation comment", mode = "v" },
      { "<Leader>4", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests", mode = "v" },
      { "<Leader>5", "<cmd>CopilotChatCommitStaged<cr>", desc = "CopilotChat - Write commit message for staged files" },
      { "<Leader>7", "<cmd>CopilotChatFix<cr>", desc = "CopilotChat - Fix", mode = "v" },
      { "<Leader>8", "<cmd>CopilotChatOptimize<cr>", desc = "CopilotChat - Optimize", mode = "v" },
      { "<Leader>9", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review", mode = "v" },
    },
  }
}
