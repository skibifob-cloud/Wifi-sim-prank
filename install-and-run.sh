#!/bin/bash
# Clear screen
clear

# GitHub repo URL
REPO_URL="https://github.com/skibifob-cloud/Wifi-sim-prank.git"
SCRIPT_NAME="run.wificracker.py"

# Install Git if missing
if ! command -v git &> /dev/null; then
    echo "[!] Git not found. Installing..."
    pkg install git -y
fi

# Install Python3 if missing
if ! command -v python3 &> /dev/null; then
    echo "[!] Python3 not found. Installing..."
    pkg install python -y
fi

# Clone repo or pull latest
if [ ! -d "Wifi-sim-prank" ]; then
    echo "[*] Cloning repository..."
    git clone $REPO_URL
else
    echo "[*] Repository exists. Pulling latest version..."
    cd Wifi-sim-prank
    git pull
    cd ..
fi

# Make Python script executable
chmod +x Wifi-sim-prank/$SCRIPT_NAME

# Run the script
echo "[*] Running Hacking Tools..."
python3 Wifi-sim-prank/$SCRIPT_NAME
