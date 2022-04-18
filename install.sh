#!/bin/sh

sudo mkdir -p /opt/ghubsave/include
sudo curl -sSo /opt/ghubsave/include/s.sh https://raw.githubusercontent.com/Motyak/ghubsave/master/include/s.sh
sudo curl -sSo /opt/ghubsave/s.sh https://raw.githubusercontent.com/Motyak/ghubsave/master/s.sh
sudo chmod +x /opt/ghubsave/s.sh
sudo ln -s /opt/ghubsave/s.sh /usr/local/bin/ghubsave
