# Setting up autoupdate with Homebrew

The below commands are used to install the autoupdate extension for Homebrew

```bash
brew tap homebrew/autoupdate
```


With the below, we can set to run an autoupdate in every 24 hour

```bash
brew autoupdate start 86400 --upgrade
```

>[!IMPORTANT] The Cask updates would require `--sudo` , but that is not recommended, only for advanced users. 
