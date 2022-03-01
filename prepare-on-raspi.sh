#!/bin/bash

echo '--------------------------------------'
echo 'Prepare the local Scratch environment.'
echo '--------------------------------------'
echo ''
echo 'Prepare VM'
echo '--------------------------------------'
echo ''

cd ./scratch-vm
npm ci
npm link
npm run build
cd ..

echo ''
echo 'Prepare GUI'
echo '--------------------------------------'
echo ''

cd scratch-gui
# remove --production because of the dev-modules mkdirp & raf
npm ci
npm link scratch-vm
npm run build
cd ..

echo ''
echo 'Prepare Server'
echo '--------------------------------------'
echo ''

cp /home/pi/raspberry-scratch-server/font5x8.bin /home/pi/font5x8.bin

echo ''
echo 'Prepare App on Desktop'
echo '--------------------------------------'
echo ''

cp ScratchNetwork.desktop /home/pi/Desktop/ScratchNetwork.desktop
sudo chmod +x /home/pi/Desktop/ScratchNetwork.desktop

echo '--------------------------------------'
echo 'Raspberry Pi is prepared. Have fun!'
echo '--------------------------------------'
