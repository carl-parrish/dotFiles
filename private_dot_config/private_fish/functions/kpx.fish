function kpx --description "Wrapper to dynamically load Kopia profiles and password sidecars"
    # usage: kpx <profile-name> <kopia-command> [kopia-args...]
    # example: kpx cloudflare-r2 snapshot list
    # example: kpx repository repository validate-provider
  
    set -l profile $argv[1]
    set -l kopia_args $argv[2..-1]
    
    set -l conf_file "$HOME/.config/kopia/$profile.config"
    set -l pass_file "$HOME/.config/kopia/$profile.config.kopia-password"
    
    # Check if the profile target configuration exists
    if not test -f "$conf_file"
        echo "❌ Profile '$profile' config not found at $conf_file"
        return 1
    end
    
    # Handle commands with or without sidecar password files
    if test -f "$pass_file"
        set -lx KOPIA_PASSWORD (cat "$pass_file")
        kopia --config-file="$conf_file" $kopia_args
    else
        kopia --config-file="$conf_file" $kopia_args
    end
end
