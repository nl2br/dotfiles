return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		local tb = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fr", tb.resume, { desc = "Resume last search" })
	end,
}

-- return {
-- 	{
-- 		"nvim-telescope/telescope.nvim",
-- 		dependencies = {
-- 			"nvim-lua/plenary.nvim",
-- 			"nvim-telescope/telescope-fzf-native.nvim",
-- 			"nvim-pack/nvim-spectre", -- 🔥 pour la recherche/remplacement global
-- 		},
-- 		config = function()
-- 			local telescope = require("telescope")
-- 			telescope.setup({
-- 				defaults = {
-- 					mappings = {
-- 						i = {
-- 							["<C-j>"] = "move_selection_next",
-- 							["<C-k>"] = "move_selection_previous",
-- 						},
-- 					},
-- 				},
-- 			})
-- 			pcall(telescope.load_extension, "fzf")
--
-- 			-- Spectre config
-- 			require("spectre").setup()
--
-- 			-- 🔎 Mappings pratiques
-- 			local wk = require("which-key")
-- 			wk.register({
-- 				f = {
-- 					name = "Find",
-- 					f = { "<cmd>Telescope find_files<cr>", "Files" },
-- 					g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
-- 					b = { "<cmd>Telescope buffers<cr>", "Buffers" },
-- 					h = { "<cmd>Telescope help_tags<cr>", "Help" },
-- 					r = { "<cmd>lua require('spectre').open()<cr>", "Search & Replace (Spectre)" },
-- 				},
-- 			}, { prefix = "<leader>" })
-- 		end,
-- 	},
-- }
