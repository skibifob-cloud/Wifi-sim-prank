#!/bin/bash
# Ultimate Wifi Hacker PRANK (Pro Mode + stop.log Edition)

# Colors
RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
RESET="\e[0m"

random_mac() {
  hexchars="0123456789ABCDEF"
  echo "$(for i in {1..6}; do echo -n ${hexchars:$((RANDOM%16)):1}${hexchars:$((RANDOM%16)):1}; if [ $i -lt 6 ]; then echo -n ":"; fi; done)"
}

random_signal() {
  echo "-$((30 + RANDOM % 60)) dBm"
}

random_ip() {
  echo "192.168.$((RANDOM % 255)).$((RANDOM % 255))"
}

loading_bar() {
  bar="##################################################"
  for i in {1..50}; do
    sleep 0.03
    printf "\r${CYAN}[%-50s] %d%%${RESET}" "${bar:0:i}" $((i*2))
  done
  echo ""
}

fake_scan() {
  echo -e "${YELLOW}[*] Scanning nearby WiFi networks...${RESET}"
  sleep 2
  count=$((3 + RANDOM % 4))
  for i in $(seq 1 $count); do
    ssid="Network_$((RANDOM % 999))"
    mac=$(random_mac)
    sig=$(random_signal)
    echo -e "${GREEN}[+] Found:${RESET} $ssid | MAC: $mac | Signal: $sig"
    sleep 1
  done
  echo ""
}

fake_deauth() {
  target=$1
  echo -e "${CYAN}[*] Launching deauthentication attack on $target...${RESET}"
  for i in {1..10}; do
    mac=$(random_mac)
    echo "[*] Deauth packet sent to client $mac"
    sleep 0.2
  done
  echo -e "${GREEN}[+] All clients disconnected from $target${RESET}"
}

fake_sniff() {
  echo -e "${YELLOW}[*] Starting packet sniffing...${RESET}"
  packets=0
  for i in {1..20}; do
    packets=$((packets + RANDOM % 200))
    echo "[*] Captured $packets packets"
    sleep 0.2
  done
  echo -e "${GREEN}[+] Handshake successfully captured!${RESET}"
}

network_info() {
  echo -e "${CYAN}[*] Gathering network info...${RESET}"
  sleep 1
  echo "---------------------------------"
  echo " Local IP     : $(random_ip)"
  echo " Gateway      : 192.168.1.1"
  echo " MAC Address  : $(random_mac)"
  echo " Interface    : wlan0"
  echo "---------------------------------"
}

attack_network() {
  target=$1
  echo -e "${CYAN}[*] Targeting $target...${RESET}"
  sleep 1
  fake_deauth "$target"
  sleep 1
  fake_sniff
  sleep 1
  echo -e "${GREEN}[+] Password cracked for $target:${RESET} hackme$((RANDOM % 9999))"
}

pro_mode() {
  clear
  echo -e "${RED}[*] Entering Pro Mode...${RESET}"
  sleep 2
  clear
  echo -e "${CYAN}[*] Advanced hacking session started...${RESET}"
  echo -e "${YELLOW}[*] Type 'stop.log' anytime to terminate logs.${RESET}"
  echo ""

  while true; do
    # Generate random log lines
    case $((RANDOM % 4)) in
      0) echo "[DEBUG] Injecting packet from $(random_ip) ($(random_mac))" ;;
      1) echo "[INFO] Captured handshake WPA2 Key Index=$((RANDOM % 5))" ;;
      2) echo "[TRACE] Bruteforce attempt pass=$((RANDOM % 999999))" ;;
      3) echo "[WARNING] Possible IDS detected on channel $((RANDOM % 11))" ;;
    esac

    sleep 0.05

    # Check if user typed stop.log
    read -t 0.01 input
    if [[ $input == "stop.log" ]]; then
      echo ""
      echo -e "${GREEN}[✓] Pro Mode terminated. Returning to menu...${RESET}"
      sleep 2
      break
    fi
  done
}

# === MAIN MENU ===
while true; do
  clear
  echo -e "${RED}"
  echo "██╗    ██╗██╗███████╗██╗     ██████╗██████╗  █████╗  ██████╗██╗  ██╗███████╗██████╗ "
  echo "██║    ██║██║██╔════╝██║    ██╔════╝██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗"
  echo "██║ █╗ ██║██║█████╗  ██║    ██║     ██████╔╝███████║██║     █████╔╝ █████╗  ██████╔╝"
  echo "██║███╗██║██║██╔══╝  ██║    ██║     ██╔═══╝ ██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗"
  echo "╚███╔███╔╝██║███████╗██║    ╚██████╗██║     ██║  ██║╚██████╗██║  ██╗███████╗██║  ██║"
  echo " ╚══╝╚══╝ ╚═╝╚══════╝╚═╝     ╚═════╝╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝"
  echo -e "${RESET}"
  echo "================================================================================="
  echo -e "${CYAN}[1] Hack neighbour's WiFi${RESET}"
  echo -e "${CYAN}[2] Crack school WiFi${RESET}"
  echo -e "${CYAN}[3] Steal hotel WiFi password${RESET}"
  echo -e "${CYAN}[4] Open coffee shop WiFi${RESET}"
  echo -e "${CYAN}[5] Fake Network Info${RESET}"
  echo -e "${CYAN}[6] Run Full Fake Scan${RESET}"
  echo -e "${YELLOW}[7] Pro Mode (Advanced Hacker)${RESET}"
  echo -e "${RED}[8] Exit${RESET}"
  echo "================================================================================="
  read -p "Choose an option: " opt

  case $opt in
    1) fake_scan; attack_network "MyHomeWiFi";;
    2) fake_scan; attack_network "SchoolNet";;
    3) fake_scan; attack_network "Hotel_FreeWiFi";;
    4) fake_scan; attack_network "CoffeeShopNet";;
    5) network_info;;
    6) fake_scan;;
    7) pro_mode;;
    8) echo "[*] Exiting..."; exit;;
    *) echo -e "${RED}[!] Invalid option!${RESET}";;
  esac

  echo ""
  read -p "Press Enter to return to menu..."
done
