#!/usr/bin/env bash

: "${DOCKER:=docker}"

${DOCKER} run --init --rm --user $(id -u):$(id -g) -i -t -v$PWD:/project cheerp $@
