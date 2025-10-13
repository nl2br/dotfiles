-- ~/.config/nvim/lua/plugins/format.lua
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },

  -- lazy.nvim appellera automatiquement require("conform").setup(opts)
  opts = {
    -- Formater à l'enregistrement, sans fallback LSP (on veut Prettier uniquement)
    format_on_save = { timeout_ms = 2000, lsp_fallback = false },

    -- Mappage fichiers -> formateurs (priorité dans l'ordre)
    formatters_by_ft = {
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      vue = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },
      markdown = { "prettier" },
      yaml = { "prettier" },
    },

    -- Préfère le binaire local du projet, comme VS Code
    formatters = {
      prettier = {
        -- cherche d’abord ./node_modules/.bin/prettier
        prefer_local = "node_modules/.bin",
      },
      -- Si votre repo n’a pas Prettier et que vous utilisez eslint --fix :
      -- eslint_d = { prefer_local = "node_modules/.bin" },
            -- 🔒 Hard-disable eslint_d au cas où il viendrait d'ailleurs
      eslint_d = {
        condition = function() return false end,
      },
      eslint = {
        condition = function() return false end,
      },
    },
  },

  init = function()
    -- Laisse Conform gérer le formatexpr
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

    -- ✅ Commande manuelle de formatage
    vim.api.nvim_create_user_command("Format", function()
      require("conform").format({ async = true, lsp_fallback = false })
    end, { desc = "Format current buffer with Conform" })

    -- ✅ Raccourci clavier : <leader>F
    vim.keymap.set("n", "<leader>F", function()
      require("conform").format({ async = true, lsp_fallback = false })
    end, { desc = "Format file" })
  end,

}

