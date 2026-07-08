function ifx --description "Run a command with Infisical secrets"
    set -l env_name $argv[1]
    set -l cmd $argv[2..-1]

    if test -z "$env_name"
        echo "Usage: ifx <env> <command...>"
        return 1
    end

    infisical run \
        --silent \
        --env "$env_name" \
        --projectId "$INFISICAL_PROJECT_ID" \
        -- $cmd
end
