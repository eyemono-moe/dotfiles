# 🛠️ dotfiles

Easily bootstrap your dev environment with:

```bash
curl -sL dot.eyemono.moe | bash
```

---

## 📦 Daily Usage

Based on chezmoi.  
More: [chezmoi daily operations](https://www.chezmoi.io/user-guide/daily-operations/)

### ✏️ Edit dotfiles

```bash
chezmoi edit $FILENAME
```

or

```bash
chezmoi add $FILENAME
```

### 🚀 Apply changes

```bash
chezmoi apply
```

### 🔄 Pull and apply remote updates

```bash
chezmoi update
```

To preview changes before applying:

```bash
chezmoi git pull -- --autostash --rebase && chezmoi diff
```

---

## 🪟 tmux plugins

Inside tmux, press:

```txt
prefix + I
```

to install plugins.

---

## 📚 Dependencies Overview

The entire environment is managed via [chezmoi](https://www.chezmoi.io)

```txt
Homebrew
├─▶ (other tools listed in Brewfile)
└─▶ aqua
    ├─▶ (other tools listed in aqua.yaml)
    ├─▶ go
    └─▶ fnm
        └─▶ node
```

- [`chezmoi`](https://www.chezmoi.io)
- [`brew`](https://brew.sh/)
- [`aqua`](https://aquaproj.github.io/)
- [`fnm`](https://github.com/Schniz/fnm)
