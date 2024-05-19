#!/bin/bash

# Prompt user to enter the desired port number
read -p "Enter the desired port number (default is 8092): " PORT
PORT=${PORT:-8092}

# Ensure the docker directory exists
mkdir -p ~/docker/stirling-pdf

# Change to the docker directory
cd ~/docker

# Ensure the stirling-pdf directory exists
mkdir -p stirling-pdf

# Change to the stirling-pdf directory
cd stirling-pdf

# Create the docker-compose.yml file with the specified content
cat <<EOF > docker-compose.yml
services:
  stirling-pdf:
    image: frooodle/s-pdf:latest
    ports:
      - '$PORT:8080'
    volumes:
      - ./trainingData:/usr/share/tessdata # Required for extra OCR languages
      - ./extraConfigs:/configs
  #    - ./customFiles:/customFiles # Uncommented for custom files
  #    - ./logs:/logs # Uncommented for logs
    environment:
      - DOCKER_ENABLE_SECURITY=false
      - INSTALL_BOOK_AND_ADVANCED_HTML_OPS=false
      - LANGS=en_US
EOF

# Pull the latest Stirling PDF Docker image
sudo docker compose pull

# Ensure the trainingData and extraConfigs directories exist
mkdir -p trainingData
mkdir -p extraConfigs

# Change to the trainingData directory
cd trainingData

# Download the English trained data for Tesseract OCR
wget https://github.com/tesseract-ocr/tessdata/raw/main/eng.traineddata

# Change back to the stirling-pdf directory
cd ..

# Start the Stirling PDF service
sudo docker compose up -d

# Display the IP address with the port to access Stirling PDF
IP=$(hostname -I | awk '{print $1}')
echo "Access Stirling PDF at http://$IP:$PORT"
