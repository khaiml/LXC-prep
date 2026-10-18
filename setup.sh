#!/bin/bash

# 1. Update and install dependencies
apt update && apt install -y ca-certificates curl gnupg lsb-release

# 2. Add Docker's official GPG key
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

# 3. Add the Docker repository (Ubuntu 24.04 'noble')
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

# 4. Install Docker CE, CLI, and Compose Plugin
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "-------------------------------------------------------"
echo "Installation Complete!"
echo "-------------------------------------------------------"
