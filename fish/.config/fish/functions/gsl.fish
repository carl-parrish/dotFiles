function gsl --description "Git subtree pull"
    # usage: gsl <subdir> <remote> <branch>
    git subtree pull --prefix=$argv[1] $argv[2] $argv[3] --squash
end
