#!/usr/bin/env bash

: "${DOCKER:=docker}"

${DOCKER} run --init --rm --user $(id -u):$(id -g) --network host -i -t -v$PWD:/project cheerp $@
