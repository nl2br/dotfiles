-- ================================================================================================
-- TITLE : which-key
-- ABOUT : WhichKey helps you remember your Neovim keymaps, by showing keybindings as you type.
-- LINKS :
--   > github : https://github.com/folke/which-key.nvim
-- ================================================================================================

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    win = { border = "rounded" },
    layout = { align = "center" },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    wk.add({
      { "<leader>b", group = "Buffers" },
      { "<leader>c", group = "Quickfix" },
      { "<leader>f", group = "Files" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "LSP" },
      { "<leader>s", group = "Splits / Windows" },
      { "<leader>t", group = "Terminal" },
      { "<leader>x", group = "Diagnostics" },
      { "<leader>y", group = "Clipboard" },
    })

    -- 🧭 Non-leader mappings (for visual help)
    wk.add({
      -- LSP basics
      { "gd", desc = "Go to definition" },
      { "gD", desc = "Go to declaration" },
      { "gr", desc = "List references" },
      { "gi", desc = "Go to implementation" },
      { "K",  desc = "Hover documentation" },
      { "<leader>rn", desc = "Rename symbol" },

      -- Diagnostics
      { "]d", desc = "Next diagnostic" },
      { "[d", desc = "Previous diagnostic" },
      { "]q", desc = "Next quickfix item" },
      { "[q", desc = "Previous quickfix item" },

      -- Git hunk navigation (via gitsigns)
      { "]h", desc = "Next Git hunk" },
      { "[h", desc = "Previous Git hunk" },

      -- Window movement
      { "<C-h>", desc = "Focus left window" },
      { "<C-j>", desc = "Focus below window" },
      { "<C-k>", desc = "Focus above window" },
      { "<C-l>", desc = "Focus right window" },

      -- Buffer navigation
      { "<S-h>", desc = "Previous buffer" },
      { "<S-l>", desc = "Next buffer" },

      -- Movement enhancements
      { "n", desc = "Next search result (centered)" },
      { "N", desc = "Previous search result (centered)" },
      { "*", desc = "Search word under cursor" },
      { "J", desc = "Join line (keep cursor position)" },
      { "<C-d>", desc = "Scroll down (centered)" },
      { "<C-u>", desc = "Scroll up (centered)" },

      -- Moving lines
      { "<A-j>", desc = "Move line/selection down" },
      { "<A-k>", desc = "Move line/selection up" },
    })
  end,
}

