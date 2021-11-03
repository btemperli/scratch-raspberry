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

rm -rf /home/pi/log
mkdir /home/pi/log
touch /home/pi/log/server.py.log
touch /home/pi/log/chromium.log

echo ''
echo 'Start Python server'
echo '--------------------------------------'
echo ''

echo 'python server output' > /home/pi/log/server.py.log
echo '--------------------------------------' > /home/pi/log/server.py.log

python3 /home/pi/raspberry-scratch-server/server.py > ./log/server.py.log &

echo ''
echo 'Start Browser'
echo '--------------------------------------'
echo ''

/usr/bin/chromium --kiosk --enable-logging=stderr --v=1 &> ./log/chromium.log /home/pi/scratch-raspberry/scratch-gui/build/index.html

echo '--------------------------------------'
echo 'System is up and running. Have fun!'
echo '--------------------------------------'
