#!/bin/bash
printf "Copying Service Units\n"
sudo cp -v packagekit-update.service /etc/systemd/system/packagekit-update.service
printf "Reloading Systemd Daemon\n"
sudo systemctl daemon-reload
printf "Enabling Services\n"
sudo systemctl enable packagekit-update.service
sudo sed --quiet 's/ENABLED=no/ENABLED=yes/gp' /usr/share/PackageKit/packagekit-background.sh
printf "Please Check and Modify /usr/share/PackageKit/packagekit-background.sh\nto Matched Desired Behavior\n"
printf "You Can Also Enable packagekit-background.timer if You Wish to Perform\nUpdates While the System is Online\n"
