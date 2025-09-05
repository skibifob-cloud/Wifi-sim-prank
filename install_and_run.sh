#!/data/data/com.termux/files/usr/bin/bash

# --------------------------
# Termux One-Command Installer & Runner
# --------------------------

echo "[*] Updating packages..."
pkg update -y && pkg upgrade -y

echo "[*] Installing Python..."
pkg install python -y
pkg install curl -y

echo "[*] Installing colorama..."
pip install --upgrade pip
pip install colorama

echo "[*] Running WiFi Cracker Simulator..."

python3 - << 'EOF'
import os, sys, time
from datetime import datetime

try:
    from colorama import Fore, Style, init
except ImportError:
    os.system("pip install colorama")
    import colorama
    from colorama import Fore, Style, init

init(autoreset=True)
RED = Fore.RED + Style.BRIGHT
GREEN = Fore.GREEN + Style.BRIGHT
YELLOW = Fore.YELLOW + Style.BRIGHT
CYAN = Fore.CYAN + Style.BRIGHT

def banner():
    os.system("clear")
    print(f"""{RED}
██╗    ██╗██╗███████╗██╗       ██████╗██████╗  █████╗  ██████╗██╗  ██╗███████╗██████╗ 
██║    ██║██║██╔════╝██║      ██╔════╝██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗
██║ █╗ ██║██║███████╗██║      ██║     ██████╔╝███████║██║     █████╔╝ █████╗  ██████╔╝
██║███╗██║██║╚════██║██║      ██║     ██╔═══╝ ██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗
╚███╔███╔╝██║███████║███████╗╚██████╗██║     ██║  ██║╚██████╗██║  ██╗███████╗██║  ██║
 ╚══╝╚══╝ ╚═╝╚══════╝╚══════╝ ╚═════╝╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
{Fore.CYAN}                  >>> WiFi Cracker Simulator v2.0 <<<""")

def back_to_menu(): choice=input(f"\n{GREEN}1) Back to Menu{Fore.RESET}\n{RED}0) Exit{Fore.RESET}\nChoose: "); exit() if choice=="0" else menu()

def wifi_scan():
    print(f"{CYAN}[*] Scanning WiFi...{Fore.RESET}")
    time.sleep(2)
    for n in ["1) CoffeeShop_WiFi (WPA2)","2) MyHome_5G (WPA3)","3) FreeAirportWiFi (Open)","4) Neighbor_WiFi (WEP)"]:
        print(n)
    back_to_menu()

def brute_force():
    print(f"{RED}[*] Brute Force started...{Fore.RESET}")
    for i in range(1,6): print(f"Trying password {i}"); time.sleep(1)
    print(f"{GREEN}Password cracked: hunter123{Fore.RESET}")
    with open("brute.log","a") as f: f.write(f"=== Log {datetime.now()} ===\nPassword: hunter123\n")
    back_to_menu()

def system_info():
    print(f"{YELLOW}[*] System Info:{Fore.RESET}")
    print(f"OS: {os.name}, User: {os.getenv('USER')}")
    os.system("uname -r"); os.system("uptime -p")
    back_to_menu()

def pro_mode():
    print(f"{RED}PRO MODE! Press Ctrl+C to stop.{Fore.RESET}")
    try:
        while True: print(f"[PRO] {datetime.now()} :: Injecting packets..."); time.sleep(0.2)
    except KeyboardInterrupt: print("Pro Mode stopped.")
    back_to_menu()

def ddos_attack():
    target=input("Enter target IP/URL: ")
    print(f"{YELLOW}Simulating attack on {target}... Ctrl+C to stop{Fore.RESET}")
    count=0
    try:
        while True:
            pkt=os.urandom(1)[0]%1500+64; port=os.urandom(2)[0]%65535
            line=f"[ATTACK] Sent {pkt} bytes to {target}:{port} | Total {count}"
            print(line); count+=1; time.sleep(0.1)
    except KeyboardInterrupt: print("DDoS stopped.")
    back_to_menu()

def view_logs():
    logs=[f for f in os.listdir() if f.endswith(".log")]
    print(*logs, sep="\n") if logs else print("No logs found.")
    back_to_menu()

def menu():
    banner()
    print("1) WiFi Scan\n2) Brute Force\n3) System Info\n4) Pro Mode\n5) DDoS Attack\n9) View Logs\n0) Exit\n")
    choice=input("Choose: ")
    {"1":wifi_scan,"2":brute_force,"3":system_info,"4":pro_mode,"5":ddos_attack,"9":view_logs,"0":exit}.get(choice,lambda: print("Invalid!"); time.sleep(1); menu)()

menu()
EOF
