#!/bin/bash

# Update package lists
sudo apt update && sudo apt upgrade -y

# Install Nginx
sudo apt install -y nginx
#sudo systemctl enable nginx
#sudo systemctl start nginx

# Install PostgreSQL
sudo apt install -y postgresql postgresql-contrib
#sudo systemctl enable postgresql
#sudo systemctl start postgresql

# Secure PostgreSQL (Optional: Uncomment the below lines if needed)
# sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'your_secure_password';"

# Install Redis
sudo apt install -y redis-server
#sudo systemctl enable redis
#sudo systemctl start redis

# Node.js (Latest LTS) + npm – JavaScript runtime
sudo apt install -y nodejs npm

# Docker + Docker Compose – Containerization for microservices
sudo apt install -y docker.io docker-compose

# Python Virtual Environment & Tools
sudo apt install -y python3-venv python3-pip

# Certbot (Let's Encrypt SSL) – Free SSL certificates
# sudo apt install -y certbot python3-certbot-nginx

# Fail2Ban – Prevent brute-force attacks
# sudo apt install -y fail2ban

# UFW (Uncomplicated Firewall) – Simple firewall management
# sudo apt install -y ufw

# mc (Midnight Commander) – Terminal-based file manager
# sudo apt install -y mc

# jq – JSON processor for shell scripts
# sudo apt install -y jq
