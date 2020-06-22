# tmt-all
Dockerfile for images with [TMT](https://github.com/psss/tmt/).

Pushed to https://hub.docker.com/r/pvalena/fedora-tmt-all

## Usage

```
  # Run the TMT test suite from current directory
  $ podman run --rm -it -v"$PWD:/home/test/run:Z" pvalena/fedora-tmt-all
```

## Build

```
  # Builds all images
  $ ./build.sh
```
```
  # Build only F32 image
  $ ./build.sh 32
```

## Rawhide image

Taken from `https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Container/x86_64/images/`, imported manually:

```
  # Import manually downloaded fedora:rawhide image
  $ podman load -i ./*.tar.xz fedora:rawhide
```
