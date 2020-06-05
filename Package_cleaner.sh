#! /bin/bash 
#A simple bash script for cleaning packages in Arch linux and  Arch based distros like Manjaro linux.

#Colors used in script
RED='\033[0;31m'
NC='\033[0m'
WHITE="\033[1;37m"

# echo is used to display text
#-e - enable interpretation of backslash escapes
echo -e "${WHITE}Listing Size of Package directory${NC}\n"
# du is used to summarize disk usage of the /var/cache/pacman/pkg folder.
du -h /var/cache/pacman/pkg | grep "/var/cache/pacman/pkg"

echo -e "\n${WHITE}Cleaning unused versions of all packages ${NC}\n"
#pamac is a package manager utility developed by Manjaro Linux team,it is easier to use than pacman
pamac clean 
#To remove older version of packages from cache

echo -e "\n${WHITE}Listing Orphan Packages${NC}\n"
#This requires internet
pamac list -o

echo -e "\n${WHITE}Removing Orphan Packages${NC}\n"
pamac remove -o

echo -e "\n${WHITE}Cleaning AUR build files${NC}\n"
pamac clean -b -v
#Build directory is the one specified in pamac.conf

echo -e "\n${RED}Need Root privileges${NC}"
echo -e "${WHITE}Pacman will delete all the cached packages in /var/cache/pacman/pkg/${NC}"
echo -e "${WHITE}Remove repo will remove unused db files from /var/lib/pacman/sync${NC}"
echo -e "\n${RED}Package Downgrade will not be possible after this${NC}"

#pacman - default package manager utility of ARCH Linux
#This command will clear the entire cache directory.
sudo pacman -Scc

echo -e "${WHITE}Listing Size of Package directory${NC}\n"
du -h /var/cache/pacman/pkg | grep "/var/cache/pacman/pkg"

echo -e "\n${WHITE}Cleaning Complete${NC}"

#Yes I'm a n00b.
