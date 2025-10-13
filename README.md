# 🧩 Dotfiles (bare repo)

Configuration personnelle (bash, Neovim, tmux, starship...) versionnée via un dépôt
 Git *bare*.

---

## 🚀 Bootstrap sur ta machine WSL (au travail)

```bash
# 1) Cloner le dépôt bare dans ~/.cfg
git clone --bare git@github.com:<USER>/dotfiles.git $HOME/.cfg

# 2) Alias 'cfg' pour piloter les dotfiles
echo "alias cfg='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> ~/.bashrc
source ~/.bashrc

# 3) Premier checkout
cfg checkout || {
  echo "⚠️ Des fichiers existent déjà, on les sauvegarde puis on ré-essaie…"
  mkdir -p .config-backup
  cfg checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | xargs -I{} sh -c 'mkdir 
-p $(dirname .config-backup/{}); mv {} .config-backup/{}'
  cfg checkout
}

# 4) Masquer les fichiers non suivis
cfg config --local status.showUntrackedFiles no
```

---

## 🧩 Après le checkout

- **Neovim** : ouvre `nvim` une fois → lazy.nvim installera les plugins.
- **tmux (TPM)** : lance `tmux`, puis `prefix + I` pour installer les plugins.
- **fd** sous Ubuntu :  
  ```bash
  [ ! -e /usr/bin/fd ] && command -v fdfind >/dev/null && sudo ln -s "$(command -v fdfind)" /usr/bin/fd || true
  ```
- **Starship** : s’active via `eval "$(starship init bash)"` dans ton `.bashrc`.

---

## 🧭 Cheatsheet “au quotidien”

### 🔄 Gestion du dépôt
```bash
cfg status                # voir les changements
cfg add <chemin>          # ajouter un fichier/dossier
cfg commit -m "message"   # commit local
cfg push                  # envoyer sur GitHub
cfg pull --rebase         # récupérer les dernières modifs
```

### 🧹 Ignorer définitivement certains fichiers
```bash
mkdir -p ~/.cfg/info
cat >> ~/.cfg/info/exclude <<'EOF'
.bash_history
.cache/
.local/share/
.ssh/
.gnupg/
.config/tmux/plugins/
Downloads/
Pictures/
EOF
```

### 🪄 Retirer un fichier du suivi (sans le supprimer)
```bash
cfg rm --cached <chemin>
cfg commit -m "stop tracking <chemin>"
cfg push
```

### 🧰 Vérifications utiles
```bash
cfg remote -v
cfg log --oneline --decorate -n 5
```

---

## 🧠 Rappel
Ce dépôt utilise la méthode **bare repo** :  
- Les fichiers sont suivis directement depuis `$HOME`
- Le dépôt git est stocké dans `~/.cfg`
- On utilise la commande `cfg` au lieu de `git`
