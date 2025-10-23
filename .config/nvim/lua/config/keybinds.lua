-- vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.ex)
--
-- center screen when jumping
-- vim.keymap.set("n", "n", "nzzzv", { desc = "next search result (centered)" })
-- vim.keymap.set("n", "n", "nzzzv", { desc = "previous search result (centered)" })
--
-- -- buffer navigation
-- vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "next buffer" })
-- vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "previous buffer" })
--
-- -- better window navigation
-- vim.keymap.set("n", "<c-h>", "<c-w>h", { desc = "move to left window" })
-- vim.keymap.set("n", "<c-j>", "<c-w>j", { desc = "move to bottom window" })
-- vim.keymap.set("n", "<c-k>", "<c-w>k", { desc = "move to top window" })
-- vim.keymap.set("n", "<c-l>", "<c-w>l", { desc = "move to right window" })
--
-- -- splitting & resizing
-- vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "split window vertically" })
-- vim.keymap.set("n", "<leader>sh", "<cmd>split<cr>", { desc = "split window horizontally" })
-- vim.keymap.set("n", "<c-up>", "<cmd>resize +2<cr>", { desc = "increase window height" })
-- vim.keymap.set("n", "<c-down>", "<cmd>resize -2<cr>", { desc = "decrease window height" })
-- vim.keymap.set("n", "<c-left>", "<cmd>vertical resize -2<cr>", { desc = "decrease window width" })
-- vim.keymap.set("n", "<c-right>", "<cmd>vertical resize +2<cr>", { desc = "increase window width" })
--
-- -- better indenting in visual mode
-- vim.keymap.set("v", "<", "<gv", { desc = "indent left and reselect" })
-- vim.keymap.set("v", ">", ">gv", { desc = "indent right and reselect" })
--
-- -- better j behavior
-- vim.keymap.set("n", "j", "mzj`z", { desc = "join lines and keep cursor position" })
--
-- -- quick config editing
-- vim.keymap.set("n", "<leader>rc", "<cmd>e ~/.config/nvim/init.lua<cr>", { desc = "edit config" })
--


-- =========================================================
-- popular neovim keymaps (leader = <space>)
-- =========================================================
vim.g.mapleader = " "

-- 🔹 basic editing
vim.keymap.set("n", "y", "y$", { noremap = true, silent = true, desc = "yank until end of line" })
vim.keymap.set("x", "p", [["_dp]], { noremap = true, silent = true, desc = "paste without overwriting register" })
vim.keymap.set({ "n", "x" }, "<", "<gv", { noremap = true, silent = true, desc = "dedent and keep selection" })
vim.keymap.set({ "n", "x" }, ">", ">gv", { noremap = true, silent = true, desc = "indent and keep selection" })
vim.keymap.set({ "n", "i", "x" }, "<c-s>", "<esc>:w<cr>", { noremap = true, silent = true, desc = "save file" })
vim.keymap.set("n", "<leader>q", ":q<cr>", { noremap = true, silent = true, desc = "quit current window" })
vim.keymap.set("n", "<leader>q", ":qa!<cr>", { noremap = true, silent = true, desc = "quit all (force)" })

-- 🔹 movement
-- vim.keymap.set("n", "j", "mzj`z", { noremap = true, silent = true, desc = "join line and keep cursor" })
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true, desc = "next search result centered" })
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true, desc = "previous search result centered" })
vim.keymap.set("n", "<c-d>", "<c-d>zz", { noremap = true, silent = true, desc = "scroll down centered" })
vim.keymap.set("n", "<c-u>", "<c-u>zz", { noremap = true, silent = true, desc = "scroll up centered" })
vim.keymap.set("n", "*", "*zzzv", { noremap = true, silent = true, desc = "search word under cursor centered" })
-- garder la ligne centrée à chaque mouvement vertical
-- vim.keymap.set('n', 'j', 'jzz', { noremap = true, silent = true })
-- vim.keymap.set('n', 'k', 'kzz', { noremap = true, silent = true })



-- 🔹 window management
vim.keymap.set("n", "<leader>sv", "<c-w>v", { noremap = true, silent = true, desc = "split window vertically" })
vim.keymap.set("n", "<leader>sh", "<c-w>s", { noremap = true, silent = true, desc = "split window horizontally" })
vim.keymap.set("n", "<leader>se", "<c-w>=", { noremap = true, silent = true, desc = "equalize window sizes" })
vim.keymap.set("n", "<leader>sx", ":close<cr>", { noremap = true, silent = true, desc = "close current split" })
vim.keymap.set("n", "<c-h>", "<c-w>h", { noremap = true, silent = true, desc = "focus left window" })
vim.keymap.set("n", "<c-j>", "<c-w>j", { noremap = true, silent = true, desc = "focus below window" })
vim.keymap.set("n", "<c-k>", "<c-w>k", { noremap = true, silent = true, desc = "focus above window" })
vim.keymap.set("n", "<c-l>", "<c-w>l", { noremap = true, silent = true, desc = "focus right window" })

-- 🔹 buffers
vim.keymap.set("n", "<s-h>", ":bprevious<cr>", { noremap = true, silent = true, desc = "previous buffer" })
vim.keymap.set("n", "<s-l>", ":bnext<cr>", { noremap = true, silent = true, desc = "next buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<cr>", { noremap = true, silent = true, desc = "close buffer" })
vim.keymap.set("n", "<leader>bo", ":%bd|e#<cr>", { noremap = true, silent = true, desc = "close all buffers except current" })

-- 🔹 file explorer (adjust depending on your setup)
-- vim.keymap.set("n", "<leader>e", ":lexplore %:p:h<cr>", { noremap = true, silent = true, desc = "open file explorer" })

-- 🔹 telescope
-- pcall(function()
--   local tb = require("telescope.builtin")
--   vim.keymap.set("n", "<leader>ff", tb.find_files, { desc = "find files" })
--   vim.keymap.set("n", "<leader>fg", tb.live_grep, { desc = "live grep" })
--   vim.keymap.set("n", "<leader>fb", tb.buffers, { desc = "list buffers" })
--   vim.keymap.set("n", "<leader>fh", tb.help_tags, { desc = "help tags" })
--   vim.keymap.set("n", "<leader>fr", tb.resume, { desc = "resume last search" })
-- end)

-- 🔹 lsp
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "go to definition" })
-- vim.keymap.set("n", "gd", vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "go to declaration" })
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true, desc = "list references" })
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true, silent = true, desc = "go to implementation" })
-- vim.keymap.set("n", "k", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "hover documentation" })
-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "rename symbol" })
-- vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "code action" })
-- vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format({ async = true }) end, { noremap = true, silent = true, desc = "format file" })

-- 🔹 diagnostics
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "previous diagnostic" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "next diagnostic" })
vim.keymap.set("n", "<leader>xx", vim.diagnostic.setloclist, { noremap = true, silent = true, desc = "open diagnostics list" })

-- 🔹 git (gitsigns)
-- pcall(function()
--   local gs = require("gitsigns")
--   vim.keymap.set("n", "]h", gs.next_hunk, { desc = "next hunk" })
--   vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "previous hunk" })
--   vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "stage hunk" })
--   vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "reset hunk" })
--   vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "preview hunk" })
--   vim.keymap.set("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { desc = "blame line" })
-- end)


-- 🔹 quickfix
vim.keymap.set("n", "<leader>co", ":copen<cr>", { noremap = true, silent = true, desc = "open quickfix list" })
vim.keymap.set("n", "<leader>cc", ":cclose<cr>", { noremap = true, silent = true, desc = "close quickfix list" })
vim.keymap.set("n", "]q", ":cnext<cr>", { noremap = true, silent = true, desc = "next quickfix item" })
vim.keymap.set("n", "[q", ":cprev<cr>", { noremap = true, silent = true, desc = "previous quickfix item" })

-- 🔹 terminal
-- vim.keymap.set("n", "<leader>tt", ":terminal<cr>", { noremap = true, silent = true, desc = "open terminal" })
-- vim.keymap.set("t", "<esc>", [[<c-\><c-n>]], { noremap = true, silent = true, desc = "exit terminal mode" })

-- 🔹 clipboard
vim.keymap.set({ "n", "x" }, "<leader>y", [["+y]], { noremap = true, silent = true, desc = "yank to system clipboard" })
vim.keymap.set("n", "<leader>y", [["+y]], { noremap = true, silent = true, desc = "yank full line to clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>d", [["_d]], { noremap = true, silent = true, desc = "delete without yanking" })

-- 🔹 move lines
vim.keymap.set("n", "<a-j>", ":m .+1<cr>==", { noremap = true, silent = true, desc = "move line down" })
vim.keymap.set("n", "<a-k>", ":m .-2<cr>==", { noremap = true, silent = true, desc = "move line up" })
vim.keymap.set("x", "<a-j>", ":m '>+1<cr>gv=gv", { noremap = true, silent = true, desc = "move selection down" })
vim.keymap.set("x", "<a-k>", ":m '<-2<cr>gv=gv", { noremap = true, silent = true, desc = "move selection up" })

-- helps you change all occurrences of the word the cursor is on
vim.keymap.set("n", "<leader>cw", [[:%s/\<<c-r><c-w>\>/<c-r><c-w>/gi<left><left><left>]],{desc = "change all occurences of the word under the cursor" } )

-- search exact match in all files with telescope
vim.keymap.set("n", "<leader>fw", function()
  local word = vim.fn.expand("<cword>")
  require("telescope.builtin").live_grep({
    default_text = "\\b" .. word .. "\\b",
  })
end, { desc = "telescope - grep exact word under the cursor" })



-- fonction pour insérer un console.log sous le mot ou la sélection
local function insert_console_log()
  local mode = vim.fn.mode()

  if mode == "v" or mode == "v" then
    -- si on est en mode visuel, récupérer la sélection
    vim.cmd('normal! "vy')
    local word = vim.fn.getreg("v")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "n", false)
    vim.api.nvim_put({ string.format('console.log("%s:", %s);', word, word) }, "l", true, true)
  else
    -- sinon, récupérer le mot sous le curseur
    local word = vim.fn.expand("<cword>")
    vim.api.nvim_put({ string.format('console.log("%s:", %s);', word, word) }, "l", true, true)
  end
end

vim.keymap.set({ "n", "v" }, "<leader>L", insert_console_log, { desc = "insert console.log for word/selection" })



