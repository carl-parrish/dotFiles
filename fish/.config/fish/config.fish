set -gx EDITOR nvim
set -gx EZA_COLORS "da=34:di=34:ex=32:fi=0:ln=36:or=31:pi=33:so=35:su=31:tw=31"

# setup env vars
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin
fish_add_path ~/.local/bin/zen/zen
fish_add_path /usr/local/bin
fish_add_path /usr/local/go/bin
fish_add_path $HOME/go/bin
fish_add_path ~/.npm/bin

# setup alias
source ~/.config/fish/aliases/common.fish

# vi key binding
fish_vi_key_bindings

# Load encrypted secrets if present
set secrets_file "$HOME/.config/fish/conf.d/secrets.fish"
if test -f $secrets_file
    source $secrets_file
end

if status is-interactive
  atuin init fish | source
  starship init fish | source
  zoxide init --cmd cd fish | source

end

