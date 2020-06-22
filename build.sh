#!/bin/bash

set -e
bash -n "$0"

ls -d Dockerfile.${1:-*} | cut -d'.' -f2- \
  | xargs -i bash -c "
      im='pvalena/fedora-tmt-all:{}'
      set -x
      podman rmi -f \$im
      podman build --pull --squash -f Dockerfile.{} . -t \$im && \
      podman push \$im \
      || exit 255
  "
      #podman pull 'fedora:{}'
      #podman run --rm -it \$im && \
