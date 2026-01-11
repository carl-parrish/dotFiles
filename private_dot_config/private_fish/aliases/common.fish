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
alias ccd="chezmoi cd"
abbr cu 'chezmoi update'

# --- Mise ---
alias mcheck="echo '--- Mise Status ---'; mise ls; echo '--- Missing Tools ---'; mise ls --current --missing"
alias mdoctor="mise doctor"

# --- Git (Converted to Abbreviations for better history) ---
abbr g    'git'
abbr ga   'git add'
abbr gaa  'git add --all'
abbr gap  'git apply'
abbr gapa 'git add --patch'
abbr gc   'git commit -v'
abbr gcb  'git checkout -b'
abbr gcf  'git config --list'
abbr gcm  'git checkout main'
abbr gcmsg 'git commit -m'
abbr gco  'git checkout'
abbr gf   'git fetch'
abbr gfa  'git fetch --all --prune'
abbr gl   'git pull'
abbr grm  'git rm'
abbr rmc  'git rm --cached'
abbr gp   'git push'
abbr gr   'git remote'
abbr gra  'git remote add'
abbr gst  'git status'

# --- Git Rebase (Restored) ---
abbr grb  'git rebase'
abbr grba 'git rebase --abort'
abbr grbc 'git rebase --continue'
abbr grbd 'git rebase develop'
abbr grbi 'git rebase -i'
abbr grbm 'git rebase main'
abbr grbs 'git rebase --skip'


# Complex Git Aliases (Keep as Alias because they contain logic/pipes )
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
