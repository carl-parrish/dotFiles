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
abbr -a cgcmsg 'chezmoi git commit -m'

# --- Mise ---
alias mcheck="echo '--- Mise Status ---'; mise ls; echo '--- Missing Tools ---'; mise ls --current --missing"
alias mdoctor="mise doctor"

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


# Complex Git Aliases (Keep as Alias because they contain logic/pipes )
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
