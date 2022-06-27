# tmt-all
Dockerfile for images with [TMT](https://github.com/teemtee/tmt/).

Pushed to https://quay.io/repository/tmt-all/fedora

## Usage

```
  # Run the TMT test suite from current directory
  $ podman run --rm -it -v"$PWD:/home/test/run:Z" quay.io/tmt-all/fedora

  # Run the TMT plan from current directory (vverbosely):
  $ podman run --rm -it -v"$PWD:/home/test/run:Z" \
      quay.io/tmt-all/fedora:rawhide sudo tmt run -avv provision -h local
```

## Build

_Note: After a build, it will try to push the image, if you have access._

```
  # Builds all images
  $ ./build.sh
```
```
  # Build only F36 image
  $ ./build.sh 36
```
Please check TMT documentaton for usage: https://tmt.readthedocs.io/en/latest/

### Organization

```
  # To push into a different organization
  $ ORG=my_organization ./build.sh 36
```
