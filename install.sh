#!/bin/bash

# Clear terminal screen
clear

# Define Premium ANSI Color Codes
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}=====================================================${NC}"
echo -e "${CYAN}       AUTOMATED REPOSITORY CLONE & ENGINE LAUNCHER${NC}"
echo -e "${YELLOW}=====================================================${NC}\n"

# 1. Update Termux repositories and packages
echo -e "${CYAN}[*] Updating Termux repositories and packages...${NC}"
apt update && apt upgrade -y

# 2. Install Core Dependencies
echo -e "${CYAN}[*] Installing Core Dependencies (Python, OpenSSL, Git)...${NC}"
pkg install python openssl git -y

# 3. Upgrade PIP and install Python modules
echo -e "${CYAN}[*] Upgrading PIP (Python Package Installer)...${NC}"
pip install --upgrade pip

echo -e "${CYAN}[*] Installing required Python modules (requests)...${NC}"
pip install requests

# 4. Clone repository from GitHub and navigate into it
echo -e "${CYAN}[*] Cloning 'sni_hunter' repository from GitHub...${NC}"
if [ -d "sni_hunter" ]; then
    echo -e "${YELLOW}[!] 'sni_hunter' directory already exists. Updating source...${NC}"
    cd sni_hunter
    git pull
else
    git clone https://github.com/chamika2/sni_hunter
    cd sni_hunter
fi

# 5. Configure execution permissions
echo -e "${CYAN}[*] Configuring script execution permissions...${NC}"
chmod +x * > /dev/null 2>&1

echo -e "\n${GREEN}[+] ALL PACKAGES INSTALLED & CLONED SUCCESSFULLY!${NC}"
echo -e "${YELLOW}[*] Launching run.py automatically... Please wait...${NC}\n"
time.sleep(2)

# 6. Execute the main Python script automatically
if [ -f "run.py" ]; then
    python run.py
else
    echo -e "${RED}[!] Error: run.py was not found inside the 'sni_hunter' directory!${NC}"
    echo -e "${CYAN}[i] Directory Contents:${NC}"
    ls -la
fi
