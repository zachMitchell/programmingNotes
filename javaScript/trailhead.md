# Trailhead notes

These are notes I'm taking from Salesforce as part of the Salesforce JavaScript Certification

* You can create objects via `Object.create()`
* One thing I keep forgetting is that you don't need to have a function defined before actually calling it. (As long as you do it sometime in the future.)
    * Ok, that's something I didn't know about: this applies to `function` statements. If you try to use a function as a variable instead, you need to define the function in advance instead of having it just anywhere in the code.
* array.prototype.map: create a new array, and for each item in the array use a function that modifies values one by one.
* decorators: https://www.sitepoint.com/javascript-decorators-what-they-are/
* certaintly feels like I'm learning more about `let` to this day. If you use `var` within a function, variables are scoped to the function. `let` does a definition on a block level.
* `this` appears to be defined as a pointer...
* since the lesson mentioned `const`; I'll put this here: with `const`, if you're trying to place it in the global scope on a page (`window.something`); it won't enter `window` itself, unlike `var` and `let`
* Ok yikes, I had no idea this was happening... `var` ignores the scope on blocks that aren't functions. So items from for-loops, if, and while statements can be leaked (or intentionally used afterwards).
    * This actually happened in some code I wrote now that I think of it. `let` will be the answer to this problem.
* Depending on where you put your function, the scope will change if you're using `this`
    * (https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call)
* A closure is when a variable is stored in a nested function from the scope of it's parent.
* `alert`is a weird outlier in js where it blocks absolutely everything in every thread.
* The lesson points out that setTimeout is not precise. Since your timeout is in a queue with other async things, it won't always bring the same result every time. It probably explains why my wheel, living on timeouts, doesn't have a perfect "door knock" when it's doing the animation.
* ~Ok, I need to learn this guy: https://developer.mozilla.org/en-US/docs/Glossary/Callback_function~
    * oh nevermind... I thought it was a javascript feature XP; it's just a function from an argument being run after another function is done.
* Promises are not scary - https://trailhead.salesforce.com/content/learn/modules/javascript-essentials-salesforce-developers/async-js
* Wow, I didn't know you could do this:

```js
//It looks like some kind of object-destructuring, but slightly different
let thing1 = 1, thing2 = 2;
console.log({thing1, thing2});

//returns an object with those property names:
/*
{
    thing1: 1,
    thing2: 2
}
*/
```

* This works with functions too! `thing = function({asdf}){console.log(asdf)}` can be called like this - `thing({asdf:1234})` and work correctly!
* More object descructuring! `let [,,hi] = [1,2,3]; //hi becomes 3`
* There's something called the "lexical scope" in regular objects. For some reason a standard [*nested*]function will not see `this` because it sees `this` from the global scope. arrow functions remedy this, which is weird because they see the scope from whatever encloses it... oh wait.
    * it says "because the javascript interpreter thinks it's an unsuplied function argument"...?
    *  OK, that got confusing, I didn't put down "nested" functions yet until now. If you have a normal function in a normal object it's good, but nesteing another function within that causes the context to change (probably because that's object definition syntax). using `self` in the salesforce example was a way to put `this` in a nested function. Arrow functions fix this context because they don't have a `this` context.
* `arguments` was introduced in ES5.
* In ES6, they introduced something called "reset parameters", which means you can provide more arguments that don't have a full name. It's usefull because you don't have to remember & hardcode indexes! `function(thing1, thing2, ...everythingElse){console.log(everythingElse[1])}`
* The appending syntax for arrays and function parameters (`...`) is called "spread syntax"
* promises can grab just about any rejection in a chain through the `catch` function.

## Modules

* It appears that modules can be loaded in the web browser now!
* mozilla does a good job describing this: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules
* asynchronous loading can also be done: `await import('myFile.js')`
* There's an item in here I haven't seen before - `export item from './asdf.js'`. It's a clear path for the next module to see the contents of the previous module. The module making this call cannot see this variable either, just the one importing this module.
## Object syntactic sugar

And here we witness a moment where javascript pretends to be object oriented:
```js
class hotdog {
    constructor(argA,argB){
        this.thing = argA;
        this.kaboom = argB;
    }

    aNiceFunction(){
        console.log("asdf " + this.thing);
    }

    //There's a new keyword in ES6 - "static"
    static newFunc(){
        console.log(this.kaboom);
    }

    //GETTERS AND SETTERS! Just like generic objects. This is extremely powerful
    get thing(){
        return this.thing;
    }

    set thing(arg){
        this.thing+=arg;
    }
}

//I was admitedly ignorant that the new class syntax actually did anytning, but whoah, it can do a lot.

//extends syntax also works here just like standard object oriented languages
class sandwich extends hotdog{
    constructor(){
        super(1,2);
        this.bun = 'delicious';
    }
}

new sandwich().thing = 6;
//I think without this syntax you would have to do some serious prototyping gymnastics: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes/extends
```

## Salesforce lightning

* whoah, lightning web components are weird...

## Exam details

* The exam isn't the only thing required to get certified. There is a lightning components superbadge, which is probably the salesforce side of this equation.
* 