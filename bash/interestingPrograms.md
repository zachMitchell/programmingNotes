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
