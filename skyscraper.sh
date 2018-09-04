#!/bin/bash
# Skyscraper Install and Update script by 2Play!
# Skyscraper written by Lars Muldjor

infobox=""
infobox="${infobox}Skyscraper Install and Update script by 2Play!\n\n"
infobox="${infobox}\n"
infobox="${infobox}This script will install Skyscraper engine or update it if already in yuor system.\n"
infobox="${infobox}A powerful and versatile yet easy to use game scraper. Supports EmulationStation & AttractMode, 61+ systems. Written by Lars Muldjord.\n"
infobox="${infobox}\n"
infobox="${infobox}Its cli based so you need to read the ReadMe.md file came with PlayBox or officially on the git page.\n > To set frontend use -f EmulationStation or AttractMode \n > To set paltform use -p (See list of the 61 supported systems)\n > To set scrape source use -s [WEB: openretro.org, WEB: thegamesdb.net, WEB: worldofspectrum.org, WEB: adb.arcadeitalia.net (Arcade DB by motoschifo), WEB: screenscraper.fr, LOCAL: localdb (scrapes exclusively from cached resources.), LOCAL: import (imports resources into the local cache.)]"
infobox="${infobox}\n"
infobox="${infobox}\n"


dialog --backtitle "Skyscraper" \
--title "Skyscraper Retropie Script by 2Play!" \
--msgbox "${infobox}" 35 110

function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "Which Skyscraper option you want to run?" 25 75 20 \
            1 "Update Skyscraper by Lars Muldjord" \
            2 "Install Skyscraper by Lars Muldjord" \
            3 "Install Skyscraper by Lars Muldjord - New System" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) update_ss  ;;
            2) install_ss  ;;
            3) install_ssn  ;;
            *)  break ;;
        esac
    done
}


function update_ss() {
	dialog --infobox "...Updating..." 3 20 ; sleep 2
	clear
	sleep 1 
	./home/pi/code/skysource/update_skyscraper.sh

}

function install_ss() {
	dialog --infobox "...Installing..." 3 22 ; sleep 2
	clear
	sudo apt-get update && sudo apt-get install qt5-default && cd /home/pi/code && sudo rm -rf skysource && mkdir skysource && cd skysource && curl https://raw.githubusercontent.com/muldjord/skyscraper/master/update_skyscraper.sh | bash

}

function install_ssn() {
	dialog --infobox "...Installing..." 3 22 ; sleep 2
	clear
	sudo apt-get update && sudo apt-get install qt5-default && cd /home/pi && mkdir code && cd /home/pi/code && mkdir skysource && cd skysource && curl https://raw.githubusercontent.com/muldjord/skyscraper/master/update_skyscraper.sh | bash

}

main_menu