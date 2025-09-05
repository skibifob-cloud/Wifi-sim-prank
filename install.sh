#!/data/data/com.termux/files/usr/bin/bash
# WiFi Cracker Installer for Termux

echo "[*] Downloading run.wificracker..."
mkdir -p $HOME/bin
curl -s https://raw.githubusercontent.com/username/wificracker/main/run.wificracker -o $HOME/bin/run.wificracker

echo "[*] Making it executable..."
chmod +x $HOME/bin/run.wificracker

echo "[*] Adding $HOME/bin to PATH..."
grep -qxF 'export PATH=$HOME/bin:$PATH' ~/.bashrc || echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

echo "[✔] Installation complete!"
echo "Run your WiFi Cracker with: run.wificracker"
