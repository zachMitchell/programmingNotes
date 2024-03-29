Godot is a gaming engine that has several cool features inside of it! Not sure if I will like it yet, but so far things look really promising.

## Installation

On linux I'm using the .NET runtime to add c# functionality. You need the mono verison which is not bundled on steam, so a manual installation of godot is needed.

Despite being called the "mono" build (using an open-source variant of c#), I kept getting errors of it saing "msbuild" wasn't visible. After uninstalling mono itself, using the dotnet command from microsoft was working just fine after going to `editor settings -> Mono -> Builds` and setting Build tool to "dotnet CLI"

Another note: on linux the latest stable build of .NET is bugged for Ubuntu 21.04, so switching to the `edge` release was what I decided to work with. I'm guessing that won't be a big impact though.

**UPDATE** that msbuild error was because it was a package exclusively in the mono deb repository. When originally attempting this, I couldn't install the repository for some reason, but it looks like it successfully updated everything today. *Mono is now my default c# compiler* There isn't a need for the dotnetcore package anymore. I heard nuget works here as well, so we should be good! Debugging works 100% as well.

It looks like I can compile for every major OS! (Windows/macos/linux on one machine!)

### Manual installation

Pretty straightforward - I placed godot in my userspace folder (`/home/zachary/Documents/installs/godot`) and went to `~/.profile` to set up my `$PATH` to point to the godot executable.

### VSCode

I have one-half of the tools on linux:
* [godot-tools](https://marketplace.visualstudio.com/items?itemName=geequlim.godot-tools)
    * The debug console doesn't fully work (not possible to edit variables on the spot), but in place of that the developers of the extension created an *interactions* section where you view nodes and change the values thorugh a different prompt. Global variables are also able to be watched in real time.
* [c# tools for godot](https://marketplace.visualstudio.com/items?itemName=neikeq.godot-csharp-vscode) is installed, ~~but is not working, at least with .NET~~
    * Got this to finally work, it was a problem I had with omnisharp. Microsoft explains this well: https://docs.microsoft.com/en-us/dotnet/core/install/linux-snap#troubles-resolving-dotnet
    * In a nutshell, you need to set an environment variable for the snap version of dotnet. `MSBuildSDKsPath` was set in my `~/.profile` file, plus `DOTNET_ROOT`, which helps change the default location for dotnet. (in my case `/snap/dotnet-sdk/current`). `MSBuildSDKsPath` was set to `$DOTNET_ROOT/sdk/$(dotnet --version)/Sdks` for omnisharp. ([source](https://gitanswer.com/ubuntu-the-sdk-microsoft-net-sdk-specified-could-not-be-found-typescript-omnisharp-vscode-403590789))
    * Microsoft also mentioned in the link above adding a symbolic link for applications looking for common locations that dotnet would reside in.
* All of the c# hurdles were mostly because I installed this through a snap. Package managers might have better luck over snaps, so the steps above are probably not requried for a normal installation.
* **Probably shouldn't follow those steps anymore on linux, mono is the compiler I'm using from here-on out**

## Random links I want to remember

* Being able to talk between c# and GDScript is a really awesome feature: https://docs.godotengine.org/en/stable/getting_started/scripting/cross_language_scripting.html

## Code stuff

Setting up a listener in C#

```c#
myNodeHere.Connect("my_listener_with_underscores", objectThisAppliesTo, nameof(_aMethodThatRunsWhenTheListenerHappens))
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
* apparently GDScript has no exception handling :/

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

## Inputs

* `InputEvent`s are something I'm looking into, ~~it seems like godot's api doesn't really have direct methods of grabbing the input of a key like JS does~~ (or at least on the surface), but it can tell you what keycode something is depending on the keyboard
    * I lied! [InputEventKey](https://docs.godotengine.org/en/stable/classes/class_inputeventkey.htm) and [KeyList](https://docs.godotengine.org/en/stable/classes/class_%40globalscope.html#enum-globalscope-keylist) would probably help if they were combined together
* Godot globals: https://docs.godotengine.org/en/stable/classes/class_%40globalscope.html#enum-globalscope-keylist
    * I need to learn how to use enums better in C# https://docs.microsoft.com/en-us/dotnet/api/system.enum?view=net-6.0#methods
* 