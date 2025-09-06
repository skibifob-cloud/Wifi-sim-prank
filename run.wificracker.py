#!/usr/bin/env python3
import os, sys, time, random, string
from datetime import datetime

# ---------------- Colors ----------------
try:
    from colorama import Fore, Style, init
except ImportError:
    print("Colorama not found. Installing...")
    os.system("python3 -m pip install colorama")
    from colorama import Fore, Style, init

init(autoreset=True)
COLORS = [Fore.RED, Fore.GREEN, Fore.YELLOW, Fore.CYAN, Fore.MAGENTA, Fore.BLUE]

# ---------------- Passwords ----------------
OWNER_PASSWORD = "aliponly1"
NORMAL_PASSWORD = "freeuser1234"

# ---------------- WiFi Simulation ----------------
WIFI_PREFIXES = ["Coffee","Home","Free","Guest","Office","Airport","Neighbor","Shop","Net"]
WIFI_SUFFIXES = ["WiFi","Network","Hotspot","Link","Net","Zone"]
WIFI_SECURITY = ["(WPA2)","(WPA3)","(Open)","(WEP)"]
USERNAMES = ["admin","guest","user","root","test","wifi"]
PASSWORDS = ["hunter123","password","12345678","letmein","qwerty","ilovecoding"]

# ---------------- Helpers ----------------
def random_banner():
    os.system("clear")
    color = random.choice(COLORS)
    print(f"""{color}
██╗  ██╗ █████╗  ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗ ██████╗ 
██║  ██║██╔══██╗██╔════╝██║ ██╔╝██║████╗  ██║██╔═══██╗██╔══██╗
███████║███████║██║     █████╔╝ ██║██╔██╗ ██║██║   ██║██████╔╝
██╔══██║██╔══██║██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║██╔═══╝ 
██║  ██║██║  ██║╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝██║     
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝     

{Fore.CYAN}                >>> HACKING TOOLS <<<{Fore.RESET}
                   Made by Alip
""")

def generate_wifi(count=5):
    networks=[]
    for _ in range(count):
        name=f"{random.choice(WIFI_PREFIXES)}{random.randint(1,99)}_{random.choice(WIFI_SUFFIXES)}"
        sec=random.choice(WIFI_SECURITY)
        networks.append(f"{name} {sec}")
    return networks

def pause(menu_func):
    input("\nPress Enter to go back...")
    menu_func()

# ---------------- Features ----------------
def wifi_scan(menu_func):
    print(f"{Fore.CYAN}[*] Scanning WiFi...{Fore.RESET}")
    time.sleep(1)
    networks = generate_wifi()
    for i,net in enumerate(networks,1):
        print(f"{i}) {net}")
    pause(menu_func)

def brute_force(menu_func):
    networks = generate_wifi()
    print(f"{Fore.CYAN}[*] Available WiFi:{Fore.RESET}")
    for i,net in enumerate(networks,1): print(f"{i}) {net}")
    try: choice=int(input("Select WiFi: "))-1; target=networks[choice]
    except: print(f"{Fore.RED}Invalid!{Fore.RESET}"); pause(menu_func); return
    user=random.choice(USERNAMES); pwd=random.choice(PASSWORDS)
    print(f"{Fore.RED}Starting brute-force on {target}...{Fore.RESET}")
    for i in range(1,6): print(f"Attempt {i}: {user}:{pwd}"); time.sleep(0.5)
    print(f"{Fore.GREEN}Cracked! {user}:{pwd}{Fore.RESET}")
    with open("brute.log","a") as f: f.write(f"{datetime.now()} | {target} | {user}:{pwd}\n")
    pause(menu_func)

def password_generator(menu_func):
    try: length=int(input("Password length (default 12): "))
    except: length=12
    chars=string.ascii_letters+string.digits+"!@#$%^&*()"
    pwd=''.join(random.choice(chars) for _ in range(length))
    print(f"{Fore.GREEN}Generated: {pwd}{Fore.RESET}")
    pause(menu_func)

def quick_connect(menu_func):
    networks=generate_wifi()
    for i,net in enumerate(networks,1): print(f"{i}) {net}")
    try: choice=int(input("Choose WiFi: "))-1; target=networks[choice]
    except: print(f"{Fore.RED}Invalid{Fore.RESET}"); pause(menu_func); return
    print(f"{Fore.GREEN}Connecting to {target}...{Fore.RESET}")
    for _ in range(3): print("."); time.sleep(0.5)
    print(f"{Fore.GREEN}Connected!{Fore.RESET}")
    pause(menu_func)

def system_info(menu_func):
    print(f"{Fore.YELLOW}[*] System Info:{Fore.RESET}")
    os.system("uname -a"); os.system("uptime -p")
    pause(menu_func)

def pro_mode(menu_func):
    print(f"{Fore.RED}PRO MODE! Ctrl+C to stop.{Fore.RESET}")
    try:
        while True: print(f"[PRO] {datetime.now()} :: Injecting packets..."); time.sleep(0.2)
    except KeyboardInterrupt: print("Pro Mode stopped.")
    pause(menu_func)

def ddos_attack(menu_func):
    target=input("Enter target IP/URL: ")
    print(f"{Fore.YELLOW}Simulating DDoS on {target}. Ctrl+C to stop{Fore.RESET}")
    count=0
    try:
        while True:
            pkt=random.randint(64,1500); port=random.randint(1,65535)
            line=f"[ATTACK] Sent {pkt} bytes to {target}:{port} | Total: {count}"
            print(line); 
            with open("ddos.log","a") as f: f.write(line+"\n")
            count+=1; time.sleep(0.1)
    except KeyboardInterrupt: print("DDoS stopped.")
    pause(menu_func)

def matrix_hack(menu_func):
    columns,rows=50,20
    try:
        while True:
            os.system("clear")
            for _ in range(rows):
                print(''.join(random.choice(string.ascii_letters+string.digits+"!@#$%^&*()") for _ in range(columns)))
            time.sleep(0.1)
    except KeyboardInterrupt: print("Matrix Hack stopped.")
    pause(menu_func)

def clear_logs(menu_func):
    logs=[f for f in os.listdir() if f.endswith(".log")]
    for log in logs: os.remove(log)
    print(f"{Fore.GREEN}Logs cleared!{Fore.RESET}")
    pause(menu_func)

def ip_checker(menu_func):
    host=input("Enter IP/website: ")
    res=os.system(f"ping -c 1 {host} > /dev/null 2>&1")
    print(f"{Fore.GREEN}{host} is UP{Fore.RESET}" if res==0 else f"{Fore.RED}{host} is DOWN{Fore.RESET}")
    pause(menu_func)

def owner_only(menu_func):
    print(f"{Fore.CYAN}[*] Owner feature running...{Fore.RESET}")
    time.sleep(1)
    print(f"{Fore.GREEN}Owner feature complete!{Fore.RESET}")
    pause(menu_func)

# ---------------- Menus ----------------
def normal_menu():
    random_banner()
    print("=== NORMAL MENU ===")
    print("1) WiFi Scan"); print("2) Brute Force"); print("3) Password Generator"); print("4) Quick Connect")
    print("5) System Info"); print("6) Pro Mode"); print("7) DDoS Attack"); print("8) Matrix Hack")
    print("9) Clear Logs"); print("10) IP Checker"); print("99) Switch User"); print("0) Exit")
    choice=input("Choose: ")
    actions={"1":wifi_scan,"2":brute_force,"3":password_generator,"4":quick_connect,
             "5":system_info,"6":pro_mode,"7":ddos_attack,"8":matrix_hack,
             "9":clear_logs,"10":ip_checker,"99":login,"0":exit}
    actions.get(choice,lambda x: print(f"{Fore.RED}Invalid!{Fore.RESET}"))(normal_menu)

def owner_menu():
    random_banner()
    print("=== OWNER MENU ===")
    print("1) WiFi Scan"); print("2) Brute Force"); print("3) Password Generator"); print("4) Quick Connect")
    print("5) System Info"); print("6) Pro Mode"); print("7) DDoS Attack"); print("8) Matrix Hack")
    print("9) Clear Logs"); print("10) IP Checker"); print("11) Owner"); print("99) Switch User"); print("0) Exit")
    choice=input("Choose: ")
    actions={"1":wifi_scan,"2":brute_force,"3":password_generator,"4":quick_connect,
             "5":system_info,"6":pro_mode,"7":ddos_attack,"8":matrix_hack,
             "9":clear_logs,"10":ip_checker,"11":owner_only,"99":login,"0":exit}
    actions.get(choice,lambda x: print(f"{Fore.RED}Invalid!{Fore.RESET}"))(owner_menu)

# ---------------- Login ----------------
def login():
    random_banner()
    pwd=input("Enter password: ")
    if pwd==OWNER_PASSWORD: owner_menu()
    elif pwd==NORMAL_PASSWORD: normal_menu()
    else: print(f"{Fore.RED}Wrong password!{Fore.RESET}"); login()

# ---------------- Start ----------------
login()
