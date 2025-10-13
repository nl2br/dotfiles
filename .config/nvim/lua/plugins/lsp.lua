return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- Mason + mason-lspconfig
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "vtsls", "vue_ls" },
    })

    -- Capabilities + on_attach (désactive le format côté LSP)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    pcall(function()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    end)

    local function on_attach(client, bufnr)
      if client.server_capabilities then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end
      local o = { buffer = bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, o)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, o)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, o)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, o)
    end

local vue_plugin_path = vim.fn.stdpath("data")
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

-- Set default root markers for all clients
vim.lsp.config('*', {
  root_markers = { '.git' },
})

vim.lsp.config("vtsls", {
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  on_attach = function(client, bufnr)
    if vim.bo[bufnr].filetype == "vue" then
      -- éviter les collisions avec Volar sur .vue
      client.server_capabilities.semanticTokensProvider = nil
    end
    if client.server_capabilities then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end
    -- mapping sûr pour gd
    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition({ reuse_win = false })
    end, { buffer = bufnr, desc = "LSP: go to definition" })
  end,
  capabilities = (function()
    local caps = vim.lsp.protocol.make_client_capabilities()
    pcall(function() caps = require("cmp_nvim_lsp").default_capabilities(caps) end)
    return caps
  end)(),
  -- ⚠️ plugin @vue/typescript-plugin pour comprendre les SFC
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_plugin_path,
            languages = { "vue" },
          },
        },
      },
    },
  },
})

-- Lua (pour ta config Neovim)
vim.lsp.config("lua_ls", {
  on_attach = function(client, bufnr)
    if client.server_capabilities then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end
  end,
  capabilities = (function()
    local caps = vim.lsp.protocol.make_client_capabilities()
    pcall(function() caps = require("cmp_nvim_lsp").default_capabilities(caps) end)
    return caps
  end)(),
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },      -- ⬅️ dit au LSP que 'vim' existe
      workspace = {
        checkThirdParty = false,                  -- évite le prompt 3rd-party
        library = { vim.env.VIMRUNTIME },         -- API de Neovim
      },
      telemetry = { enable = false },
    },
  },
})

    vim.lsp.config("vue_ls", {
      filetypes = { "vue" },
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        vue = { hybridMode = true }, -- recommandé avec VTSLS
      },
    })

vim.lsp.config("eslint", {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "vue" },
  settings = {
    -- empêche ESLint de formatter (on garde Prettier)
    format = false,
    codeAction = {
      disableRuleComment = { enable = true, location = "separateLine" },
      showDocumentation = { enable = true },
    },
  },
  on_attach = function(client, bufnr)
    -- désactive le formatage
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    -- clé pratique pour corriger rapidement
    vim.keymap.set("n", "<leader>el", "<cmd>EslintFixAll<CR>", { buffer = bufnr, desc = "ESLint fix all" })
  end,
})


    -- Activer
    vim.lsp.enable("vtsls")
    vim.lsp.enable("vue_ls")
    vim.lsp.enable("lua_ls")

    -- Au cas où : déclarer le ft .vue
    vim.filetype.add({ extension = { vue = "vue" } })
  end,
}

