#!/usr/bin/env bash

: "${DOCKER:=docker}"

${DOCKER} build -t cheerp .
