function mcheck --description 'Check mise tool status'
    echo '--- Mise Status ---'
    mise ls
    echo '--- Missing Tools ---'
    mise ls --current --missing
end
