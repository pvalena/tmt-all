#!/bin/bash

set -e
bash -n "$0"

ls -d Dockerfile.${1:-*} | cut -d'.' -f2- \
  | xargs -i bash -c "
      im='pvalena/fedora-tmt-all:{}'
      podman rmi -f \$im
      podman build -f Dockerfile.{} . -t \$im && \
      podman run --rm -it \$im && \
      podman push \$im \
      || exit 255
  "
