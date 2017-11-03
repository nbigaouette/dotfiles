#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

INSTALL_DIR="${INSTALL_DIR:-${HOME}}"


function run_cmd() {
    cmd="${@}"
    echo ${cmd}
    eval ${cmd}
}


pushd to_link

# Normal files
files_list=($(find * -type f -print))
# Symbolic links
files_list+=($(find * -type l -print))

popd


for f in ${files_list[*]}; do
    new_dot_file="${INSTALL_DIR}/.${f}"
    new_dir="$(dirname ${new_dot_file})"
    # echo "f: ${f}   new_dot_file: ${new_dot_file}   new_dir: ${new_dir}"

    cmd="mkdir -p ${new_dir}"
    run_cmd ${cmd}

    cmd="ln -s ${SCRIPT_DIR}/to_link/${f} ${new_dot_file}"
    run_cmd ${cmd}
done


