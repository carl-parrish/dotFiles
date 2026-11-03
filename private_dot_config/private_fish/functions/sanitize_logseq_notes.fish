function sanitize_logseq_notes -d "Sanitize forbidden characters for cross-platform Logseq sync"
    set -l notes_dir "$HOME/notes/pages"
    if not test -d "$notes_dir"
        return 0
    end

    # Use fd to locate any markdown notes containing colons or question marks
    for file in (fd '[:\?]' "$notes_dir" -e md)
        set -l orig_name (path basename "$file")
        set -l orig_title (string replace -r '\.md$' '' "$orig_name")
        set -l clean_name (string replace -a ':' ' -' "$orig_name" | string replace -a '?' '' | string replace -r '\s+' ' ')
        set -l dir_path (path dirname "$file")
        set -l new_path "$dir_path/$clean_name"

        # Prepend Logseq title frontmatter if absent so internal links don't break
        if not head -n 1 "$file" | rg -q '^title::'
            set -l temp_file (mktemp)
            printf "title:: %s\n" "$orig_title" > $temp_file
            cat "$file" >> $temp_file
            mv "$temp_file" "$file"
        end

        mv -n "$file" "$new_path"
        echo "Sanitized note: \"$orig_name\" -> \"$clean_name\""
    end
end
