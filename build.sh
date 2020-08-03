#!/bin/sh

./alpine-make-vm-image \
  --image-format raw \
  --image-size 2G \
  --repositories-file repositories \
  --packages "$(cat packages)" \
  -- minik8s.iso \
  ./configure.sh

