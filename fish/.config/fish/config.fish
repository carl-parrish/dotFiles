# ~/.config/fish/config.fish
# Shared Fish config across macOS, Mint, Raspberry Pi via stow
#
# =========================
# Basic editor & colors
# =========================
set -gx EDITOR nvim
set -gx EZA_COLORS "da=34:di=34:ex=32:fi=0:ln=36:or=31:pi=33:so=35:su=31:tw=31"

# =========================
# Homebrew (macOS)
# =========================
if test (uname) = "Darwin"
    if test -x /opt/homebrew/bin/brew
        eval "$(/opt/homebrew/bin/brew shellenv)"
    end
end

# =========================
# PATH setup (shared + per-OS)
# =========================

fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin
fish_add_path ~/.local/bin/zen/zen
fish_add_path /usr/local/bin
fish_add_path /usr/local/go/bin
fish_add_path $HOME/go/bin
fish_add_path ~/.npm/bin

# macOS-specific paths
if test (uname) = "Darwin"
    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/opt
end

# =========================
# Aliases (shared)
# =========================
if test -f ~/.config/fish/aliases/common.fish
    source ~/.config/fish/aliases/common.fish
end

# =========================
# Vi key bindings
# =========================
fish_vi_key_bindings

# Load encrypted secrets if present
set secrets_file "$HOME/.config/fish/conf.d/secrets.fish"
if test -f $secrets_file
    source $secrets_file
end

# =========================
# Interactive-only init
# =========================
if status is-interactive
    # 1. Initialize mise (The Version Manager)
    # Check if it exists first so this config doesn't break on new installs
    if type -q mise
        mise activate fish | source
    end

    if type -q atuin
        atuin init fish | source
    end

    if type -q starship
        starship init fish | source
    end

    if type -q zoxide
        zoxide init --cmd cd fish | source
    end
end

# =========================
# mac-mini specific tweaks
# =========================
 if test "$HOSTNAME" = "Mac-mini.local"
    # Starship config path
    set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml

    # WezTerm background image
    set -gx shellBgImagePath "$HOME/.config/wezterm/images/d3Logo.png"

    # If in WezTerm, send user-var (fix WEZTERM_PANE name & var usage)
    if set -q WEZTERM_PANE
        wezterm cli set-user-var --pane-id $WEZTERM_PANE shellBgImagePath "$shellBgImagePath"
    end

    # iTerm2 shell integration
    if test -e $HOME/.iterm2_shell_integration.fish
        source $HOME/.iterm2_shell_integration.fish
    end
end
# =========================
# Hooks for other hosts (Linux boxes)
# =========================
#
# if test "$HOSTNAME" = "mint-mini"
#     # mint-specific tweaks
# end
#
# if test "$HOSTNAME" = "raspberrypi"
#     # pi-specific tweaks
# end
status --is-interactive && pyenv init - | source
