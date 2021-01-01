# Trailhead notes

These are notes I'm taking from Salesforce as part of the Salesforce JavaScript Certification

* You can create objects via `Object.create()`
* One thing I keep forgetting is that you don't need to have a function defined before actually calling it. (As long as you do it sometime in the future.)
    * Ok, that's something I didn't know about: this applies to `function` statements. If you try to use a function as a variable instead, you need to define the function in advance instead of having it just anywhere in the code.
* array.prototype.map: create a new array, and for each item in the array use a function that modifies values one by one.
* decorators: https://www.sitepoint.com/javascript-decorators-what-they-are/
* certaintly feels like I'm learning more about `let` to this day. If you use `var` within a function, variables are scoped to the function. `let` does a definition on a block level.

## Object syntactic sugar

And here we witness a moment where javascript pretends to be object oriented:
```js
class hotdog {
    constructor(argA,argB){
        this.thing = argA;
        this.kaboom = argB;
    }

    aNiceFunction(){
        console.log("asdf");
    }
}
```