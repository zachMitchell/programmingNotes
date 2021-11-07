Godot is a gaming engine that has several cool features inside of it! Not sure if I will like it yet, but so far things look really promising.

## Installation

On linux I'm using the .NET runtime to add c# functionality. You need the mono verison which is not bundled on steam, so a manual installation of godot is needed.

Despite being called the "mono" build (using an open-source variant of c#), I kept getting errors of it saing "msbuild" wasn't visible. After uninstalling mono itself, using the dotnet command from microsoft was working just fine after going to `editor settings -> Mono -> Builds` and setting Build tool to "dotnet CLI"

Another note: on linux the latest stable build of .NET is bugged for Ubuntu 21.04, so switching to the `edge` release was what I decided to work with. I'm guessing that won't be a big impact though.

It looks like I can compile for every major OS! (Windows/macos/linux on one machine!)

### Manual installation

Pretty straightforward - I placed godot in my userspace folder (`/home/zachary/Documents/installs/godot`) and went to `~/.profile` to set up my `$PATH` to point to the godot executable.

### VSCode

...I'm not sure yet XP

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