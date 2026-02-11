# new-setup.sh 

A small script that setup the development environment on Apple Silicon systems. 

## Including
* Homebrew
* VS Code
* Python
* Golang
* Node
* Docker

The script also sets up Git connection (optional)

# golang-update.sh

In case the Golang originnal was not installed via `Homebrew`, so its installation is not possible with `brew install` command, this script is removing the original installation and reinstalling it via Homebrew.

# pdf-mover-v2.sh

You can prompt a source and destination folder. The script is checking if there's any PDF in the source folder - also if the source folder is even existing - and if does it moves to the target folder.
