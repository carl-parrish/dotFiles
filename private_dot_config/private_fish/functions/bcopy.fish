function bcopy --description "Copy file contents to clipboard using bat and OSC 52"
    if test (count $argv) -eq 0
        echo "Usage: bcopy <file_path>"
        return 1
    end

    bat -p --paging=never $argv | osc52 copy 
end
