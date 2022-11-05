#!/usr/bin/env bash
#
# Common functions for wifi tools

source /usr/lib/yojimbosecurity/logging.sh

#######################################
# check_mode - check if interface is in monitor mode
# Globals:
#   None
# Arguments:
#   $1 - interface
# Returns:
#   None
# Outputs:
#   None
#######################################
wifi::check_mode(){
    if [[ $(iw "$1" info | grep type | awk '{print $2}') != "monitor" ]]; then
        log::err "Interface is not in monitor mode"
        put_interface_in_monitor_mode "$1"
    fi
}

#######################################
# put_interface_in_monitor_mode - put interface in monitor mode
# Globals:
#   None
# Arguments:
#   $1 - interface
# Returns:
#   None
# Outputs:
#   None
#######################################
wifi::put_interface_in_monitor_mode(){
    log::info "Putting interface in monitor mode"
    ip link set "$1" down || log::err "Failed to bring interface down"; exit 1
    iwconfig "$1" mode monitor || log::err "Failed to put interface in monitor mode"; exit 1
    ip link set "$1" up || log::err "Failed to bring interface up"; exit 1
}

#######################################
# take_interface_out_of_monitor_mode - take interface out of monitor mode
# Globals:
#   None
# Arguments:
#   Nonw
# Returns:
#   None
# Outputs:
#   None
#######################################
wifi::take_interface_out_of_monitor_mode(){
    log::info "Taking interface out of monitor mode"
    ip link set "$1" down || log::err "Failed to bring interface down"; exit 1
    iwconfig "$1" mode managed || log::err "Failed to put interface in managed mode"; exit 1
    ip link set "$1" up || log::err "Failed to bring interface up"; exit 1
}