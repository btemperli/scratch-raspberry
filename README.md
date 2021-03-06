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
- Prepare Raspberry with the basics:
  - SSH-Access (passwordless if needed)
  - [Remote Desktop Access](https://raspberrypi.stackexchange.com/a/79626/127427)

## Installation

### Node & NPM
```
$ curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
$ sudo apt install nodejs

# make sure, npm runs without sudo.
$ mkdir ~/.npm-global
$ npm config set prefix '~/.npm-global'
$ export PATH=~/.npm-global/bin:$PATH
$ source ~/.profile
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

or run the prepared script

```
$ ./update-submodules.sh
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

#### Virtual Keyboard

Install in chromium the extension "virtual keyboard" directly in the user-data-dir "/home/pi/log". To do this, start chromium
with:

    $ /usr/bin/chromium --user-data-dir=/home/pi/chromium-data https://facebook.com

With the first command, install the chromium-extension via the menu.

*Manage Extensions &rarr; Open Chrome Web Store &rarr; [Virtual Keyboard](https://chrome.google.com/webstore/detail/virtual-keyboard/pflmllfnnabikmfkkaddkoolinlfninn)*

Change the settings, that the virtual keyboard extension has access to file URLs:

*Manage Extensions &rarr; Virtual Keyboard &rarr; Allow access to file URLs* 

In the extension-options of this extension you can change the keyboard layout if you want.

Now you can check if the keyboard is working:

    $ /usr/bin/chromium --kiosk --user-data-dir=/home/pi/chromium-data https://facebook.com

#### Autostart

Add the Scratch-Application to the autostart:

    $ sudo nano /etc/xdg/lxsession/LXDE-pi/autostart

Now add the following line before the screensaver line:

    @sudo sh /home/pi/scratch-raspberry/system/launcher.sh

### Running

After the preparation, there should be an app on the desktop to run. Just double-click it.

Otherwise you can start it by running on the raspberry pi (from the display, not via SSH):

```
$ ./run-on-raspi.sh
```

