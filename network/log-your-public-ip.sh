#!/usr/bin/env bash
# Am0rphous: if your isp changes your ip frequently due to dhcp, this script will log your public ip every night.

# crontab -e
# 0 3 * * *   /home/mike/script/log-iper.sh   # Runs every night at 03:00
# chmod +x /home/mike/script/log-iper.sh

LIST_FILE="/home/mike/logs/public-ips.log"
IP_CMD="curl -fsS -4 https://ip.me"
TIMESTAMP_FMT='%Y-%m-%d'

get_public_ipv4() {
  ip="$(${IP_CMD} 2>/dev/null || true)"
  ip="$(echo -n "$ip" | tr -d '[:space:]')"
  if [[ "$ip" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
    printf '%s' "$ip"
    return 0
  fi
  return 1
}

ip_exists() {
  local search_ip="$1"
  awk -F$'\t' '{print $1}' "$LIST_FILE" 2>/dev/null | grep -Fxq -- "$search_ip"
}

main() {
  ip="$(get_public_ipv4)"
  if [[ -z "$ip" ]]; then
    >&2 printf '%s - Kunne ikke hente offentlig IPv4.\n' "$(date -u +"${TIMESTAMP_FMT}")"
    exit 1
  fi

  # Sjekk at fil/mappe er skrivbar (gir klar feilmelding hvis ikke)
  dir="$(dirname "$LIST_FILE")"
  if [[ ! -d "$dir" ]]; then
    >&2 printf '%s - Katalogen %s finnes ikke.\n' "$(date -u +"${TIMESTAMP_FMT}")" "$dir"
    exit 1
  fi
  if [[ -e "$LIST_FILE" && ! -w "$LIST_FILE" ]]; then
    >&2 printf '%s - Filen %s er ikke skrivbar.\n' "$(date -u +"${TIMESTAMP_FMT}")" "$LIST_FILE"
    exit 1
  fi
  if [[ ! -e "$LIST_FILE" && ! -w "$dir" ]]; then
    >&2 printf '%s - Kan ikke opprette %s (manglende rettighet i %s).\n' "$(date -u +"${TIMESTAMP_FMT}")" "$LIST_FILE" "$dir"
    exit 1
  fi

  if ip_exists "$ip"; then
    printf '%s - IP %s finnes allerede.\n' "$(date -u +"${TIMESTAMP_FMT}")" "$ip"
    exit 0
  fi

  timestamp="$(date -u +"${TIMESTAMP_FMT}")"
  if ! printf '%s\t%s\n' "$ip" "$timestamp" >> "$LIST_FILE"; then
    >&2 printf '%s - Klarte ikke skrive til %s\n' "$timestamp" "$LIST_FILE"
    exit 1
  fi
  printf '%s - Ny IP lagt til: %s\t%s\n' "$timestamp" "$ip" "$timestamp"
}

main
