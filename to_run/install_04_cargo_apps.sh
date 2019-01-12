#!/bin/bash

to_install=""

function append_to_install() {
    app_name="${1}"
    # Optionnaly, if second argument is present, use it as command to test.
    # Useful when binary is not named the same as application.
    app_bin="${2:-${app_name}}"
    app_pkg="${3:-${app_name}}"
    if [[ -x "$(command -v ${app_bin})" ]]; then
        echo "Warning: ${app_name} already installed."
    else
        to_install="${to_install} ${app_pkg}"
    fi
}

append_to_install cw

if [[ "${to_install}" == "" ]]; then
    echo "Warning: Nothing to install."
else
    # Use cargo install directly
    cmd="cargo install ${to_install}"
    echo ${cmd}
    ${cmd}
fi
