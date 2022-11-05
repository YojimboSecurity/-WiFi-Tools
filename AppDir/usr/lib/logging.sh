#!/bin/bash
#
# This is a library of logging functions that are used throughout the scripts
# in this project.
#
# I try to follow the google srcipt style guide.
# https://google.github.io/styleguide/shellguide.html
# I also use shellcheck to make sure that I am not using any bashisms.
# https://github.com/koalaman/shellcheck

. /usr/lib/yojimbosecurity/color.sh

#######################################
# Err handling and logging
#
# Arguments:
#   $*: Error message
#######################################
log::err(){
    d=$(date "+%Y.%m.%d-%H:%M:%S")
    echo -e "${Red}[${d} ERROR]:$Color_Off $*" >&2
}

#######################################
# Info logging
#
# Arguments:
#   $*: Info message
#######################################
log::info(){
    d=$(date "+%Y.%m.%d-%H:%M:%S")
    echo -e "$Blue[$d INFO]:$Color_Off $*"
}

#######################################
# Debug logging
#
# Arguments:
#   $*: Debug message
log::debug(){
    if [[ "${DEBUG}" == "true" ]]; then
        d=$(date "+%Y.%m.%d-%H:%M:%S")
        echo -e "$Yellow[$d DEBUG]:$Color_Off $*"
    fi
}
