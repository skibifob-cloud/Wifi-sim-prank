#!/data/data/com.termux/files/usr/bin/bash

# Update packages
pkg update -y && pkg upgrade -y

# Install dependencies
pkg install python -y
pkg install curl -y
pip install --upgrade pip
pip install colorama

# Download the Python WiFi Cracker Simulator
mkdir -p $HOME/bin
curl -s https://raw.githubusercontent.com/skibifob-cloud/Wifi-sim-prank/main/run.wificracker -o $HOME/bin/run.wificracker
chmod +x $HOME/bin/run.wificracker

# Add to PATH if not already
grep -qxF 'export PATH=$HOME/bin:$PATH' ~/.bashrc || echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# Run the simulator
$HOME/bin/run.wificracker
