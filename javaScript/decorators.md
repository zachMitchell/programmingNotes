# javaScript Decorators

Of all the things I've learned in JS, I probably have waited the longest to learn this one, since it's not even a standard yet. The SF Dev 1 Certification requires that I learn it though, so here we go...

[javaScript Decorators](https://www.sitepoint.com/javascript-decorators-what-they-are/) are part of a stage 2 proposal for the language. Some companies, like salesforce have jumped the gun and started using them early in their products, mostly by compiling it instead of it being a native part of the language itself.

Decorators themselves are a way to take in a function, make modifications to either its process or return value, and come back with a new value or desired result.

The article used above is one that probably comes up a lot for sites like developer.mozilla & salesforce, so it will be the main resource.

It looks like typescript has support for this while it's still in stage 2 of the proposal: https://www.typescriptlang.org/docs/handbook/decorators.html

## This is the part where I start writing down random thoughts!

### The tangent on `Object.defineProperty()`

* Don't think I've seen this before: [Object.defineProperty](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty)
    * It seems to be another way to define objects, also giving it the ability to have read-only values... like `const`!
    * Holy cow - you can do getters & setters with this! Wish I knew this sooner, that's awesome!

```js
var a = {};
Object.defineProperty(a, 'stuff', {get:()=>1234});
```

* Wow, lot's of good stuff here, you can even set the variable to being enumerable or not. In other words, is it visible when using Object.keys() or not (or for-in). The default for this is `false`.
* Values through this are also read-only by default, you will have to set `configurable` to `true`

### Going back to the article

* Ok that syntax is weird - you can use this syntax `function(...paramName)` to essentially make `paramName` the name of arguments.
    * ...wait a second does that work with arrow functions?
    * It does!!! That's pretty awesome. Playing with JS also shows me a more practical use of this, you have a few normal parameters prior to this, and then proceed to use the `...` syntax to represent an array `function(a,s,d,...f){}`
* So it sounds to me like decorators are more of a syntactical concept. You can build decorators and call them using functions themselves if need be, but they can be used to figure out the outcome of both variables and functions, since a decorator in itself is a function.

## [Another article!](https://saul-mirone.github.io/a-complete-guide-to-typescript-decorator/)

This one was linked in the microsoft docs. It seems like, at least in the typeScript land that decorators are exclusive to class-based functionality.

Also the three pieces from the proposal: `target`, `name` and `descriptor` are not present and just simply have a reference to the orignal value.

* Looks like ine TS, you need to define properties of a class before handling them in a constructor.
* Class constructors allow you to change the prototype/function of what you're trying to alter.
* yet another article: https://www.digitalocean.com/community/tutorials/how-to-use-decorators-in-typescript

## Going to try to use typescript's original docs

* They say the way you would compile decorators is through this command: `tsc --target ES5 --experimentalDecorators`. For some reason method decorators seem to compile with this.
    * update here; it doesn't need `--target ES5`
    * interestingly, you need --target ES5 when you make use of a method decorator.
* Ok... the example is showing up correctly in the property decorator example... what am I doing that it's not?
    * Ok now it's having issues with current TS.
    * ~~Strange, it's getting the same errors as I have been getting. "Unable to resolve signature of property decorator when called as an expression"~~ nevermind, I didn't save XP
    * It compiled and ran! Also needed to get rid of `Symbol`, due to compilation errors.
* ...what's a symbol? This is a type I haven't heard of yet
    * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol it looks like it's used to provide unique keys for containers like maps.

## An explanation of the above fuzzy discovery

* Decorators are a method of altering a class to do something else based on outside credentials. Based on the usage of lightning web components, it is a technique that works well with inheritance, since you are altering existing structures for someone else to use.
* decorators only run once, during the class definition. They have two parts to them: a base function, which contains custom parameters, and then a function that essentially takes place of `Object.defineProperty`, containing the parameters of `target`, `name` and `descriptor`
    * Since it takes in `Object.defineProperty` values, you can do just as many things as you would with defineProperty by itself. One fascinating use is the getter/setter syntax, where you can re-define them in a decorator through `descriptor.get` and `descriptor.set`. You cn also make it so that you can't find it's key normally.
* Class decorators don't seem to need those base function parameters, nor do they need to have the syntax for executing a function. Method & property decorators seem to need it though.
* property decorators are strange, but they make sense. You can't alter the value of a property using this type, but you at least have the key of the property, plus params from the base function & the origin of the property.
* Theoretically, I'd say primitive values or generic variables *could* in theory use decorators, in fact since they are functions, it would not be difficult at all to implement. That is a limitation of typescript though, and not the abilities of the language itself in terms of capability.
* Oh yeah, one more imporatnt detail, you can stack decorators on top of eachother!
* The returning function doesn't have to be static either. It can be based completely off of logic running in the function beforehand. This ultimately provides some very interesting dynamics.