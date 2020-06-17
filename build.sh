#!/bin/bash

set -e
bash -n "$0"

ls -d Dockerfile.${1:-*} | cut -d'.' -f2- \
  | xargs -i bash -c "
      im='pvalena/fedora-tmt-all:{}'
      echo podman rmi -f \$im && \
      echo podman build -f Dockerfile.{} . -t \$im && \
      echo podman run --rm -it \$im \
      || exit 255
  "
