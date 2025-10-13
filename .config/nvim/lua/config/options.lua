-- :help X to have doc

-- Basic Settings
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10 -- Keep 10 lines above/below of cursor
vim.opt.wrap = false
vim.opt.spelllang = {"en", "fr"}

-- tabbing / indentation
vim.opt.tabstop = 2 -- tab width
vim.opt.shiftwidth = 2  -- indent width
vim.opt.softtabstop = 2
vim.opt.expandtab = true -- use space instead of tabs
vim.opt.smartindent = true
vim.opt.autoindent = true -- copy indet from current line

-- 🔍 Rendre gf intelligent pour les projets web (Vue/Nuxt/Vite)
-- vim.opt.path:append({ "**", "src/**" })
-- vim.opt.suffixesadd:append({ ".vue", ".js", ".ts", ".json" })
-- vim.opt.isfname:append("@-@")

-- Exemple :
-- "@/components/Button.vue"  → src/components/Button.vue
-- "./App.vue"                → App.vue relatif
-- "../utils/helpers.js"      → remonte correctement
-- "/src/main.js"             → trouvé aussi

-- Si tu veux que gf ouvre dans un split horizontal :
-- vim.keymap.set("n", "gf", "<cmd>split | normal! gf<CR>", { noremap = true, silent = true })

