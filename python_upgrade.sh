#!/bin/bash

# Define Python version as a variable
PYTHON_VERSION="3.13.5"

# Extract major.minor version (e.g., 3.13 from 3.13.5)
PYTHON_SHORT_VERSION=$(echo $PYTHON_VERSION | cut -d. -f1,2)

# Update package lists
sudo apt update && sudo apt upgrade -y

# Install necessary dependencies
sudo apt install -y build-essential zlib1g-dev libffi-dev \
    libssl-dev libbz2-dev libreadline-dev libsqlite3-dev \
    libncursesw5-dev libgdbm-dev liblzma-dev libnss3-dev


# Navigate to /usr/src and download Python source code
cd /usr/src
sudo wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz

# Extract the downloaded file
sudo tar xzf Python-$PYTHON_VERSION.tgz

# Navigate to extracted directory and build Python
cd Python-$PYTHON_VERSION
sudo ./configure --enable-optimizations
sudo make -j$(nproc)
sudo make altinstall

# Verify installation
python3.13 --version

# Install pip for new Python version
# curl -sS https://bootstrap.pypa.io/get-pip.py | sudo python3.13
curl -sS https://bootstrap.pypa.io/get-pip.py | sudo python$PYTHON_SHORT_VERSION

# Set the new Python version as the default
# sudo update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.13 2
sudo update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python$PYTHON_SHORT_VERSION 2
sudo update-alternatives --config python3

# Verify default Python version
python3 --version

# Cleanup downloaded files
cd /usr/src
sudo rm -rf Python-$PYTHON_VERSION Python-$PYTHON_VERSION.tgz

echo "Python $PYTHON_VERSION installation completed successfully and set as default."
cd ~
