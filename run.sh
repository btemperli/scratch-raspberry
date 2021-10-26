#!/bin/bash

echo '--------------------------------------'
echo 'Running the local Scratch environment.'
echo '--------------------------------------'
echo ''
echo 'Start VM'
echo '--------------------------------------'
echo ''

cd ./scratch-vm
npm run build &
cd ..

echo ''
echo 'Start GUI'
echo '--------------------------------------'
echo ''

cd scratch-gui
npm run build &

echo '--------------------------------------'
echo 'System is up and running. Have fun!'
echo '--------------------------------------'
