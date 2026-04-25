#!/usr/bin/env bash

if [ ! -d /home/node/.config/getmail ]; then
    echo "`date`: Re-creating getmail default configuration"
    mkdir -p /home/node/.config/getmail
    cp /home/node/defaults/getmailrc /home/node/.config/getmail/
fi

if [ ! -f /home/node/.config/config-defaults.sh ]; then
    echo "`date`: Re-creating config-defaults.sh"
    cp /home/node/defaults/config-defaults.sh /home/node/.config
fi

if [ ! -d /home/node/.config/joplin ]; then
    echo "`date`: Re-creating default joplin configuration"
    cp -r /home/node/defaults/joplin /home/node/.config/
fi

# Append any default config keys the user's existing config-defaults.sh is
# missing. Never overwrites a user-set value; only appends absent keys so
# new features (e.g. MARKITDOWN_*) reach existing installations.
USER_CONFIG=/home/node/.config/config-defaults.sh
DEFAULTS_CONFIG=/home/node/defaults/config-defaults.sh
if [ -f "$USER_CONFIG" ] && [ -f "$DEFAULTS_CONFIG" ]; then
    while IFS= read -r LINE; do
        case "$LINE" in
            ''|'#'*) continue ;;
        esac
        case "$LINE" in
            *=*) ;;
            *) continue ;;
        esac
        KEY="${LINE%%=*}"
        if ! grep -qE "^[[:space:]]*${KEY}=" "$USER_CONFIG"; then
            echo "`date`: Adding missing config key to $USER_CONFIG: $KEY"
            printf '\n%s\n' "$LINE" >> "$USER_CONFIG"
        fi
    done < "$DEFAULTS_CONFIG"
fi