function logseq2md --description "Convert a Logseq note into clean long-form Markdown in Documents/MarkDown"
    if test (count $argv) -eq 0
        echo "Usage: logseq2md <path/to/logseq-note.md> [output-name.md]"
        return 1
    end

    set -l src $argv[1]
    if not test -f "$src"
        echo "File not found: $src"
        return 1
    end

    set -l dest_dir
    if test -d "/Volumes/Documents/MarkDown"
        set dest_dir "/Volumes/Documents/MarkDown"
    else if test -d "/mnt/nas/Documents/MarkDown"
        set dest_dir "/mnt/nas/Documents/MarkDown"
    else
        echo "Neither /Volumes/Documents/MarkDown nor /mnt/nas/Documents/MarkDown is mounted."
        return 1
    end

    set -l filename (basename "$src")
    if test (count $argv) -ge 2
        set filename $argv[2]
    end
    set -l dest "$dest_dir/$filename"

    awk '
    BEGIN { in_code = 0; blank_count = 0 }
    /^[[:space:]]*(```|~~~)/ {
        in_code = !in_code
        print
        blank_count = 0
        next
    }
    in_code {
        print
        next
    }
    # Skip Logseq properties (e.g., id::, collapsed::, tags::)
    /^[[:space:]]*[a-zA-Z0-9_-]+::[[:space:]]*/ { next }
    {
        # Strip top-level Logseq bullet and task keywords
        sub(/^- ((TODO|DOING|DONE|LATER|NOW|WAITING)[[:space:]]+)?/, "")
        # Unindent child bullets by one level (2 spaces or 1 tab)
        sub(/^(  |\t)/, "")
        # Strip [[wikilinks]] brackets
        gsub(/\[\[/, "")
        gsub(/\]\]/, "")

        if ($0 ~ /^[[:space:]]*$/) {
            blank_count++
            if (blank_count <= 1) print ""
        } else {
            blank_count = 0
            print
        }
    }
    ' "$src" > "$dest"

    echo "Exported clean Markdown -> $dest"
end
