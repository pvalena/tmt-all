# tmt-all
Dockerfile for images with [TMT](https://github.com/psss/tmt/).

Pushed to https://hub.docker.com/r/pvalena/fedora-tmt-all/tags

## Usage

```
  # Run the TMT test suite from current directory
  $ podman run --rm -it -v"$PWD:/home/test/run:Z" pvalena/fedora-tmt-all
```

## Build

_Note: After a build, it will try to push the image, if you have access._

```
  # Builds all images
  $ ./build.sh
```
```
  # Build only F32 image
  $ ./build.sh 32
```

### Namespace

```
  # To push into a different namespace
  $ NAME=my_namespace ./build.sh 32
```


## Rawhide image

Taken from `https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Container/x86_64/images/`, imported manually:

```
  # Import manually downloaded fedora:rawhide image
  $ podman load -i ./*.tar.xz fedora:rawhide
```
