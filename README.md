# 🔧 Dotfiles Setup

Managed with [chezmoi](https://www.chezmoi.io/).

## 🚀 Bootstrap Instructions

### 1. Install Fish Shell
* **Fedora / Bluefin:**
    ```bash
    sudo dnf install fish
    ```
* **Arch / CachyOS:**
    ```bash
    sudo pacman -Syu --noconfirm fish
    ```
* **Ensure fish is in /etc/shells and change default shell**
    ```bash
    if ! grep -q "$(which fish)" /etc/shells; then
      echo "$(which fish)" | sudo tee -a /etc/shells
    fi
    chsh -s "$(which fish)"
    ```

### 2. Install Basics
*Note: Pacman is faster/safer than Mise for these system-level tools in a container.*

```bash
# Arch / CachyOS example
sudo pacman -Syu --noconfirm git curl fish neovim gcc base-devel
```
### 3. Install & Authenticate Tailscale
```bash
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up
```
### 4. Install Chezmoi & Apply Dotfiles
- Option A: Public Repo

```Bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply [https://github.com/carl-parrish/dotFiles](https://github.com/carl-parrish/dotFiles)
```
- Option B: Tailnet Repo (Private)
```Bash

sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply [https://git.deeplydigital.net/cparrish/dotFiles](https://git.deeplydigital.net/cparrish/dotFiles)
```
### 5. Finalize Setup
Reload the shell to pick up Mise paths and configs:
```Bash
exec fish
```
### 6. Authenticate Tools
```Bash
atuin login
```

```Bash
infisical login
```

### 7. ⌨️ Dotfile Workflow
The following Fish abbreviations are included to manage your configuration efficiently:

- ce [file] — Edit & Apply: Opens a config file in your editor and applies changes immediately upon saving.
- ca — Apply: Manually apply pending changes from the source directory to your home folder.
- cdiff — Diff: Preview changes before applying them.
- cu — Update: Pull the latest changes from the remote repository.
- ccd — Source CD: Jump directly into the chezmoi source directory.
- cgst / cgcmsg / cgp — Git Ops: Status, commit, and push changes specifically for the dotfile repository.

