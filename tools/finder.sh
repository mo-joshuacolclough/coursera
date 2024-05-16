#!/bin/bash

set -euo pipefail

dir="${1:?Specify a directory to search.}"

module load scitools

__fix_nb() {
  nb=${1:?ENTER NOTEBOOK}
  jupyter nbconvert --clear-output --inplace "$nb"
  python3 rm_ans.py "$nb"
}

export -f __fix_nb
find "$dir" -name "*.ipynb" -exec bash -c '__fix_nb "$0"' {} \;

