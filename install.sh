#!/bin/bash


GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

clear
echo -e "${YELLOW}=====================================================${NC}"
echo -e "${CYAN}       PRASA ENGINE & SNI HUNTER INSTALLER${NC}"
echo -e "${YELLOW}=====================================================${NC}\n"

# 1. Termux Repositories Update 
echo -e "${CYAN}[*] Updating Termux repositories and packages...${NC}"
apt update && apt upgrade -y

# 2. (Dependencies) Install
echo -e "${CYAN}[*] Installing Core Dependencies (Python, OpenSSL, Git)...${NC}"
pkg install python openssl git -y

# 3. Python PIP , Modules Install 
echo -e "${CYAN}[*] Upgrading PIP (Python Package Installer)...${NC}"
pip install --upgrade pip

echo -e "${CYAN}[*] Installing required Python modules (requests)...${NC}"
pip install requests

# 4. GitHub SNI Hunter Clone 
echo -e "${CYAN}[*] Cloning SNI Hunter from GitHub...${NC}"
if [ -d "sni_hunter" ]; then
    echo -e "${YELLOW}[!] 'sni_hunter' directory already exists. Pulling updates...${NC}"
    cd sni_hunter && git pull && cd ..
else
    git clone https://github.com/chamika2/sni_hunter
fi

# 5. Permission 
echo -e "${CYAN}[*] Setting permissions for executable scripts...${NC}"
if [ -d "sni_hunter" ]; then
    chmod +x sni_hunter/* > /dev/null 2>&1
fi

# Python Script 'script.py'  Permission
if [ -f "script.py" ]; then
    chmod +x snf.py
fi

echo -e "\n${YELLOW}=====================================================${NC}"
echo -e "${GREEN}[+] ALL PACKAGES & TOOLS INSTALLED SUCCESSFULLY!${NC}"
echo -e "${YELLOW}=====================================================${NC}\n"

echo -e "${CYAN}[i] 1. To run PRASA Engine:${NC} ${GREEN}python script.py${NC}"
echo -e "${CYAN}[i] 2. To use SNI Hunter:${NC} ${GREEN}cd sni_hunter${NC} then check its files."
echo -e "${YELLOW}=====================================================${NC}"
