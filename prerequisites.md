---
title: "Prerequisites to the Tenant-in-a-day-training"
---

# General information

This guide is ensure the training proceeds as desired, with all participants having fullfilled all basic requirements. 
Steps everybody needs to perform:
1. You will generate your own unique [keyfile](#glossary).
2. You will send this keyfile to your trainer.
3. Your keyfile will be given to your [VM](#glossary), which will then be able to recognize and authenticate your [SSH](#glossary) session.
4. You will download [UMP](#glossary), to be able to interact with the [DSH](#glossary).

Optionally, if you don't already have it, you may need to set up a way to use SSH.

If you are already familiar with SSH and creating keyfiles, you can skip straight to 'connecting'.

# Options to connect over SSH
- Linux and Mac have an SSH client built in.
- Windows _usually_ does not. 
    - Windows Subsystem for Linux allows you to run Linux commands (including SSH) on your Windows system.
    - MingWin/Git Bash
    - Many more options. You can use whatever you're comfortable with.
        	- Note, however, that the format in which PuttyGen stores the keys is _not_ standard; you will need to copy the generated key in a new text file

# Getting WSL
1. Open PowerShell (WIN+X, A), and run the following command:
```powershell
Enable-WindowsOptionalFeature -Online -Featureame Microsoft-Windows-Subsystem-Linux
```
<!-- - This simple command tells Windows to go and collect the Windows Subsystem for Linux, without you needing to go through all the menu's and clickyboxes. -->
2. Reboot when prompted.
3. After rebooting, open the Windows Store, and search for `Ubuntu`.
4. Click `install` or `download`, and wait for it to complete.
5. When it's done, there should be an icon for Ubuntu. Click it, set (and remember!) your password.
7. Go to the next slide (down)

# SSH keys (WSL)
8. In your Ubuntu terminal, type 
```bash
sudo apt install ssh
ssh-keygen -t rsa
```
9. Follow the instructions. 
10. Open the `run` dialog in Windows (WIN+R), and enter
`%LocalAppData%\Packages\`
11. Find the one that has `Ubuntu` in its name 
<!-- (CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc) -->
12. Drill down to `\LocalState\rootfs\home\`, 
13. Open the folder corresponding to your Ubuntu username, and open the .ssh folder. 
14. Mail the `.pub` file to the trainer.

# Using WSL
Let's say you've mailed your public keyfile to the trainer, and he sent you the IP of your VM.
- Your `ssh key` is in `.ssh`, and is called `id_iot`.
- The IP you got is 52.59.203.96.
You will then run:
```powershell
ssh -i .ssh/id_iot ubuntu@52.59.203.96
```
Where the -i flag stands for `identity`, and `ubuntu` is the default username.

Note that if you're using PowerShell and it's not cooperating, go to the next slide (down)


# Getting Git Bash (MingWin)
[Link](https://git-scm.com/download/win)


# Generating a keyfile (MingWin)




# Getting UMP

Use one of the following links to download UMP, and install it. You will be guided through the usage of UMP during the training.

[Linux](https://s3.eu-central-1.amazonaws.com/dsh-ump/auto-update/dsh-ump-1.2.0-x86_64.AppImage)

[Mac](https://s3.eu-central-1.amazonaws.com/dsh-ump/auto-update/DSH-UMP-1.2.0.dmg)

[Windows](https://s3.eu-central-1.amazonaws.com/dsh-ump/auto-update/DSH-UMP+Setup+1.2.0.exe)

# Glossary
- VM: Virtual Machine. The trainer made one for everyone. We will identify these based on their IP.
- SSH: secure shell. A way to interact with remote systems (such as our VM). 
- Authentication: the VM only allows SSH connections from systems it knows. So, you'll need to authenticate. 
- A keyfile authenticates you as a user, and consists of two parts:
   - A private key. You do _NOT_ share this, ever.
   - A public key, which you can share. 
