function jjw
    if test (count $argv) -eq 0
        jj workspace list
        return
    end

    # Pass everything straight to native jj workspace
    jj workspace $argv
end
