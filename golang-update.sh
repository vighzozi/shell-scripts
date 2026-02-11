#!/bin/bash

GO_PATH=$(which go)

if [ -n "$GO_PATH" ]; then
	echo "Golang found at: $GO_PATH"
	echo "Preparing to remove current installation"
	# manual deletion of the standard installation folder
	if [ -d "/usr/local/go" ]; then
		echo "Removing /usr/local/go [Standard installer path]..."
		sudo rm -rf /usr/local/go
	fi
	
	# remove binaries
	sudo rm -f /usr/local/bin/go
	
	# jsut to be sure - do a brew deletion
	brew uninstall --force go 2>/dev/null

	echo "Cleanup finished!"
else
	echo "No existing Golang installation detected by 'which'."
fi

# Re-install
echo "----------------------------------------------"
read -p "Would you like to install a fresh Go version via Homebrew? [y/n]: " choice 

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
	echo "Installing Golang via Homebrew..."
	brew install go

	# Check Golang version
	echo "New installation version: " 
	go version
else
	echo "Installation cancelled"
fi
