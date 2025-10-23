-- ================================================================================================
-- TITLE : mini.nvim
-- LINKS :
--   > github : https://github.com/echasnovski/mini.nvim
-- ABOUT : Library of 40+ independent Lua modules.
-- ================================================================================================

return {
	-- { "echasnovski/mini.ai", version = "*", opts = {} },
	{ "echasnovski/mini.comment", version = "*", opts = {} },
	{ "echasnovski/mini.diff", version = "*", opts = {} },
	{ "echasnovski/mini.starter", version = "*", opts = {} },
	-- { "echasnovski/mini.move", version = "*", opts = {} },
	-- { "echasnovski/mini.surround", version = "*", opts = {} },
	-- { "echasnovski/mini.indentscope", version = "*", opts = {} },
	{ "echasnovski/mini.pairs", version = "*", opts = {} },
	-- { "echasnovski/mini.trailspace", version = "*", opts = {} },
	-- { "echasnovski/mini.bufremove", version = "*", opts = {} },
	-- { "echasnovski/mini.notify", version = "*", opts = {} },
	{ "echasnovski/mini.tabline", version = "*", opts = {} },
	-- {
	-- 	"echasnovski/mini.sessions",
	-- 	version = "*",
	-- 	opts = {},
	-- 	config = function()
	-- 		require("mini.sessions").setup()
	--
	-- 		-- Création d’un augroup pour éviter les doublons
	-- 		local grp = vim.api.nvim_create_augroup("MiniSessionsAuto", { clear = true })
	--
	-- 		-- Sauvegarde automatique de la session du projet à la fermeture
	-- 		vim.api.nvim_create_autocmd("VimLeavePre", {
	-- 			group = grp,
	-- 			callback = function()
	-- 				local name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	-- 				require("mini.sessions").write(name, { force = true })
	-- 			end,
	-- 		})
	--
	-- 		-- Restauration automatique si une session existe
	-- 		vim.api.nvim_create_autocmd("VimEnter", {
	-- 			group = grp,
	-- 			callback = function()
	-- 				local name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	-- 				local dir = require("mini.sessions").config.directory
	-- 				if vim.loop.fs_stat(dir .. "/" .. name) then
	-- 					require("mini.sessions").read(name)
	-- 				end
	-- 			end,
	-- 		})
	--
	-- 		-- Raccourci pratique : choisir une session manuellement
	-- 		vim.keymap.set("n", "<leader>ss", function()
	-- 			require("mini.sessions").select()
	-- 		end, { desc = "Sélectionner une session" })
	-- 	end,
	-- },
}
