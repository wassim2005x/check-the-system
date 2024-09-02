#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo apt update

# Upgrade existing packages
echo "Upgrading existing packages..."
sudo apt upgrade -y

# Install Telegram
echo "Installing Telegram..."
sudo snap install telegram-desktop

# Install Discord
echo "Installing Discord..."
sudo snap install discord

# Install VS Code
echo "Installing Visual Studio Code..."
sudo snap install --classic code

# Install Brave Browser
echo "Installing Brave Browser..."
sudo apt install apt-transport-https curl -y
sudo curl -fsSLo /etc/apt/trusted.gpg.d/brave.asc https://brave.com/brave-core.asc
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

# Install Google Chrome
echo "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install -y

# Install Blender
echo "Installing Blender..."
sudo snap install blender --classic

 
# Cleanup
echo "Cleaning up..."
rm google-chrome-stable_current_amd64.deb

echo "Installation completed successfully!"
