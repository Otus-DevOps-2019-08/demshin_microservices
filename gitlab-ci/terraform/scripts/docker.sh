#!/bin/bash

set -eu

# Docker
sudo apt update
sudo apt-get install --yes \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD8
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
sudo apt update
sudo apt-get --yes install docker-ce docker-compose
sudo usermod -aG docker ${USER}
sudo systemctl enable docker
printf '\nDocker installed successfully\n\n'
printf 'Waiting for Docker to start...\n\n'
sleep 3

# # Docker Compose
# sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
# sudo chmod +x /usr/local/bin/docker-compose \
# sudo wget \
#         --output-document=/etc/bash_completion.d/docker-compose \
# "https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose" \
# && printf '\nDocker Compose installed successfully\n\n'
