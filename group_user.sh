#!/bin/bash

sudo groupadd www-data # create group www-data
sudo usermod -aG www-data user # add user to the group
sudo chgrp -R www-data /path/to/folder # change folder group
sudo chmod -R 770 /path/to/folder # full access to owner & group
