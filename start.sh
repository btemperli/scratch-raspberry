#!/bin/bash
trap "exit" INT TERM ERR
trap "kill 0" EXIT

echo '--------------------------------------'
echo 'Starting up local watching Scratch environment.'
echo '--------------------------------------'
echo ''
echo 'prepare the virtual machine by running'
echo '$ ./start-initial.sh'
echo '--------------------------------------'
echo ''

cd ./scratch-vm
npm run watch &
cd ..

echo ''
echo 'prepare gui by running'
echo '$ ./start-initial.sh'
echo '--------------------------------------'
echo ''

cd scratch-gui
npm start &

echo '--------------------------------------'
echo 'System is up and running and watching. Have fun!'
echo '--------------------------------------'

wait
