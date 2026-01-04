function gl --description 'git pull and sync mise/hooks if in dotFiles'
    git pull $argv
    
    # Check if we are currently inside the dotFiles directory
    if string match -r "dotFiles" "$PWD"
        echo "🔧 dotFiles detected: Syncing hooks and mise tools..."
        mise run setup-hooks
        mise install
    end
end
