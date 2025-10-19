return {
  -- Diff côte-à-côte (comme VS Code)
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
        use_icons = true,
        view = { default = { layout = "diff2_horizontal" } },
        file_panel = { win_config = { position = "left", width = 35 } },
      })
      -- Raccourcis diff
      vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Git: Diff (project)" })
      vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewClose<CR>", { desc = "Git: Close Diff" })
      vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { desc = "Git: File History" })
      vim.keymap.set("n", "<leader>gH", "<cmd>DiffviewFileHistory<CR>", { desc = "Git: Repo History" })
    end,
  },

  -- Signes git + actions sur les hunks
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "▎" },
          change       = { text = "▎" },
          delete       = { text = "" },
          topdelete    = { text = "" },
          changedelete = { text = "▎" },
        },
        current_line_blame = false,
      })

      -- Mappings hunk (buffer-local, simples et efficaces)
      local gs = require("gitsigns")
      local map = function(mode, lhs, rhs, desc) vim.keymap.set(mode, lhs, rhs, { desc = desc }) end

      map("n", "]h", gs.next_hunk, "Git: Next hunk")
      map("n", "[h", gs.prev_hunk, "Git: Prev hunk")
      -- map("n", "<leader>gs", gs.stage_hunk, "Git: Stage hunk")
      map("n", "<leader>gr", gs.reset_hunk, "Git: Reset hunk")
      map("v", "<leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Git: Stage hunk (sel)")
      map("v", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Git: Reset hunk (sel)")
      -- map("n", "<leader>gS", gs.stage_buffer, "Git: Stage buffer")
      -- map("n", "<leader>gR", gs.reset_buffer, "Git: Reset buffer")
      map("n", "<leader>gp", gs.preview_hunk, "Git: Preview hunk")
      -- map("n", "<leader>gu", gs.undo_stage_hunk, "Git: Undo stage hunk")
      map("n", "<leader>gb", gs.toggle_current_line_blame, "Git: Toggle blame line")
      map("n", "<leader>gB", function() gs.blame_line({ full = true }) end, "Git: Blame (full)")
      -- map("n", "<leader>gd", gs.toggle_deleted, "Git: Toggle deleted")
    end,
  },

  -- LazyGit (UI Git ultra pratique)
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitCurrentFile", "LazyGitConfig" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>gl", "<cmd>LazyGit<CR>", desc = "Git: LazyGit" },
    },
    init = function()
      -- ouvre LazyGit dans le dossier du repo courant
      vim.g.lazygit_use_custom_config_file_path = 0
    end,
  },
}

