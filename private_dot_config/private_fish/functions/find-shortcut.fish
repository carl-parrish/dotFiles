function find-shortcut --description "Search both aliases and abbreviations"
    set -l query $argv[1]
    
    echo "--- Aliases ---"
    alias | rg $query
    
    echo ""
    echo "--- Abbreviations ---"
    abbr | rg $query
end
