#!/data/data/com.termux/files/usr/bin/bash

# Update packages
pkg update -y && pkg upgrade -y

# Install dependencies
pkg install python -y
pkg install curl -y
pip install --upgrade pip
pip install colorama

# Create bin folder
mkdir -p $HOME/bin

# Download the WiFi Cracker Python script
curl -s -O https://raw.githubusercontent.com/skibifob-cloud/Wifi-sim-prank/main/run.wificracker
mv run.wificracker $HOME/bin/
chmod +x $HOME/bin/run.wificracker

# Add $HOME/bin to PATH if not already
grep -qxF 'export PATH=$HOME/bin:$PATH' ~/.bashrc || echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# Run the WiFi Cracker
$HOME/bin/run.wificracker
