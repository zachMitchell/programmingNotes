Ps: This command lets you look at all sorts of process information
  
  Flags{
    "-C" what command are you looking for?
    "-o" what do you want outputted?{
      "pid" the process id
      }
    "h" hide the tags that go with each output
    }
    
  xev: This lets you read any input event from your keyboard or mouse! to use it, open it through a terminal.
  
  amixer: This can help alter audio settings; usage: https://askubuntu.com/questions/97936/terminal-command-to-set-audio-volume
  {
   "-D" set your device ("pulse" for pulse audio)
    {
    "sset" change the settings for the device
    }
    examples: 
    amixer -D pulse sset Master 5%+ #adds five percent of volume.
  #not adding + or - sets the volume to that specific percentage
    
    amixer -D pulse sset Master [mute/unmute] #mutes and unmutes
  }
  
  env: displays all environment variables