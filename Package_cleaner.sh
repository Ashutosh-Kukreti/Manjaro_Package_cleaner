#! /bin/bash 
#A simple bash script for cleaning packages in Manjaro Linux or Other Arch based linux distros [including ARCH Linux :) ]
#Colors used in script
RED='\033[0;31m'
NC='\033[0m'
WHITE="\033[1;37m"

# echo is used to display text
#-e - enable interpretation of backslash escapes
echo -e "${WHITE}Listing Disk Usage${NC}\n"
# df is used to report file system disk space usage.
df -h

echo -e "\n${WHITE}Cleaning unused versions of all packages ${NC}\n"
#pamac is a tool available on Manjaro Linux,it is easier to use than pacman
pamac clean -v
#verbose is enabled in pamac

echo -e "\n${WHITE}List and Remove Orphan Packages${NC}\n"
pamac list -o
pamac remove -o

echo -e "\n${WHITE}Clean AUR Build files${NC}\n"
pamac clean -b -v

echo -e "\n${RED}Need Root privileges${NC}\n"
#pacman - package manager utility of ARCH Linux
echo -e "\n${WHITE}To Delete all the cached packages in /var/cache/pacman/pkg/${NC}"
echo -e "\n${RED}Remove repo will remove unused db files from /var/lib/pacman/sync${NC}\n"
sudo pacman -Sc

echo -e "\n${WHITE}Delete all cached packages including the version installed${NC}"
echo -e "\n${RED}Package Downgrade will not be possible after this${NC}\n"
sudo pacman -Scc

echo -e "\n${WHITE}Listing Disk Usage${NC}\n"
df -h

echo -e "\n${WHITE}Cleaning Complete${NC}"
#Yes, I am a n00b.
