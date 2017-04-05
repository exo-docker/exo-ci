#!/bin/bash
#
# The following tests required dgoss to be installed:
# * https://github.com/aelsabbahy/goss/tree/master/extras/dgoss#installation
#

# Test Docker images with dgoss
function test_images {
  i=0
  for x in */**/;do
    echo -e "\n\n======================="
    echo "eXo Testing CI Images $x"
    echo "======================="
    pushd "$x" > /dev/null
    if [ -f "tests/test_image.sh" ]; then
      pushd "tests" > /dev/null
      ./test_image.sh || ((i++))
      popd > /dev/null
    else
      echo "No test for this Docker Image."
    fi
    popd > /dev/null
  done

  exit $i
}

test_images