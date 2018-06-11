C# Objects
==========
A table from OneNote turned into something nice :)

## MessageBox
One of those interesting boxes that gives you information
### Usage:
```cs
//The message box can have a single string inside it:
MessageBox.show("hi :)");

//but it can also have icons, as well as built in button configurations:
MessageBox.show(<message>,<boxTitle>,MessageBoxButtons.<buttonType>,MessageBoxIcon.<iconType>)

//for MessageBoxIcon and iconType, the types available are shown within the IDE as the objects are typed in.
```
## DialogResult
These can be received when clicking a pre-selected button in a MessageBox. When received, they are treated as any other object, so they can be handled as needed
### Usage:
```cs
//When the user responds to the dialog box, the dialog box will return the response to this object:

DialogResult fred = MessageBox.Show("Do you like waffles?","VERY IMPORTANT LIFE QUESTION", MessageBoxButtons.YesNoCancel,MessageBoxIcon.Question);

If(fred == DialogResult.Yes){
MessageBox.show("NO WAY!!! I LIKE THEM TOOOOO!","whoaaaah",MessageBoxButtons.OK,MessageBoxIcon.Exclamation);
}
```
## StringBuilder
A dynamic string! Extra memory is only used when the string scales up
### Usage:
```cs
StringBuilder thingy = new StringBuilder(5) //where 5 is the amount of initial characters.

Thingy.Insert(<int>,<string>) //Insert something within that space.
```
## File
A predefined object; use this to manage your files!
## StreamReader
This lets you look at the contents of the specified file
### Usage:
```cs
//To use this, include this in the program.cs header!
using System.IO;

StreamReader name = File.OpenText(".path/to/file");

//Grabbing a line of text:
String hi = name.ReadLine();

//checking end of file status:
Boolean yo = name.EndOfStream();
```
## List<T>
This functions similar to ArrayList<T> (from java), where you have a specialized array [like-thingy] that expands as you add content!