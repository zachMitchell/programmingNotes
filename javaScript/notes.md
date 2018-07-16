# JavaScript Notes
*My original (and really large) copy of javascript notes were sadly destroyed while moving everything to Github, so this file aim's to start a-new with things that I thought were really awesome to take note of*

* Somehow I managed to never know this until now: **javascript arrays are referenced by default, not copied.** No idea how this passed considering this is my best language, but it's here now XP
    * The reason is that Arrays are defined as a type of Object, and Objects are also referenced by default. To solve this, there's a function called `yourArrayHere.slice()`
    * *See [Here](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice) For the full shebang...*
```js
//This is designed to get a specific portion of an array, but return the entire thing by default:
//Values are copied by default so this works :P
var myArray=[1,2,3,4];
var myNewArray = myArray.slice(); //Copies the whole thing.
var myOtherArray = myArray.slice(2); //Gets 3 and 4.
```