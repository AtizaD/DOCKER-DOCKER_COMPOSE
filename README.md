# Docker and Docker Compose Installation Script

This script automates the installation process for Docker and Docker Compose on Ubuntu systems.
`````
wget https://raw.githubusercontent.com/AtizaD/DOCKER-DOCKER_COMPOSE/main/install_docker.sh; chmod +x install_docker.sh; ./install_docker.sh
`````

## Usage

1. Clone or download the script from this repository.
2. Open a terminal and navigate to the directory containing the script.
3. Make the script executable if it's not already: `chmod +x install_docker.sh`
4. Run the script with sudo privileges: `sudo ./install_docker.sh`

The script will guide you through the installation process and provide feedback on each step.

## Features

- Uninstalls old versions of Docker and related packages.
- Updates the package index to ensure it's up to date.
- Installs necessary packages like ca-certificates, curl, gnupg, and lsb-release.
- Fetches Docker's GPG key from their official repository.
- Adds Docker's repository to the Apt sources list.
- Installs Docker CE, Docker CLI, Containerd, Docker Buildx plugin, and Docker Compose plugin.
- Downloads Docker Compose binary for Linux x86_64.
- Creates a symbolic link for Docker Compose in `/usr/bin`.
- Verifies Docker installation by running a Docker container.
- Verifies Docker Compose installation by checking its version.
- Provides a completion message upon successful installation.

## Note

- This script is specifically designed for Ubuntu systems.
- Ensure you have sudo privileges to run the script.
- It's recommended to review the script before executing it, especially if running on a production system.

## License

This script is provided under the [MIT License](LICENSE).
