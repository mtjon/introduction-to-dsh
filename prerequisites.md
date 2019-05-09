# Prerequisites to the Tenant-in-a-day-training
## General information

This guide is ensure the training proceeds as desired, with all participants having fullfilled all basic requirements. 
Steps everybody needs to perform:
1. You will generate your own unique [keypair](##glossary).
2. You will send your public key to your trainer.
3. Your public key will be given to your [VM](##glossary), which will then be able to recognize and authenticate your [SSH](##glossary) session.
4. You will download [UMP](##glossary), to be able to interact with the [DSH](##glossary).

Optionally, if you don't already have it, you may need to set up a way to use SSH.

If you are already familiar with SSH and creating a keypair, you can skip straight to your preferred version of 'connecting'.

## Options to connect over SSH
- Linux and Mac have an SSH client built in. [Proceed to Generating a keypair in Linux/Mac](#linmac).
- Windows sometimes comes with ssh. To check, you open Powershell (WIN+X, A, click `yes`) and type `ssh`. You will either get feedback stating:
    - ssh is unknown, meaning you don't have it, so you should continue to the next step (if Windows doesn't have ssh.
    - you didn't supply required parameters (meaning you have it, and should proceed to [generating a keypair in Git Bash](#gitbash), as the commands are the same).
- If Windows doesn't have ssh, you have several options:
    - [Windows Subsystem for Linux (WSL)](https://devblogs.microsoft.com/commandline/learn-about-windows-console-and-windows-subsystem-for-linux-wsl/) allows you to run Linux commands (including SSH) on your Windows system.
    - [Git for windows](https://gitforwindows.org/) allows you to run git commands, through a bash shell. There is even a portable version that does not require admin rights.
    - Many more options. You can use whatever you're comfortable with. _(note that the format in which PuttyGen stores the keys is _not_ standard; you will need to copy the generated key in a new text file)_

WSL has our preference, with Git for Windows acting as a backup-option. Guide for both options have been included.

## Generating a keypair in Linux/Mac
<a name="linmac"></a>
1. In your terminal, type 
```bash
ssh-keygen -t rsa
```
2. Follow the instructions. Note that you will have to set a password.
3. It will state in which folder your keypair will have been saved. Use a file explorer to navigate to this folder.
4. Mail the [public key](##glossary) file to the trainer.

## Getting WSL
<a name="getwsl"></a>
1. Open PowerShell (WIN+X, A), and run the following command:
```powershell
Enable-WindowsOptionalFeature -Online -Featureame Microsoft-Windows-Subsystem-Linux
```
<!-- - This simple command tells Windows to go and collect the Windows Subsystem for Linux, without you needing to go through all the menu's and clickyboxes. -->
2. Reboot when prompted.
3. After rebooting, open the Windows Store, and search for `Ubuntu`.
4. Click `install` or `download`, and wait for it to complete.
5. When it's done, there should be an icon for Ubuntu. Click it, set (and remember!) your password.

## Generating a keypair in WSL
6. In your Ubuntu terminal, type 
```bash
sudo apt install ssh
ssh-keygen -t rsa
```
7. Follow the instructions. Note that you will have to set a password.
8. Open the `run` dialog in Windows (WIN+R), and enter
`%LocalAppData%\Packages\`
9. Find the folder that has `Ubuntu` in its name. For example `CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc`
12. Drill down to `\LocalState\rootfs\home\`
13. Open the folder corresponding to your Ubuntu username, and open the .ssh folder. 
14. Mail the [public key](##glossary) file to the trainer.

## Using WSL
After you've mailed your public key to the trainer, you will receive the IP of your [VM](##glossary). So:
- Your `ssh key` is in `.ssh`, and is called `id_iot`. 
- The IP you got is 52.59.203.96.
You will then run:
```powershell
ssh -i .ssh/id_iot ubuntu@52.59.203.96
```
Where the -i flag stands for `identity`, and `ubuntu` is the default username.


## Getting Git Bash
1. Download Git for Windows.
    - If you have admin rights, use the [installer](https://github.com/git-for-windows/git/releases/download/v2.21.0.windows.1/Git-2.21.0-64-bit.exe).
    - If you do _not_ have admin rights, use the [portable version](https://github.com/git-for-windows/git/releases/download/v2.21.0.windows.1/PortableGit-2.21.0-64-bit.7z.exe).
2. Install or unpack Git for Windows.
3. Start Git Bash
    - If Git for Windows was installed, it will create an entry in the context menu, allowing you to open a Git Bash in whatever folder you prefer.
    - If the portable version is used, you will need to start the bash from the executable found in the unpacked folder.
4. If needed, navigate to a preferred folder. (use `pwd` to figure out where you are, use `cd` to navigate)

## Generating a keypair in Git Bash
<a name="gitbash"></a>
1. In Git Bash, type `ssh-keygen -o`, and follow the instructions.
    - Note that you will have to set a password.
    - If the .ssh folder does not exist, it will give an error. You can solve this by navigating to `%userprofile%` and running `mkdir .ssh`.
2. Locate the keypair, which by default ends up in `%userprofile%/.ssh`. 
3. Mail the [public key](##glossary) file to the trainer.

## Using Git Bash
After you've mailed your public key to the trainer, you will receive the IP of your [VM](##glossary). So:
- Your `ssh key` is in `.ssh`, and is called `id_iot`. 
- The IP you got is 52.59.203.96.
You will then navigate to the folder where your private key exists, and run:
```bash
ssh -i id_iot ubuntu@52.59.203.96
```
Where the -i flag stands for `identity`, and `ubuntu` is the default username.


## Getting UMP

Use one of the following links to download UMP, and install it. 

[Linux](https://s3.eu-central-1.amazonaws.com/dsh-ump/auto-update/dsh-ump-1.2.0-x86_64.AppImage)

[Mac](https://s3.eu-central-1.amazonaws.com/dsh-ump/auto-update/DSH-UMP-1.2.0.dmg)

[Windows](https://s3.eu-central-1.amazonaws.com/dsh-ump/auto-update/DSH-UMP+Setup+1.2.0.exe)

You will be guided through the usage of UMP during the training.
<!-- for now, simply install it, and leave it alone. -->

## Glossary
- VM: Virtual Machine. The trainer made one for everyone. These will be identified based on their IP.
- SSH: secure shell. A way to interact with remote systems (such as our VM). 
- Authentication: the VM only allows SSH connections from systems it knows. So, you'll need to authenticate. 
- A keypair authenticates you as a user, and consists of two parts:
   - A private key. You do _NOT_ share this, ever.
   - A public key, which you can share. This file tends to end in `.pub`
