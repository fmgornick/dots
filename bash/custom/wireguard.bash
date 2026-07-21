alias vpn-canada="sudo wg-quick up ca-mtr-wg-307"
alias vpn-netherlands="sudo wg-quick up nl-ams-wg-007"

vpn-kill() {
    for tunnel in $(sudo wg show interfaces); do
        sudo wg-quick down $tunnel
    done
}
