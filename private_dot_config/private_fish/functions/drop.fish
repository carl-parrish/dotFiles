function drop
    if test (count $argv) -lt 1
        echo "Usage: drop <file> [...]"
        return 1
    end
    cp $argv ~/Taildrop/
end
