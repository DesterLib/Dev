#!/bin/bash

gh repo clone DesterLib/Server /workspaces/Server
gh repo clone DesterLib/Frontend /workspaces/Frontend

pip3 install -r /workspaces/Server/requirements.txt
cd /workspaces/Frontend && npm install && cd /workspaces
