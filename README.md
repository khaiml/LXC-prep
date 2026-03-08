🐳 Docker & Portainer Installer for Proxmox LXC (Ubuntu 24.04)

A lightweight bash script to automate the installation of Docker CE, Docker Compose, and Portainer Community Edition on an Ubuntu 24.04 (Noble Numbat) LXC container.
🚀 Features

    Official Repo: Installs Docker from the official Docker repository (not the older docker.io version).

    Docker Compose V2: Includes the latest CLI plugin support.

    Portainer GUI: Automatically deploys Portainer with a persistent data volume.

    IP Auto-Detection: Displays the exact URL to access your dashboard at the end of the script.

⚠️ Important: Proxmox LXC Requirements

Before running this script, your LXC container must have the following features enabled in Proxmox, otherwise Docker will fail to start:

    Select your LXC in Proxmox.

    Go to Options -> Features.

    Check the boxes for:

        [x] Keyctl

        [x] Nesting

    Click OK and restart the container.

🛠️ Installation
Option 1: The Quick Way (One-Liner)

If you have curl installed, you can run this directly:
Bash

curl -sSL https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO_NAME/main/install.sh | bash

Option 2: Manual Installation

    Clone the repository:
    Bash

    git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
    cd YOUR_REPO_NAME

    Make the script executable:
    Bash

    chmod +x install.sh

    Run as root:
    Bash

    ./install.sh

🖥️ Usage

Once the script completes, it will output your Portainer access link:
Plaintext

-------------------------------------------------------
Installation Complete!
Access Portainer at: https://192.168.1.50:9443
-------------------------------------------------------

    Open your browser and go to the link provided.

    Accept the self-signed SSL certificate warning (normal for local Portainer installs).

    Create your admin password and start managing your containers!

🔧 Troubleshooting (LXC Specific)
Storage Driver Issues

If Docker fails to start with an error regarding overlay2, you may need the FUSE driver. Run this inside the LXC:
Bash

apt update && apt install -y fuse-overlayfs

Then restart the container.
Unprivileged Containers

This script is tested and works on Unprivileged containers, provided that Nesting and Keyctl are enabled in the Proxmox "Features" tab.
