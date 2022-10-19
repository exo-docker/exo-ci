#!/bin/bash
set -e

# Hack for Jenkins Pipeline: authorize cat without absolute path
if [[ "$1" == "/"* ]] || [[ "$1" == "cat" ]]; then
  exec "$@"
fi

exec mvnd "$@"
