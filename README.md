# Masterclass Hands-On Exercises

This repository contains a series of exercises designed for the "WebAssembly Demystified" Masterclass.

## Setup

Build the Docker container first

`./build.sh`

Start the local webserver and keep it up

`./run.sh simple-http-server`

From your browser visit: http://127.0.0.1:8080/tests/test0.html

## Compile a test

More detailed instructions will be provided during the presentation, but as a general rule
tests are built with the following command.

`./run.sh /opt/cheerp/bin/clang++ -target cheerp-wasm tests/<test>.cpp -o tests/<test>.js`
