#!/bin/bash

set -e
bash -n "$0"

[[ -z "$1" ]] && exec "$0" latest 31 32 rawhide

echo "${@}" | tr -s ' ' '\n' \
  | xargs -i bash -c "
      im='pvalena/fedora-tmt-all:{}'
      set -x
      podman rmi -f \$im
      podman build --pull --squash --build-arg FROM='{}' . -t \$im && \
      podman build --build-arg FROM="" . -t pvalena/fedora-tmt-all:idk
      podman push \$im \
      || exit 255
  "
      #podman pull 'fedora:{}'
      #podman run --rm -it \$im && \
