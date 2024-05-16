#!/bin/bash

set -euo pipefail

dir="${1:?Specify a directory to search.}"

find "$dir" -type f -name "*.ipynb" -print0 | xargs -0 -I{} python3 rm_ans.py "{}"
