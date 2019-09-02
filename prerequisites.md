# Prerequisites to the Tenant-in-a-day-training

## General information

This guide aims to ensure the Tenant-in-one-Day-training proceeds as desired, with all participants having fullfilled all basic pre-requisites.

Required:

- Basic knowledge of [SSH](#glossary)
- A shell capable of SSH, or an ssh client

Optional:

- [UMP](#glossary), to be able to interact with the [DSH](#glossary)

Before the training starts, you will receive:

- The IP-address of your [virtual machine (VM)](#glossary), which will be created for the purposes of this training
- A private SSH key. This key is part of a [keypair](#glossary), with the other part being given to your VM

If you are already familiar with SSH, have a working shell or client, then you can skip straight to your preferred version of 'connecting'.

## Options to connect over SSH

- Linux and Mac have an SSH client built in. [Proceed to Generating a keypair in Linux/Mac](#using-linux-or-mac).
- Windows sometimes comes with ssh. To check, you open Powershell (WIN+X, A, click `yes`) and type `ssh`. You will either get feedback stating:
  - you didn't supply required parameters. This means Powershell understands SSH, and you can proceed to treat it as a relatively normal [Linux shell](#using-wsl) for the commands that we use here. However, if commands result in unexpected behaviour, you should switch to one of the alternatives below.
  - ssh is unknown, meaning PowerShell does not understand SSH. you should then proceed to install one of the following:
    - [Windows Subsystem for Linux (WSL)](#getting-wsl) allows you to run Linux commands (including SSH) on your Windows system, by running an integrated [Linux shell](#using-wsl).
    - [Git for windows](#getting-git-bash) allows you to run git commands, through a [bash shell](#using-git-bash). There is even a portable version that does not require admin rights.
    - If already have another preferred way, such as Putty, you are free to use it, assuming it does not create issues during the training. _(note, however, that the format in which PuttyGen stores the keys is __not__ standard; you will need to copy the generated key in a new text file)_

WSL has our preference, with Git for Windows acting as a backup-option. Guides for both options have been included.

## Getting WSL

1. Open PowerShell (WIN+X, A), and run the following command:

```powershell
Enable-WindowsOptionalFeature -Online -Featurename Microsoft-Windows-Subsystem-Linux
```

Note: this simple command tells Windows to go and collect the Windows Subsystem for Linux, without you needing to go through all the menu's and clickyboxes.

2. Reboot when prompted.
3. After rebooting, open the Windows Store, and search for `Ubuntu`.
4. Click `install` or `download`, and wait for it to complete.
5. When it's done, there should be an icon for Ubuntu. Click it, set (and remember!) your password.

## Using WSL

After you've mailed your public key to the trainer, you will receive the IP of your [VM](#glossary). So:

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

## Using Git Bash

After you've mailed your public key to the trainer, you will receive the IP of your [VM](#glossary). So:

- Your `ssh key` is in `.ssh`, and is called `id_iot`.
- The IP you got is 52.59.203.96.
You will then navigate to the folder where your private key exists, and run:

```bash
ssh -i id_iot ubuntu@52.59.203.96
```

Where the -i flag stands for `identity`, and `ubuntu` is the default username.

## Using Linux or Mac

The instructions for Linux and Mac are the same as those under [Using WSL](#usewsl)

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
- A keypair authenticates you as a user. These files should start with `id_` followed by your name (`id_jan`), and consists of two parts:
  - A private key. You do _NOT_ share this
  - A public key, which you can share. This file tends to end in `.pub`. In our training, the public key is placed inside your VM
