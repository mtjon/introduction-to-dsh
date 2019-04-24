---
title: "SSH guide"
---
<!-- .slide: data-background="./images/kpn-intro-bg-md.jpg" -->
# SSH guides

<!--s-->
# Terminology, definitions, and things to interact with.
- VM: Virtual Machine. the trainer made one for everyone. It lives in the cloud, and you will need to authenticate to interact with it. We will identify these based on their IP.
- SSH: secure shell. A way to interact with remote systems (such as our VM)
- Keyfile: a file, which acts like a key. You will generate your own unique keyfile, which will then be given to your VM.

<!--s-->
# Do you already have SSH?
1. Open a terminal, or open PowerShell (WIN+X, A, click `yes`).
2. type `ssh`, and hit `enter`

If you see a response (i.e. not an error), you have SSH!
Hang back and wait for everyone else to catch up!

<!-- Hang back and let the plebians deal with the horror of installing basic software. -->

<!--s-->
# Getting SSH (Powershell) 

Type the following commands in PowerShell (type `y` when asked)
```powershell
Find-Module Posh-SSH
Install-Module Posh-SSH
```
You now have PowerShell installed!

First, type `ssh`, and see if it still generates an error. 
- If the error disappeared, you have SSH! (and you use the default `ssh` command)
- If yes, go to the next slide (down):

<!--v-->
# Using SSH (Powershell) 
Create a new SSH session
```powershell
New-SSHSession -ComputerName "YOUR_IP_HERE" -Credential (Get-Credential)
```
And follow the instructions.

Finally, run commands using 
```powershell
Invoke-SSHCommand -Index 0 -Command "whoami"
```
Note that PowerShell sends one command over SSH at a time. Replace `whoami` with the command you want to run.

<!-- ALT:
Enter-PSSession -HostName UserA@LinuxServer02:22 -KeyFilePath c:\<path>\userAKey_rsa
Enter-PSSession -HostName UserA@LinuxServer01 -->
<!--v-->

# Powershell SSH key generation

Start powershell, and run:
```powershell
mkdir %userprofile%/.ssh
cd %userprofile%/.ssh
ssh-keygen -t rsa -C "your_email@example.com"
```
And follow the instructions, naming the key as follows: `id_yourname`. If this generates an error, attract the attention of the trainer.

Open the run dialog (WIN+R), and type `%userprofile%/.ssh`. You should find two files, of which one  the public (`.pub`) key. Send the public key to the trainer.


<!--s-->
# Getting Putty

<!--v-->
# SSH key generation

<!--s-->
# Getting WSL

- Open PowerShell (WIN+X, A), and run the following command:
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```
<!-- - This simple command tells Windows to go and collect the Windows Subsystem for Linux, without you needing to go through all the menu's and clickyboxes. -->
- Reboot when prompted.
- After rebooting, open the Windows Store, and search for `Ubuntu`.
- Click `install` or `download`, and wait for it to complete.
- When it's done, there should be an icon for Ubuntu. Click it, set (and remember!) your password.
- Go to the next slide (down)

<!--v-->
# SSH key generation
- In your Ubuntu terminal, type 
```bash
sudo apt install ssh
ssh-keygen -t rsa
```
- Follow the instructions. 
- Open the `run` dialog in Windows (WIN+R), and enter
`%LocalAppData%\Packages\`
- Find the one that has `Ubuntu` in its name 
<!-- (CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc) -->
- Drill down to `\LocalState\rootfs\home\`, 
- Open the folder corresponding to your Ubuntu username, and open the .ssh folder. 
- Mail the `.pub` file to the trainer.

<!--s-->
# Connecting
Let's say you've mailed your public keyfile to the trainer, and he sent you the IP of your VM.
- Your `ssh key` is in `.ssh`, and is called `id_iot`.
- The IP you got is 52.59.203.96.
You will then run:
```powershell
ssh -i .ssh/id_iot ubuntu@52.59.203.96
```
Where the -i flag stands for `identity`, and `ubuntu` is the default username.

Note that if you're using PowerShell and it's not cooperating, go to the next slide (down)
<!--v-->
# Using SSH (Powershell) 
Create a new SSH session
```powershell
New-SSHSession -ComputerName "YOUR_IP_HERE" -Credential (Get-Credential)
```
And follow the instructions.

Finally, run commands using 
```powershell
Invoke-SSHCommand -Index 0 -Command "whoami"
```
Note that PowerShell sends one command over SSH at a time. Replace `whoami` with the command you want to run.

<!-- ALT:
Enter-PSSession -HostName UserA@LinuxServer02:22 -KeyFilePath c:\<path>\userAKey_rsa
Enter-PSSession -HostName UserA@LinuxServer01 -->

<!--s-->
# UMP

https://s3.eu-central-1.amazonaws.com/dsh-ump/auto-update/dsh-ump-1.2.0-x86_64.AppImage
https://s3.eu-central-1.amazonaws.com/dsh-ump/auto-update/DSH-UMP-1.2.0.dmg
https://s3.eu-central-1.amazonaws.com/dsh-ump/auto-update/DSH-UMP+Setup+1.2.0.exe