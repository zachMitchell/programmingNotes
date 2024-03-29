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

* You can play with gamepads in the web browser: [dev.Mozilla](https://developer.mozilla.org/en-US/docs/API/Gamepad/Using_Gamepad_API)

* `Object.defineProperty()` lets you set some rules about values within objects; it can help you make some variables read-only. [dev.Mozilla](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty)

* **Generator functions** Are really interesting! They're like regular functions, but you can come back to them for more :O [dev.Mozilla](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function)

* **Mutation Observers** - These rock! They let you keep tabs on everything that's happening in your DOM element, it could potentially help make your own html tags that respond to tiny changes :D [(Mozilla doc)](https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver)

* **Web components** - kindof what I described above, but it appears to be a different standard: [youtube](https://www.youtube.com/watch?v=YBwgkr_Sbx0)

## Speech synthesis
[link](https://developer.mozilla.org/en-US/docs/Web/API/Window/speechSynthesis)

Just learned about speech synthasis today! It appears to be a feature used in modern web-browsers. It may or may not be used in the future.

### Syntax:

Almost everything is done through the `[window].speechSynthesis` object. You can grab a list of voices through `speechSyntesis.getVoices()`. This stores the name and language (`lang`) values for each voice.

Text that is read from the TTS program is known as an utterance. Create a new utternace by using `new SpeechSynthesisUtterance([string])`. Set the voice through `[utterance].voice` You can then make the TTS speak through: `speechSynthesis.speak([utterance])`.

## The many ways to define parameters

I realized tehre was never a place that I just listed all the ways you can just define parameters. After learning yet another one, it's probably a good time to do that

### `arguments`

Technically a method for defining parameters because you are getting the raw values in an *array-like* format (not an actual array, but it's iterable).

```js
function(){
    for(let i of arguments) console.log(i);
}
```

`arguments` doesn't exist in arrow functions.

### Object destructuring

Take in an object, and based off of the names of the values, make those the expected items you wish to recieve

```js

function amazingThing(myCoolValue = 1, {val1, val2}, {yes} = {yes:1234} ){
    console.log(myCoolValue, val1, val2, yes);
}

amazingThing(2, {val1: 'sandwich', val2: 'chips', nothingToSeeHere: null}); //2, sandwich, chips, 1234
```

### Array destructuring

Take in an array, based on the indexes of the array, turn those into names that can be used in the function

```js
var adder = ([a,s,d,f])=>a + s + d + f;

adder([1,2,3,4]); //10
```

### Iterator syntax

Take in the rest of the parameters as an array

```js
(param1, ...paramEverythingElse)=>console.log(param1, paramEverythingElse);
```