# React

I'm back learning react again after 2 years of hiatus; this time the team is using this as part of a transition to a new infastructure where everything is a component. This file will be designated to information I didn't collect two years ago, as well as literally everything else.

starting to read over here: https://reactjs.org/docs/create-a-new-react-app.html

This also has a very "thinking out loud" narration :P

# Main Concepts

* To make a react-app there's a dedicated npm command called `npx` which grabs everything needed from npm and names your project.
* Start the app by running `npm start`, probably looks at package.json

## Introducing JSX

* One thing I'm noticing that I didn't a while back is the usage of typescript. That's fascinating...
    * Oh wait that's just syntactic sugar
* I'm seeing two main variables if you decide to place in a jsx object into console.log:
    * props: this is a value if there's only one child, and an array if multiple children. Can contain strings or more jsx objects. If you try to insert a value into props programatically, (e.g `<span>hey there {myVariable}</span>`), "hey there" and `myVariable` will be two strings contained in an array.
    * type: tagname
* Oh cool! You can place raw javaScript into curly brackets and it will work!
    * I made this thingy and it worked: `<span>oi um {(()=>"heyo"+(1+1))()}</span>`

* Re-learned something from old notes: props also graduates to an object if you have attributes set to a tag. so then the object becomes something like:
```js
{
    children:["Hi this is my message body"],
    attributeKey: "attributeValue"
}
```

* any empty tag can be closed as if it were an image tag (e.g <p/> is one tag)
* ooh; `React.createElement()` is pretty cool.

## Rendering Elements

* whenever one wants to render, the reactDom will see what's different, if anything is, only update that aspect. This is making me think that html elements aren't directly tied to react then.
    * I think my suspicions were true, components can be made out of base dom elements which act sortof like primitives.

## Components

* In addition to class-based definitions for components, you can also just use functions :)
* The react team *really* doesn't want you to modify the components in props, going as far as to call that an *impure* practice
* Just so my brain thinks about this right, props as a component argument also contains `children` so you can see the deep abyss of react elements that can be explored.
* I tried using `children` as a component argument - `<Thing children="hi">` - and it was ignored.
* There's one more argument after props that returns an object but I'm not sure what it is yet.

## State and lifecycle

* Ok interesting, props values can be more than just strings, powerful!
* Currently deep-diving into prototyping; it relates to "class extension", which I'm trying to catch up on: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain
    * Mostly was trying to undestand what was going on here from a fundamnetal level: https://reactjs.org/docs/state-and-lifecycle.html#converting-a-function-to-a-class
    * The only thing I don't understand is how calling a super constructor correlates to non-syntactic sugar with regular function definitions...
    * This could potentially be achived without prototyping by just returning React.Component and just adding onto the new object...
    * otherwise the class system is cleaner, I think that's where I got lost along time ago, not knowing how the syntacic sugar worked.
* the react doc encourages adding your own values to the component; that makes sense because you are doing that already just by extending `React.Component`
* Speaking of which, `React.Component` has it's own built-in function: `setState` to handle a manually entered value: `this.state`. Based on the syntax of the tutorial, you can set `this.state` to anything besides objects, but it looks like the convenient way if it's a primitive. ~~You could probably get around from using this just by having an object linked somewhere else.~~
* two user-defined functions are available: `componentDidMount` and `componentWillUnmount` - this lets you do work before inserting a new component. In the example they're setting an async interval, you can quit this with `componentWillUnmount` for example so js doesn't do unnessary work (or just flat-out crash).
* I guess the key takeaway though is `this.setState`, which saves on rendering when you have values to change and other items in the react dom. (ok yeah the docs discourage changing the state manually, but it's ok in the constructor)
* Oh neat! because setting states can be async, you can send in a function instead of a direct object that can contain certain items that you might need.
* react doesn't just do variable assignment for this.state, rather it probably does a key-value assignment and then does work to sync the dom.

## Handling Events

* `addEventListener` appears to not be required, they instead encourage to define listeners the old-fashioned way: within tags.
* if you are using class syntax, you will need to insert handleClick inside the constructor if you intend on looking at values within the component.

# Hooks

## Hooks at a glance

* There's an item called `useEffect`; by running this inside a component, you tell it this is something to run for every render.
    * useEffect takes one argument: a function which runs upon render. You can also return another function within that one in the event the component is unmounted. This is pretty cool because you can return something different depending on what criteria is happening.
    * The docs don't want you to call hooks in a function, rather it should be in the component definition, and on the top of that scope. (function based, not class based)
* Because you can use multiples of these, it can provide some dynamic abilities from external resources.
* `useState` from what I gather seems to initialize variables for the effects
* Took this out of the tutorial because you will need to import useEffect and useState in order to use hooks: `import React, { useState, useEffect } from 'react';`
* From what I'm gathering, states and effects are separate from the concept of hooks themselves

## Using the state hook

* There's further emphasis in the docs that **hooks can't be used in classes**
* They are advertised as a good way to have states in a function component in the event you need additional functionality.
* the tutorial does something interesting where it uses destructuring syntax to handle an array of items in order to set state variables.
    * first index is the value, the second is a setter function.
* so if you are using a function, you don't call `this.myValue`, rather it's called directly.


## Using the effect hook

* whatever is going on in the component scope, it has access to `document`'s scope.
* Allot of what I understood from useEffect was covered here, so I'm moving on to the next section

## Rules of hooks

* There was further emphasis on the fact that hooks, such as `useEffect` and `useState` shouldn't be called in regular functions, but within component definitions and custom hooks.

## Building your own hooks

* custom hooks should always be named with `use` at the beginning. `useBicycle`
* custom hooks themselves are function-based, but the scope if what I'm reading correctly lives within the component it runs in. So variables will be different depending on where it's called.