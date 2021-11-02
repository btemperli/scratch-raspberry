#!/bin/bash


echo '--------------------------------------'
echo 'Running on Raspberry Pi'
echo '--------------------------------------'
echo ''
echo ''
echo 'Starting local scratch environment'
echo '--------------------------------------'
echo ''
echo 'VM should be built.'
echo '--------------------------------------'
echo ''

# cd ./scratch-vm
# npm run build &
# cd ..

echo ''
echo 'GUI should already be built.'
echo '--------------------------------------'
echo ''

# cd scratch-gui
# npm run build &

echo ''
echo 'Prepare Log'
echo '--------------------------------------'
echo ''

rm -rf ./log
mkdir ./log
touch ./log/server.py.log

echo ''
echo 'Start Python server'
echo '--------------------------------------'
echo ''

cd ../raspberry-scratch-server
python3 server.py > ./log/server.py.log &
cd ../scratch-raspberry

echo ''
echo 'Start Browser'
echo '--------------------------------------'
echo ''

/usr/bin/chromium --kiosk /home/pi/scratch-raspberry/scratch-gui/build/index.html

echo '--------------------------------------'
echo 'System is up and running. Have fun!'
echo '--------------------------------------'
