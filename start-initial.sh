#!/bin/bash

echo '--------------------------------------'
echo 'Starting up local Scratch environment.'
echo '--------------------------------------'
echo ''
echo 'preparing virtual machine'
echo '--------------------------------------'
echo ''

cd ./scratch-vm
sudo npm ci
sudo npm link
sudo npm run watch &
cd ..

echo ''
echo 'preparing gui'
echo '--------------------------------------'
echo ''

cd scratch-gui
sudo npm ci --production
sudo npm link scratch-vm
sudo npm start &

echo '--------------------------------------'
echo 'System is up and running. Have fun!'
echo '--------------------------------------'
