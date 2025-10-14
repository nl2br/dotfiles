-- vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
--
-- Center screen when jumping
-- vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
-- vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
--
-- -- Buffer navigation
-- vim.keymap.set("n", "<leader>bn", "<Cmd>bnext<CR>", { desc = "Next buffer" })
-- vim.keymap.set("n", "<leader>bp", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })
--
-- -- Better window navigation
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
--
-- -- Splitting & Resizing
-- vim.keymap.set("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "Split window vertically" })
-- vim.keymap.set("n", "<leader>sh", "<Cmd>split<CR>", { desc = "Split window horizontally" })
-- vim.keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
-- vim.keymap.set("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
-- vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
-- vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })
--
-- -- Better indenting in visual mode
-- vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
-- vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
--
-- -- Better J behavior
-- vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })
--
-- -- Quick config editing
-- vim.keymap.set("n", "<leader>rc", "<Cmd>e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })
--


-- =========================================================
-- Popular Neovim keymaps (leader = <Space>)
-- =========================================================
vim.g.mapleader = " "

-- 🔹 Basic editing
vim.keymap.set("n", "Y", "y$", { noremap = true, silent = true, desc = "Yank until end of line" })
vim.keymap.set("x", "p", [["_dP]], { noremap = true, silent = true, desc = "Paste without overwriting register" })
vim.keymap.set({ "n", "x" }, "<", "<gv", { noremap = true, silent = true, desc = "Dedent and keep selection" })
vim.keymap.set({ "n", "x" }, ">", ">gv", { noremap = true, silent = true, desc = "Indent and keep selection" })
vim.keymap.set({ "n", "i", "x" }, "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = "Quit current window" })
vim.keymap.set("n", "<leader>Q", ":qa!<CR>", { noremap = true, silent = true, desc = "Quit all (force)" })

-- 🔹 Movement
vim.keymap.set("n", "J", "mzJ`z", { noremap = true, silent = true, desc = "Join line and keep cursor" })
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true, desc = "Next search result centered" })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true, desc = "Previous search result centered" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Scroll down centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Scroll up centered" })
vim.keymap.set("n", "*", "*zzzv", { noremap = true, silent = true, desc = "Search word under cursor centered" })

-- 🔹 Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { noremap = true, silent = true, desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { noremap = true, silent = true, desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { noremap = true, silent = true, desc = "Equalize window sizes" })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { noremap = true, silent = true, desc = "Close current split" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Focus left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Focus below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Focus above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Focus right window" })

-- 🔹 Buffers
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true, desc = "Close buffer" })
vim.keymap.set("n", "<leader>bo", ":%bd|e#<CR>", { noremap = true, silent = true, desc = "Close all buffers except current" })

-- 🔹 File explorer (adjust depending on your setup)
-- vim.keymap.set("n", "<leader>e", ":Lexplore %:p:h<CR>", { noremap = true, silent = true, desc = "Open file explorer" })

-- 🔹 Telescope
-- pcall(function()
--   local tb = require("telescope.builtin")
--   vim.keymap.set("n", "<leader>ff", tb.find_files, { desc = "Find files" })
--   vim.keymap.set("n", "<leader>fg", tb.live_grep, { desc = "Live grep" })
--   vim.keymap.set("n", "<leader>fb", tb.buffers, { desc = "List buffers" })
--   vim.keymap.set("n", "<leader>fh", tb.help_tags, { desc = "Help tags" })
--   vim.keymap.set("n", "<leader>fr", tb.resume, { desc = "Resume last search" })
-- end)

-- 🔹 LSP
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" })
-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "Go to declaration" })
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true, desc = "List references" })
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true, silent = true, desc = "Go to implementation" })
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Hover documentation" })
-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename symbol" })
-- vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code action" })
-- vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format({ async = true }) end, { noremap = true, silent = true, desc = "Format file" })

-- 🔹 Diagnostics
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "Previous diagnostic" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>xx", vim.diagnostic.setloclist, { noremap = true, silent = true, desc = "Open diagnostics list" })

-- 🔹 Git (gitsigns)
-- pcall(function()
--   local gs = require("gitsigns")
--   vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next hunk" })
--   vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Previous hunk" })
--   vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
--   vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
--   vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
--   vim.keymap.set("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { desc = "Blame line" })
-- end)


-- 🔹 Quickfix
vim.keymap.set("n", "<leader>co", ":copen<CR>", { noremap = true, silent = true, desc = "Open quickfix list" })
vim.keymap.set("n", "<leader>cc", ":cclose<CR>", { noremap = true, silent = true, desc = "Close quickfix list" })
vim.keymap.set("n", "]q", ":cnext<CR>", { noremap = true, silent = true, desc = "Next quickfix item" })
vim.keymap.set("n", "[q", ":cprev<CR>", { noremap = true, silent = true, desc = "Previous quickfix item" })

-- 🔹 Terminal
vim.keymap.set("n", "<leader>tt", ":terminal<CR>", { noremap = true, silent = true, desc = "Open terminal" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })

-- 🔹 Clipboard
vim.keymap.set({ "n", "x" }, "<leader>y", [["+y]], { noremap = true, silent = true, desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { noremap = true, silent = true, desc = "Yank full line to clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>d", [["_d]], { noremap = true, silent = true, desc = "Delete without yanking" })

-- 🔹 Move lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })
vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection down" })
vim.keymap.set("x", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection up" })



-- Search exact match in all files with telescope
vim.keymap.set("n", "<leader>fw", function()
  local word = vim.fn.expand("<cword>")
  require("telescope.builtin").live_grep({
    default_text = "\\b" .. word .. "\\b",
  })
end, { desc = "Telescope - grep exact word under the cursor" })

