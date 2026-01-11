function gsp --description "Git subtree push"
    # usage: gsp <subdir> <remote> <branch>
    git subtree push --prefix=$argv[1] $argv[2] $argv[3]
end
