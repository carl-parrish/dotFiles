# --- Navigation & Listing ---
alias ll='ls -l'
alias la='ls -a'
alias jjl='jj | less'

# --- Modern Tools ---
alias nv='nvim'
alias h='atuin search'
alias bcat='bat -p --paging=never'
alias bn='bat --style="numbers,header"'
alias dl='lsd'

# --- EZA short cuts ---
alias ez='eza --icons'
alias el='eza -lhg --icons'
alias ea='eza -lha --sort=type --icons --group-directories-first'
alias et='eza --tree --level=3 --icons'

# --- Chezmoi ---
# 'chezmoi cd' opens a subshell, so using alias here to distinguish it
alias ccd="chezmoi cd"

# Abbreviations (Expand on Space/Enter)
abbr -a cu    'chezmoi update'
abbr -a ca    'chezmoi apply'
abbr -a cga   'chezmoi git add'
abbr -a cgp   'chezmoi git push'
abbr -a cgl   'chezmoi git pull'
abbr -a ce    'chezmoi edit --apply'
abbr -a cdiff 'chezmoi diff'
abbr -a cgap  'chezmoi git -- add --patch'
abbr -a cgst  'chezmoi git status'
abbr -a cgc   'chezmoi git commit'
abbr -a cgcmsg 'chezmoi git -- commit -m'
abbr -a cct 'chezmoi chattr +template'

# Faster fd for dotfile hunting
abbr -a fa  'fd -HIp'      # Find All (Hidden, Ignored, absolute Path)
abbr -a fhd 'fd -H'        # Find Hidden
abbr -a fpd 'fd -p'        # Find Path
abbr -a fxd 'fd -H -x'     # Find Hidden and Execute (e.g. fxd aerospace.toml cat)

# --- Mise ---
alias mcheck="echo '--- Mise Status ---'; mise ls; echo '--- Missing Tools ---'; mise ls --current --missing"
alias mdoctor="mise doctor"

abbr -a mug 'mise use -g'
abbr -a mlg 'mise ls --global'

# --- Git (Converted to Abbreviations for better history) ---
abbr -a g    'git'
abbr -a ga   'git add'
abbr -a gaa  'git add --all'
abbr -a gap  'git apply'
abbr -a gapa 'git add --patch'
abbr -a gc   'git commit -v'
abbr -a gcb  'git checkout -b'
abbr -a gcf  'git config --list'
abbr -a gcm  'git checkout main'
abbr -a gcmsg 'git commit -m'
abbr -a gco  'git checkout'
abbr -a gf   'git fetch'
abbr -a gfa  'git fetch --all --prune'
abbr -a gl   'git pull'
abbr -a grm  'git rm'
abbr -a rmc  'git rm --cached'
abbr -a gp   'git push'
abbr -a gr   'git remote'
abbr -a gra  'git remote add'
abbr -a gst  'git status'

# --- Git Rebase (Restored) ---
abbr -a grb  'git rebase'
abbr -a grba 'git rebase --abort'
abbr -a grbc 'git rebase --continue'
abbr -a grbd 'git rebase develop'
abbr -a grbi 'git rebase -i'
abbr -a grbm 'git rebase main'
abbr -a grbs 'git rebase --skip'

# --- Kubernetes / Homelab ---
abbr -a k     'kubectl'
abbr -a kg    'kubectl get'
abbr -a kgp   'kubectl get pods'
abbr -a kgn   'kubectl get nodes -o wide'  # Use this a lot to check Tailscale IPs [cite: 690]
abbr -a kd    'kubectl describe'
abbr -a klogs 'kubectl logs -f'
abbr -a kx    'kubectx'                    # Quick switch between contexts (Local vs Prod)
abbr -a kn    'kubens'                     # Quick switch namespaces (default vs homelab)

# Complex Git Aliases (Keep as Alias because they contain logic/pipes )
alias gwip='git add -A; git rm (git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
# --- Infisical (The Keymaster) ---
abbr -a ir   'infisical run --env dev --'
abbr -a irp  'infisical run --env prod --'
abbr -a is   'infisical secrets'
abbr -a iss  'infisical secrets set'

# --- The Brain ---
abbr -a cdn  'cd ~/notes'
abbr -a gn   'grep -rni . ~/notes -e' 
abbr -a goo  'goose'
