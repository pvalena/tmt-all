#!/bin/bash

set -e
bash -n "$0"

NAME="${NAME:-pvalena}"

[[ -z "$1" ]] && exec "$0" latest 31 32 rawhide

echo "${@}" | tr -s ' ' '\n' \
  | xargs -i bash -c "
      set -x
      im='${NAME}/fedora-tmt-all:{}'
      podman rmi -f \$im
      podman build --pull --squash --build-arg FROM='{}' . -t \$im \
        || exit 255
      podman push \$im
  "
      #podman pull 'fedora:{}'
      #podman run --rm -it \$im && \
