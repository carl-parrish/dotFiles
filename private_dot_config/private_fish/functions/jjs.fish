function jjs
    # 1. Use native jj list + fzf to select an existing workspace path dynamically
    # We grab the path (column 2) from the workspace picked in fzf
    set -l target_dir (jj workspace list | fzf --height 40% --reverse --prompt="Switch Workspace > " | awk '{print $2}')
    
    # Exit gracefully if fzf is escaped without picking anything
    if test -z "$target_dir"
        return
    end

    # 2. Extract the directory name to use as a clean session name
    set -l session_name (basename $target_dir)

    # 3. Change directory to the target workspace
    cd $target_dir

    # 4. Attach to the Zellij session if it exists, or spawn a new one in that directory
    if zellij list-sessions | string match -r "^$session_name\s" > /dev/null
        zellij attach $session_name
    else
        # Starts Zellij mapped directly to the workspace dir
        zellij --session $session_name options --default-cwd $target_dir
    end
