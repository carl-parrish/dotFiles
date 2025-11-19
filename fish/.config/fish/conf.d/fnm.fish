# fnm.fish - auto-enable fnm if installed

if type -q fnm
    fnm env --use-on-cd --shell fish | source
end
