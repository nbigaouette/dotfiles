#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

INSTALL_DIR="${INSTALL_DIR:-${HOME}}"


function run_cmd() {
    cmd="${@}"
    echo ${cmd}
    eval ${cmd}
}


for f in to_link/*; do
    new_dot_file="${INSTALL_DIR}/.$(basename ${f})"
    cmd="mkdir -p $(dirname ${new_dot_file})"
    run_cmd ${cmd}

    cmd="ln -s ${SCRIPT_DIR}/${f} ${new_dot_file}"
    run_cmd ${cmd}
done


