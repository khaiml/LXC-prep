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

# 5. Create Portainer Data Volume
docker volume create portainer_data

# 6. Deploy Portainer Community Edition
docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest

# 7. Get the local IP address
CONTAINER_IP=$(hostname -I | awk '{print $1}')

echo "-------------------------------------------------------"
echo "Installation Complete!"
echo "Access Portainer at: https://${CONTAINER_IP}:9443"
echo "-------------------------------------------------------"
