#!/bin/bash

# Cloning repos
gh repo clone DesterLib/Server /workspaces/Server
gh repo clone DesterLib/Frontend /workspaces/Frontend

# Server setup
pip3 install -r /workspaces/Server/requirements.txt

# Frontend setup
cd /workspaces/Frontend && npm install && npm run build && cd /workspaces
mv /workspaces/Frontend/build /workspaces/Server/build

# Rclone setup
curl https://rclone.org/install.sh | sudo bash
