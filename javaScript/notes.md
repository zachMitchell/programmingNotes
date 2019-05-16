# JavaScript Notes
*My original (and really large) copy of javascript notes were sadly destroyed while moving everything to Github, so this file aim's to start a-new with things that I thought were really awesome to take note of*

**EDIT** I'm probably going to link to *developer.mozilla.org* quite a bit, as they are a great reference.

* Somehow I managed to never know this until now: **javascript arrays are referenced by default, not copied.** No idea how this passed considering this is my best language, but it's here now XP
    * The reason is that Arrays are defined as a type of Object, and Objects are also referenced by default. To solve this, there's a function called `yourArrayHere.slice()`
    * *See [Here](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice) For the full shebang...*
* without the "var" keyword, javascript assumes the variable is global.
```js
//This is designed to get a specific portion of an array, but return the entire thing by default:
//Values are copied by default so this works :P
var myArray=[1,2,3,4];
var myNewArray = myArray.slice(); //Copies the whole thing.
var myOtherArray = myArray.slice(2); //Gets 3 and 4.
```

* You can define getters and setters for values within objects! They're not just ordinary functions though; they interfere with the assignment syntax (`=`), so you can do things whenever a value attemps to be set!

```js
//Getters need to be within objects:
myObj = {
    theRealValue:false,
    set myVarName(e){
        console.log("hi!");
        this.theRealValue=e;
    },
    get myVarName(){return this.theRealValue}
}

myObj.myVarName = true
```

* You can play with gamepads in the web browser: (dev.Mozilla)[https://developer.mozilla.org/en-US/docs/API/Gamepad/Using_Gamepad_API]

* `Object.defineProperty()` lets you set some rules about values within objects; it can help you make some variables read-only. (dev.Mozilla)[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty]

* **Generator functions** Are really interesting! They're like regular functions, but you can come back to them for more :O (dev.Mozilla)[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function*]