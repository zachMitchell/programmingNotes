Godot is a gaming engine that has several cool features inside of it! Not sure if I will like it yet, but so far things look really promising.

## Installation

On linux I'm using the .NET runtime to add c# functionality. You need the mono verison which is not bundled on steam, so a manual installation of godot is needed.

Despite being called the "mono" build (using an open-source variant of c#), I kept getting errors of it saing "msbuild" wasn't visible. After uninstalling mono itself, using the dotnet command from microsoft was working just fine after going to `editor settings -> Mono -> Builds` and setting Build tool to "dotnet CLI"

Another note: on linux the latest stable build of .NET is bugged for Ubuntu 21.04, so switching to the `edge` release was what I decided to work with. I'm guessing that won't be a big impact though.

It looks like I can compile for every major OS! (Windows/macos/linux on one machine!)

### Manual installation

Pretty straightforward - I placed godot in my userspace folder (`/home/zachary/Documents/installs/godot`) and went to `~/.profile` to set up my `$PATH` to point to the godot executable.

### VSCode

I have one-half of the tools on linux:
* [godot-tools](https://marketplace.visualstudio.com/items?itemName=geequlim.godot-tools)
    * The debug console doesn't fully work (not possible to edit variables on the spot), but in place of that the developers of the extension created an *interactions* section where you view nodes and change the values thorugh a different prompt. Global variables are also able to be watched in real time.
* [c# tools for godot](https://marketplace.visualstudio.com/items?itemName=neikeq.godot-csharp-vscode) is installed, but is not working, at least with .NET

## Random links I want to remember

* Being able to talk between c# and GDScript is a really awesome feature: https://docs.godotengine.org/en/stable/getting_started/scripting/cross_language_scripting.html

## Code stuff

Setting up a listener in C#

```c#
myNodeHere.Connect("my_listener_with_underscores", objectThisAppliesTo, nameOf(_aMethodThatRunsWhenTheListenerHappens))
```

* Setting up a method to run at every frame can be done by un-commenting `_Process` in either language. It has a parameter for delta time so you don't have to process every frame, but rather time elapsed in seconds...
* Interesting... with GDScript, you don't need to mention `self` in order to access it's respective properties
* Groups allow nodes to talk to eachother (https://docs.godotengine.org/en/stable/getting_started/step_by_step/scripting_continued.html/#groups)
    * Oh hey! you can get nodes associated in that group too
    * The groups themselves seem to be enclosed in the entire scene. The scene itself can be grabbed via `get_tree()`. You would then grab an entire group via `get_nodes_in_group()`
* Ok this is what I was looking for: (https://docs.godotengine.org/en/stable/getting_started/step_by_step/scripting_continued.html#creating-nodes) - that way I can programatically make a ton of enimies at once for example.
* In order to find the window size, godot supports looking at OS variables (e.g `OS.window_size`) (https://docs.godotengine.org/en/stable/classes/class_os.html#class-os-property-window-size)
* `Vector2` is an interesting object... by placing in two numbers you have something more powerfull than an array that can allow you to do many things with just two points in space.
* The `Node._input` method allows one to detect a variety of different things, such as a mouse click or a keypress on the keyboard. It's parameter is an [`InputEvent`](https://docs.godotengine.org/en/stable/classes/class_inputevent.html#class-inputevent)
    * [Tutorial](https://docs.godotengine.org/en/stable/tutorials/inputs/inputevent.html)
    * GDScript has a special operator for boolean statements (`is`). In the tutorial above, it uses that to determine the specific class type, which can help you determine what input type was received.
* `get_tree().quit()` apparently closes your app.
* So one thing I learned when cross-communicating between GDScript and C# is that getting GDScript variables will copy the value over to C# instead of grabbing it directly. That means you would need to use Get/Set to apply values back and forth.

## Physics!

* For objects to collide with eachother, you need a "body" that contains a collision shape (e.g CollisionShape2D)
* Several listeners for seeing if the object entered or exited an item require certain variables to be checked within the body, e.g: `contact_monitor` should be set to true and `contacts_reported` should be set to the amount of items you want to detect at once.

## Files

* In GDScript you would load a file through [this object](https://docs.godotengine.org/en/stable/classes/class_file.html)
    * [get_buffer](https://docs.godotengine.org/en/stable/classes/class_file.html#class-file-method-get-buffer) will help obtain the file in something called a `PoolByteArray`, which converts everything into bytes. Audio-wise this is important if you want sounds to be dynamic and want to load streams of audio from a list.
* I just learned today that if for some reason there are settings on your audio that aren't what you're wanting, there's a chance cached imports in the `.import` folder might be to blame. I deleted this and godot re-generated the correct settings.
    * This probably happened because I was doing a bunch of file re-organization. Worth doing this then if an event like this comes up.

## Audio

* [AudioStreamMP3](https://docs.godotengine.org/en/stable/classes/class_audiostreammp3.html) is used for audio, but you need an `AudioStreamPlayer2D` (or 3D) to actually play this audio.