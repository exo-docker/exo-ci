#!/bin/bash
#
# The following tests required dgoss to be installed:
# * https://github.com/aelsabbahy/goss/tree/master/extras/dgoss#installation
#

# Test Docker images with dgoss
function test_images {
  i=0
  for x in */ */**/;do
    pushd "$x" > /dev/null
    if [ -f "tests/test_image.sh" ]; then
       echo -e "\n\n======================="
       echo "eXo Testing CI Images $x"
       echo "======================="
      pushd "tests" > /dev/null
      ./test_image.sh || ((i++))
      popd > /dev/null
    elif [ -f "Dockerfile" ]; then
      echo "No test for this Docker Image."
    fi
    popd > /dev/null
  done

  exit $i
}

function build_images {

  docker_image_prefix="exoplatform/ci"

  # Build eXo CI Base image
  pushd "base" > /dev/null
  echo -e "\n\n======================="
  echo "eXo Building CI Images ${docker_image_prefix}:base"
  echo "======================="
  docker build -t "${docker_image_prefix}:base" .
  popd > /dev/null

  for x in jdk/**/ maven/**/ gradle/**;do
    pushd "$x" > /dev/null
    if [ -f "Dockerfile" ]; then
      IFS='/' read -r -a tag <<< "$x"
      unset IFS
      echo -e "\n\n======================="
      echo "eXo Building CI Images ${docker_image_prefix}:${tag[1]}"
      echo "======================="
      docker build -t "${docker_image_prefix}:${tag[1]}" .
    else
      echo "No Dockerfile."
    fi
    popd > /dev/null
  done

}

build_images
test_images