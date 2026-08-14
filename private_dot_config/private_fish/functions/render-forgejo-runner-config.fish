function render-forgejo-runner-config --description "Install the Forgejo runner configuration"
    set -l source_config ~/.config/forgejo-runner/runner-config.yaml
    set -l config_path ~/workspace/homelab/runner-config.yaml
    set -l temp_config "$config_path.tmp"

    if not test -r $source_config
        echo "Error: runner config source is missing: $source_config"
        return 1
    end

    cp $source_config $temp_config; or return 1
    chmod 600 $temp_config; or return 1
    mv -f $temp_config $config_path; or return 1

    echo "Forgejo runner configuration rendered."
end
