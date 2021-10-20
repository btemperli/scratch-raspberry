# Scratch on a Raspberry

## About

This project is part of my Masterthesis: «Learning Networks with new technologies like 
LoRa and connect it with physical computing».

[Scratch](https://scratch.mit.edu/): Running Scratch on a Raspberry Pi, add new extensions to
establish a connection with a running server to connect Scratch 
with Python.

## Scratch

This own scratch build is based on [scratch-vm](https://github.com/LLK/scratch-vm) and [scratch-gui](https://github.com/LLK/scratch-gui).
Both repositories were forked and supplemented with an own extension based on Scratch Extensions.

## Installation

## Node & NPM
```
$ curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
$ sudo apt install nodejs
$ node --version
$ npm --version
$ npm install -g npm
$ npm install -g webpack-dev-server
$ npm install -g webpack-cli
```

To install packages without sudo, checkout this one here: https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally

## Install submodules

```
$ git submodule update --init --recursive --progress
```

## Running Scratch locally

```
$ ./start.sh
```

## Scratch

You can build your own scratch project now on [localhost:8601/](http://localhost:8601/)




