#!/bin/bash
set -ex

PYDIR_LIST=("./core" "./utils")

# shellcheck disable=SC2068
for py_dir in ${PYDIR_LIST[@]}; do
    # shellcheck disable=SC2045
    for file in $(ls "${py_dir}"/*.py); do
        if [[ $py_dir =~ "__init__" ]]; then
            # do nothing
            date
        else
            echo "###########################################"
            echo "# Python Test for embededed-ai.bench"
            echo "# py file: ${file}"
            echo "###########################################"
            cd ${py_dir}
            echo $(basename ${file})
            python $(basename ${file})
            cd -
        fi
    done
done