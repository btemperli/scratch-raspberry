#!/bin/bash

echo '--------------------------------------'
echo 'Starting up local Scratch environment.'
echo '--------------------------------------'
echo ''
echo 'preparing virtual machine'
echo '--------------------------------------'
echo ''

cd ./scratch-vm
npm install
npm link
npm run watch &
cd ..

echo ''
echo 'preparing gui'
echo '--------------------------------------'
echo ''

cd scratch-gui
npm install
npm link scratch-vm
npm start &

echo '--------------------------------------'
echo 'System is up and running. Have fun!'
echo '--------------------------------------'
