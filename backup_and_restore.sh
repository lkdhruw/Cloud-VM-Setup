#!/bin/bash

tar -czvf backup_$(date +%Y_%m_%d).tar.gz \
/var/www/project_folder \
/etc/nginx/sites-available/your_site \
/etc/systemd/system/your_service.service

# To upload from directory
# scp -i ~/.ssh/private_key backup_$(date +%Y_%m_%d).tar.gz <user>@<server>:/home/<user>/

tar -xzvf backup_$(date +%Y_%m_%d).tar.gz
