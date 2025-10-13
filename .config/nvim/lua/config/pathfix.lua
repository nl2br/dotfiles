-- --- GF simplifié pour imports web (@/, ~/, /, ./, ../) ---

vim.opt.path:append("**") -- recherche récursive
vim.opt.suffixesadd:append({ ".vue", ".js", ".ts", ".jsx", ".tsx", ".json" })
vim.opt.isfname:append("@-@") -- @ reconnu comme partie du mot

local function project_root()
  local name = vim.api.nvim_buf_get_name(0)
  if name == "" then name = vim.loop.cwd() end
  local found = vim.fs.find({ "package.json", ".git" }, { upward = true, path = name })[1]
  return (found and vim.fs.dirname(found)) or vim.loop.cwd()
end

local function gf_web()
  local target = vim.fn.expand("<cfile>")
  if target == "" then return end
  local root = project_root()

  -- convertit les imports en chemins réels
  if target:sub(1,2) == "@/" or target:sub(1,2) == "~/" then
    target = root .. "/" .. target:sub(3)
  elseif target:sub(1,1) == "/" then
    target = root .. target
  elseif target:sub(1,2) == "./" or target:sub(1,3) == "../" then
    -- 🔧 chemin relatif → basé sur le fichier courant
    local current_dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
    target = vim.fn.resolve(current_dir .. "/" .. target)
  end

  vim.cmd.edit(target)
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "vue", "html", "javascript", "typescript", "javascriptreact", "typescriptreact" },
  callback = function(ev)
    vim.keymap.set("n", "gf", gf_web, { buffer = ev.buf, desc = "smart gf for web imports" })
  end,
})

