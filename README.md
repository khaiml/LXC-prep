-------------------------------------------------------------
🐳 Docker Installer for Proxmox LXC (Ubuntu 24.04)
-------------------------------------------------------------
A lightweight bash script to automate the installation of Docker CE, Docker Compose on an Ubuntu 24.04 (Noble Numbat) LXC container.

🚀 Features:

Official Repo: Installs Docker from the official Docker repository (not the older docker.io version).

Docker Compose V2: Includes the latest CLI plugin support.

IP Auto-Detection: Displays the exact URL to access your dashboard at the end of the script.

⚠️ Important: Proxmox LXC Requirements

Before running this script, your LXC container must have the following features enabled in Proxmox, otherwise Docker will fail to start:

    Select your LXC in Proxmox.
    Go to Options -> Features.
    heck the boxes for:

    [x] Keyctl
    [x] Nesting

    Click OK and restart the container.

🛠️ Installation
Option 1: The Quick Way (One-Liner)

If you have curl installed, you can run this directly:

    curl -sSL https://raw.githubusercontent.com/khaiml/LXC-prep/main/setup.sh | bash

Option 2: Manual Installation

Clone the repository:

    git clone https://github.com/khaiml/LXC-prep.git
    cd LXC-prep

Make the script executable:

    chmod +x setup.sh

Run as root:

    ./setup.sh

🖥️ Usage

Once the script completes, it will output your Portainer access link:

    Installation Complete!

Open your browser and go to the link provided.

🔧 Troubleshooting (LXC Specific)
Storage Driver Issues

If Docker fails to start with an error regarding overlay2, you may need the FUSE driver. Run this inside the LXC:

    apt update && apt install -y fuse-overlayfs

Then restart the container.
Unprivileged Containers

This script is tested and works on Unprivileged containers, provided that Nesting and Keyctl are enabled in the Proxmox "Features" tab.
