#!/bin/bash

git clone https://servidor0008.cepsacorp.com/devops-tools/cloudformation-deployer.git ~/cloudformation-deployer
mkdir -p /home/${USER}/.local/bin/
# Checkear el funcionamiento de esta línea.
sudo ln -s cloudformation-deployer/cloudformation_deploy.py /home/${USER}/.local/bin/cloudformation-deployer
python3 -m pip install --user -r requirements.txt