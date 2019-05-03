---
title: "Introduction to DSH"
revealOptions:
    transition: 'fade'
---
<!-- .slide: data-background="./images/kpn-intro-bg-md.jpg" -->
# This is a buffer-presentation, which contains old, but potentially useful, slides. [INTERNAL]

<!--s-->

# What is the DSH?
<!-- .slide: class="nobullets" -->
- Streaming Data Platform <!-- .element: class="fragment" data-fragment-index="1" -->
- Stream Processing Platform <!-- .element: class="fragment" data-fragment-index="2" -->
- Data Stream Platform <!-- .element: class="fragment" data-fragment-index="3" -->

<!--s-->
# Wrap-up

- DSH can process streams: 
    - but is not always the right place to do it
    - and does not dictate how to process them

<!--s-->


<!-- .center: -->
One source, low volume | many sources, high volume  <!-- .element: class="fragment" data-fragment-index="2" -->

Single sensor | Stream processing  <!-- .element: class="fragment" data-fragment-index="3" -->

MQTT | Kafka  <!-- .element: class="fragment" data-fragment-index="4" -->

<!-- [![asciicast](https://asciinema.org/a/242386.svg)](https://asciinema.org/a/242386) -->
<!-- <script id="asciicast-WXXC4cMVi73TxVpLS8aB02Ucr" src="https://asciinema.org/a/WXXC4cMVi73TxVpLS8aB02Ucr.js" async></script> -->
<!-- .slide: data-iframe='http://www.statdistributions.com'-->



![test](https://asciinema.org/a/242386.svg) <!-- .element: class="stretch" src="https://asciinema.org/a/242386.svg" width=25% -->

<!--v-->

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