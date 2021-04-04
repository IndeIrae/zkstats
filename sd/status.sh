#!/bin/bash
printf '{"processing":"%d","available":"%d","last_started":"%s","last_stopped":"%s","status_updated":"%s"}' "$(find /var/lib/zkreplay/stats -mindepth 1 -maxdepth 1 -type d | sed 's_^.*/\([^\/*]\)_\1_' | wc -l)" "$(find /var/lib/zkreplay/demos -mindepth 1 -maxdepth 1 -type d | sed 's_^.*/\([^\/*]\)_\1_' | wc -l)" "$(systemctl --value --property=ActiveEnterTimestamp show zkreplay-process)" "$(systemctl --value --property=ActiveExitTimestamp show zkreplay-process)" "$(date '+%a %Y-%m-%d %H:%M:%S %Z')" > /var/lib/zkreplay/public/status.json
