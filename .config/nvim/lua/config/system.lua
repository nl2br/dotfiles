-- lua/system.lua
local M = {}

-- Détection de l'environnement
M.is_win = package.config:sub(1, 1) == "\\"
M.is_wsl = (vim.fn.has("wsl") == 1)
M.is_linux = not M.is_win and not M.is_wsl

-- 📋 Clipboard pour WSL → Windows
if M.is_wsl then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = { ["+"] = "clip.exe", ["*"] = "clip.exe" },
    paste = {
      ["+"] = "powershell.exe -NoProfile -Command Get-Clipboard",
      ["*"] = "powershell.exe -NoProfile -Command Get-Clipboard",
    },
    cache_enabled = 0,
  }
  vim.opt.clipboard = "unnamedplus"
  vim.notify("✅ Clipboard WSL ↔ Windows configuré")
end

-- 💡 Pas besoin de configurer le shell ici, 
-- WSL utilise déjà bash/zsh du système Ubuntu

return M

