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

## Requirements

- Raspberry Pi 4 (or 3) with the 64 bit Debian buster
- chromium as browser for running scratch

## Installation

### Node & NPM
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

### Install submodules

```
$ git submodule foreach --recursive git clean -xfd
$ git submodule foreach --recursive git reset --hard
$ git submodule update --init --recursive --progress
```

## Running Scratch locally on a computer

First time: run the following script once to get all necessary packages.

```
$ ./start-initial.sh
```

After that: run just the start-script to start the scratch-environment.
Scratch is watching for changes in the code and reloads after changes.

```
$ ./start.sh
```

### Scratch

You can test your own scratch project now on [localhost:8601/](http://localhost:8601/)

## Running Scratch on a Raspberry Pi

This scratch-version is built to run with a python-server in the background to communicate with GPIO and LoRaWAN.

Please get first the [scratch-server](https://github.com/btemperli/raspberry-scratch-server) and install it to your raspberry
on the same level as this repository.

    .
    ├── home
    │   ├── pi
    │   │   ├── scratch-raspberry           # this repository
    │   │   ├── raspberry-scratch-server    # the server repository
    │   │   ├── Desktop                     # the final application will be copied to the desktop
    │   │   └── ... 
    │   └── ... 
    └── ... 


### Preparation on the Raspberry Pi

```
$ ./prepare-on-raspi.sh
```

Change the following settings: open the file manager (folder in the main menu)

```
Edit > Preferences > General

️[✔] Don't ask options on launch executable file
```

Install in chromium the extension "virtual keyboard" directly in the user-data-dir "/home/pi/log". To do this, start chromium
with:

    $ /usr/bin/chromium --user-data-dir=/home/pi/chromium-data https://facebook.com
    $ /usr/bin/chromium --kiosk --user-data-dir=/home/pi/chromium-data https://facebook.com

And then install the chromium-extension via the menu. With the second command you can check if the extension is working.

### Running

After the preparation, there should be an app on the desktop to run. Just double-click it.

Otherwise you can start it by running:

```
$ ./run-on-raspi.sh
```

