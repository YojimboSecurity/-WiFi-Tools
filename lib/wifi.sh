#!/usr/bin/env bash
#
# Common functions for wifi tools

source ./lib/logging.sh

Interface=""

#######################################
# check_interface - Check if the interface is valid
# Globals:
#   None
# Arguments:
#   $1 - interface
# Returns:
#   None
# Outputs:
#   None
#######################################
wifi::check_interface(){
    for interface in $(iw dev | grep Interface | awk '{print $2}'); do
        if [[ "$interface" == "$1" ]]; then
            log::err "Interface $1 is not valid"
            wifi::select_interface
        fi
    done
}

#######################################
# select_interface - Select an interface
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
# Outputs:
#   None
#######################################
wifi::select_interface(){
    log::info "Select an interface"
    select interface in $(iw dev | grep Interface | grep -v phy | awk '{print $2}'); do
        if [[ -z "$interface" ]]; then
            log::err "Invalid selection"
            wifi::select_interface
        else
            break
        fi
    done
}

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
        wifi::put_interface_in_monitor_mode "$1"
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