#!/bin/bash

# Cloning repos
gh repo clone DesterLib/Backend /workspaces/Backend
gh repo clone DesterLib/Frontend /workspaces/Frontend
gh repo clone DesterLib/Docs /workspaces/Docs

# Backend setup
python3 -m venv /workspaces/Backend/.venv
source /workspaces/Backend/.venv/bin/activate
pip3 install -r /workspaces/Backend/requirements.txt

# Frontend setup
cd /workspaces/Frontend && npm install && npm run build && cd /workspaces
mv /workspaces/Frontend/build /workspaces/Backend/build

# Docs setup
cd /workspaces/Docs && npm install && cd /workspaces

# Rclone setup
curl https://rclone.org/install.sh | sudo bash

# Wine setup
sudo dpkg --add-architecture i386
wget -qO- https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo apt-add-repository "deb https://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main"
sudo apt update
sudo apt install -y --install-recommends winehq-stable
