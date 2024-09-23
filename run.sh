#!/usr/bin/env bash

: "${DOCKER:=docker}"

${DOCKER} run --init --rm -i -t -v$PWD:/project cheerp $@
