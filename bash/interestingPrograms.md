# Interesting Linux Commands

## ps
This command lets you look at all sorts of process information
### Flags
* **-C** what command are you looking for?
* **-o** what do you want outputted?{
* **pid** the process id
* **h** hide the tags that go with each output
    
## xev
This lets you read any input event from your keyboard or mouse! to use it, open it through a terminal.

## amixer
This can help alter audio settings [usage](https://askubuntu.com/questions/97936/terminal-command-to-set-audio-volume)

* -D set your device ("pulse" for pulse audio)
  * sset change the settings for the device

### examples: 
```bash
amixer -D pulse set Master 5%+ #adds five percent of volume.
#not adding + or - sets the volume to that specific percentage  
amixer -D pulse set Master [mute/unmute] #mutes and unmutes
```
* `set <device> 100%` Can change the device volume an exact percentage (where 100% is loudest)
## env
displays all environment variables

## paplay
an audio player launched from the terminal. This is built in to ubuntu.

## Uuencode/Uudecode
These commands allow you to convert any file in plain text! They come from the package: **[sharutils](https://www.gnu.org/software/sharutils/manual/)** *(Shell archive utilities1)*

`uuencode -m fileToConvert fileName` will convert your file to plain text. fileName will be the name of the file when it get's decoded.

`uudecode plainTextFile.txt` brings your file back to it's original state.
### Resources:
[Link to Mozilla developer documentation](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URIs)

[Wikipedia](https://en.wikipedia.org/wiki/Uuencoding)

## whereis / which

* **which** -  which version of the program is being used by the terminal.
* **whereis** - how many different variations of the program your looking for are there, and where are they located?

## update-alternatives
Change the default programs in your linux machine. (Debian based linux only)

## lpadmin (Cups administration)
Cups is the printing server for MacOs and Linux. I keep forgetting the commands to operate it so here's some snippets and docs to go with them:

* lpadmin [Cups manual (local machine only)](http://localhost:631/help/sharing.html?QUERY=remote%20printer#BASICS)
* lpr (`man lpr`)

For other cups commands, see: `man cups`


## /etc/fstab

Not a command, but a good place to look in order to manually mount a drive. There's even a man page for it.

## fdisk

I keep forgetting the name of this, so this section is here XP

`fdisk -l` - lists your disks regardless if they're mounted or not.

## dd & pv

`dd` & `pv` are must-knows - they are used frequently to clone information, whether that be a disk image to a usb, or a drive to another drive. `pv` specifically views how much data has gone in & out of it, while dd does most of the heavy lifting

## update-rc.d

A debian/ubuntu command that manages a service at startup. When searching for this command I wanted to disable world community grid in order to fire it up at will

The example from stackexchange -> duckduckgo XP
`sudo update-rc.d -f apache2 remove`
I used `disable` instead of remove 

## chntpw

[This program](https://opensource.com/article/18/3/how-reset-windows-password-linux) can help you reset a password in windows (not a hacker I swear XD)

If memory serves me well I used this once to help unlock my father's pc because he didn't remember the password. So it has it's valid use cases

## ip - set a static ip address

I KEEP FORGETTING HOW TO DO THIS SO I'M WRITING IT HERE

If for some reason I want a jank minecraft LAN party or am to lazy to use a router on two machines:

```bash
ip addr add 192.168.0.1/24 <ethernet-device>
```

[(How to geek)](https://www.howtogeek.com/839969/how-to-set-a-static-ip-address-in-ubuntu/)
[ip-address](https://man.archlinux.org/man/ip-address.8)
