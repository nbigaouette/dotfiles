#!/bin/bash

to_install=""

function append_to_install() {
    app_name="${1}"
    # Optionnaly, if second argument is present, use it as command to test.
    # Useful when binary is not named the same as application.
    app_bin="${2:-${app_name}}"
    if [[ -x "${HOME}/.cargo/bin/${app_bin}" ]]; then
        echo "Warning: ${app_name} already installed."
    else
        echo "Adding ${app_name}"
        to_install="${to_install} ${app_name}"
    fi
}

append_to_install cargo-audit
append_to_install cargo-edit cargo-add
append_to_install cargo-license
append_to_install cargo-outdated
append_to_install cargo-tree
append_to_install cargo-update cargo-install-update
append_to_install cargo-with

if [[ "${to_install}" == "" ]]; then
    echo "Warning: Nothing to install."
else
    # Use cargo install directly
    cmd="cargo install ${to_install}"
    echo ${cmd}
    ${cmd}
fi
