#!/bin/bash

echo '--------------------------------------'
echo 'Starting up local Scratch environment.'
echo '--------------------------------------'
echo ''
echo 'preparing virtual machine'
echo '--------------------------------------'
echo ''

cd ./scratch-vm
npm ci
npm link
npm run watch &
cd ..

echo ''
echo 'preparing gui'
echo '--------------------------------------'
echo ''

cd scratch-gui
npm ci --production
npm link scratch-vm
npm start &

echo '--------------------------------------'
echo 'System is up and running. Have fun!'
echo '--------------------------------------'
