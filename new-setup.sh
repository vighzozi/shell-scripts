#!/bin/bash

read -p "Do you wish to run the setup for your device? [y/n]: " choice

if [[ "$choice" == 'y' || "$choice" == 'Y' ]]; then
    echo "Installation begins..."
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
    
    echo "-------------------------"
    brew update
    echo "Installing Languages & Tools..."
    brew install git python go node

    echo "Setup Git communication"
    read -p "Enter your Git username: " git_user
    read -p "Enter your Git e-mail: " git_email

    if [[ -z "$git_user" || -z "$git_email" ]]; then
        echo "Skipping Git setup [missing info]"
    else
        git config --global user.name "$git_user"
        git config --global user.email "$git_email"
        echo "Git identity set to: $(git config --global user.name)"
    fi

    echo "-------------------------"
    echo "Installing GUIs..."
    brew install --cask visual-studio-code iterm2 discord obsidian docker
    sudo ln -sf "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" /usr/local/bin/code
    
    echo "Installing MongoDB Server..."
    brew tap mongodb/brew && brew install mongodb-community
else 
    echo "Setup cancelled"
fi