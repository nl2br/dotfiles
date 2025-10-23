-- lua/plugins/mason-tools.lua
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- formatters/linters CLI
        "eslint",     -- ou "eslint" si tu préfères sans daemon
        "prettier",     -- ou "prettierd"
        "stylua",
      },
      run_on_start = true,
    })
  end,
}

