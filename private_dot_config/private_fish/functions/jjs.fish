function jjs
    set -l selected (jj workspace list | fzf --height 40% --reverse --prompt="Switch Workspace > ")

    if test -z "$selected"
        return
    end

    # Preserve paths containing spaces: remove the `workspace-name:` prefix.
    set -l target_dir (string replace -r '^[^:]+:\s*' '' -- "$selected")
    set -l session_name (basename "$target_dir")

    cd "$target_dir"; or return

    if zellij list-sessions | string match -r "^$session_name\s" > /dev/null
        zellij attach "$session_name"
    else
        zellij --session "$session_name" options --default-cwd "$target_dir"
    end
end
