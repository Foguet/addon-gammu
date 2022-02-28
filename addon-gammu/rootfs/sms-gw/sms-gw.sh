#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: Example
#
# Example add-on for Home Assistant.
# This add-on displays a random quote every X seconds.
# ==============================================================================



# ==============================================================================
# RUN LOGIC
# ------------------------------------------------------------------------------
bashio::log.info "Starting sms-gw [sms-gw.sh]..."

main() {

    bashio::log.trace "${FUNCNAME[0]}"

    PIN=$(bashio::config 'pin')
    bashio::log.info "PIN is set to: ${PIN}"   
    export PIN

    CREDENTIALS=$(bashio::config 'credentials')
    bashio::log.info "CREDENTIALS is set to: ${CREDENTIALS}"   
    export CREDENTIALS
    # cat ${CREDENTIALS}

    python3 run.py

    while true; do
        echo "Signal"
        curl http://localhost:5000/signal
        sleep 30
    done
}
main "$@"
