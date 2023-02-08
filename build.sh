#!/bin/bash

set -e
bash -n "$0"

ORG="${ORG:-tmt-all}"

[[ -z "$1" ]] && exec "$0" latest rawhide 36 37

echo "${@}" | tr -s ' ' '\n' \
  | xargs -i bash -c "
      set -x
      im='quay.io/${ORG}/fedora:{}'
      podman rmi -f \$im
      podman build --pull --squash --build-arg FROM='{}' . -t ${SPACE}\$im \
        || exit 255
      podman push \$im
  "
      #podman pull 'fedora:{}'
      #podman run --rm -it \$im && \
