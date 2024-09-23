#!/usr/bin/env bash

: "${DOCKER:=docker}"

${DOCKER} run --rm -i -t -v$PWD:/project cheerp $@
