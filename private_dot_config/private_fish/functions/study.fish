function study --description "Sync DB with Turso, launch Flashy TUI, and push state back on exit"
    if test (count $argv) -eq 0
        echo "Error: Please specify a deck name."
        echo "Usage: study <deck-name>"
        return 1
    end

    set -l deck_name $argv[1]
    set -l deck_file "$NAS_DIR/Documents/study/flashy/$deck_name.toml"
    set -l db_dir "$HOME/.local/share/flashy"
    set -l db_path "$db_dir/flashy.db"
    set -l turso_db "flash-cards"

    mkdir -p $db_dir

    # 1. PRE-SESSION PULL FROM TURSO
    # If the local NAS is offline OR local DB doesn't exist, sync down from cloud
    if not test -f $deck_file; or not test -f $db_path
        echo "📡 NAS unavailable or local DB missing. Syncing latest state from Turso ($turso_db)..."
        set -l temp_dump (mktemp)
        
        # Dump remote database state via turso shell
        turso db shell $turso_db ".dump" > $temp_dump 2>/dev/null

        if test -s $temp_dump
            test -f $db_path; and mv $db_path "$db_path.bak"
            sqlite3 $db_path < $temp_dump
            rm -f $temp_dump
            echo "✓ Successfully restored local state from Turso cloud."
        else
            rm -f $temp_dump
            echo "⚠️  Could not pull state from Turso (or DB is empty). Proceeding with local state."
        end
    end

    # 2. LOCAL NAS IMPORT
    if test -f $deck_file
        echo "📦 NAS detected. Syncing local updates from $deck_file..."
        flashy file --import -f $deck_file
    end

    # 3. LAUNCH FLASHY TUI
    echo "🚀 Launching Flashy for deck: $deck_name..."
   
    # Temporarily force WezTerm's background to solid black (disable image layer)
    wezterm cli set-config-overrides 'background = {{ source = { Color = "black" } }}' >/dev/null 2>&1

    flashy ui --deck $deck_name
    set -l flashy_status $status

  # Clear WezTerm config overrides to instantly restore your background image
    wezterm cli set-config-overrides '' >/dev/null 2>&1

    # 4. POST-SESSION PUSH TO TURSO
    if test $flashy_status -eq 0
        echo ""
        echo "📡 Session ended cleanly. Syncing state back to Turso ($turso_db)..."
        if test -f $db_path
            sqlite3 $db_path .dump | turso db shell $turso_db >/dev/null 2>&1
            if test $status -eq 0
                echo "✓ Cloud backup complete!"
            else
                echo "⚠️  Failed to sync post-session state to Turso."
            end
        end
    end
end
