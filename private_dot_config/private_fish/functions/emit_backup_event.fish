function emit_backup_event --argument-names status profile payload
    set -l host "nats.cuttlefish-gorgon.ts.net" 
    set -l topic "backups.$host.$profile.$status"
    
    set -l json_body (jq -nc \
        --arg host "$host" \
        --arg profile "$profile" \
        --arg status "$status" \
        --arg timestamp (date -u +"%Y-%m-%dT%H:%M:%SZ") \
        '{$host, $profile, $status, $timestamp}')

    nats pub $topic "$json_body" > /dev/null 2>&1
end
