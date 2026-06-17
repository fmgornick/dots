alias vpn-canada="sudo wg-quick up ca-mtr-wg-307"
alias vpn-netherlands="sudo wg-quick up nl-ams-wg-007"

vpn-kill() {
    for tunnel in $(ls -1 /etc/wireguard | sed 's/\.conf$//'); do
        sudo wg-quick down $tunnel
    done

    sudo networksetup -setdnsservers Wi-Fi "Empty"
    sudo dscacheutil -flushcache
    sudo killall -HUP mDNSResponder
    sudo ipconfig set en0 DHCP
    sudo route -n flush
}
