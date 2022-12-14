#!/bin/bash -e

mkdir -vp dist
(
  trap 'kill 0' SIGINT SIGTERM ERR EXIT
  bikeshed watch src/index.bs dist/index.html &
  python -m http.server -d dist &
  wait
)

