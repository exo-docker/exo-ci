#!/bin/bash
set -e

if [[ "$1" == "/"* ]]; then
  exec "$@"
fi

exec mvn "$@"
