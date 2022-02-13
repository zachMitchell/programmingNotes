* lightning web components are based on the W3C Standard - Web Components
* Web components in general are FREAKEN AWESOME. I put another link in accessibility, but here it is again: https://developer.salesforce.com/docs/component-library/overview/components
    * This website's url can also work on your salesforce org, and shows components you built yourself as well.
* Lightning web components are unique from regular web components in that all you need is a folder name with files on inside also having the same name. This appears to link everything together without you having to do anything.
* components will begin with c-your-name-here, but in your folder it will look like yourNameHere
* The class for lighting web components is `LightningElement`
* In the examples being shown, The basis of a lightning component is that you create a class that contains properties (extending LightningElement), then in the html, you use a `<template>` tag to insert the body of your component. variables from your class are called through `{thisSyntax}` (https://trailhead.salesforce.com/content/learn/modules/lightning-web-components-basics/create-lightning-web-components)
* conditional logic can be placed in an element within the `<template>` tag: `if:true={varname}` and `if:false={varname}`. This Logic appears to be updated in real time as variables are assigned in the class. In the bike example; an entire div element was removed before displaying the other element.
* `connectedCallback` seems to be a listener inherited from `LightningElement`, which activates when the page is loaded.
    * They later call this a "lifecycle hook"
    * Ok, so these are specifically for when the component is added, removed [disconnectedCallback] or if there are errors.
* you don't need the class name of your component to be the same as the file & folder names, but SF recommends it XP
*  If you are going async, context can still be kept through an arrow function as mentioned in the javascript lesson.
* Now they're talking about decorators... this should get interesting; I've never known how to use these. There isn't much documentation about it on developer.mozilla or w3schools (at least that I could find)
    * the syntax for using one is `@decoratorHere`
    * `@wire` is something I probably want to remember; it can be used to connect salesforce data to the component.

## Deploy Lightning web component files

* a `.js-meta.xml` is used to describe what this web component can do. Many settings are available like `isExposed`, which allows the component to be used outside your org.
    * `targets` can allow your web component to be more specific as to what pages it should be on.
    * Others are there too: https://developer.salesforce.com/docs/component-library/documentation/lwc/lwc.reference_configuration_tags
* *critical!* - Salesforce forgot to add this in the sample file in order for components to be deployable on SF: `<LightningComponentBundle xmlns="http://soap.sforce.com/2006/04/metadata" fqn="bikeCard">`, specifically the `fqn` property. Without this, sfdx will scream and not deploy your changes.


## Handling events

* components have the ability to send events up the grapevine. By creating a method
* For passing informaiton up from listeners:
    * in the js file of the component, I presume the name of the event function doesn't matter? Mostly because you can do logic before hand. In the exmple, it uses `nextHandler`
        * Ah, I see now; in order to call the event itself it needs a `dispatchEvent` function (`this.dispatchEvent(new CustomEvent('next'))`)
    * from here, `next` is the keyword that is appended to a component listening for that event (`<c-my-component onnext={myFunctionThatRespondsToTheThing}></c-my-component>`)
    * Finally in that component, you get the information passed down from the component that sent it.
* For passing information down:
    * javascript decorators can be used to define element properties. They are placed in the class constructor: `@api nameHere`
        * An element would use this syntax to accpet the property: `<c-my-component name-here='1234'></c-my-component>
    * Methods/functions can also be public inside a class constructor. @api can help with this too. When a element is queried, it get's the abiity to run this method via the queried element from the outside.
* 

# poking with my own code

Looking at the notes above looks like I was speeding through it. Down here I will just be taking my time and understanding all of this as I'm playing with it via my local machine.

* When this LWC code is deployed onto a server, it looks like there was some compilation happening. Generally I see syntax that is compatible with JS classes.
    * I even tried using a getter, and it appears to work when trying to use variables in app.html
* Looks like when a conditional is changed, any elements looking at a variable in real time are rendered. I'm guessing this means the elements themselves aren't attached to the logic, but there is logic being determined in the backround in order to render the element.
    * This means if you don't want elements to constantly be rendering, don't abuse the system
* For some reason I can't add an "onclick" listener directly on an html element... for some reason a style tag works thogh.
* object notation works if you have an object with the associated class
* it looks like a template can be nested in another, as long as there's logic attached to the nested template. This is called a **template expression**
    * The template tag itself doesn't seem to show up in the shadowDom, so it's probably a container of sorts to do things. For-loops seem like a good idea with this
* It looks like components are named based on the file structure that was created. Salesforce doesn't seem to differentiate between folder names and file names either.
    * `./myGlorious/path/to/theComponent` becomes `<my-glorious-path-to-the-component/>`
    * the component itself would need to be named `theComponent` at the very end of this pattern though, because that's the last folder that holds the actual structure.
    * when using components on salesforce, they need to have the `c-` extension to it instead of the root folder name.
* Big note - the event listeners that are dispatched from your child element, must be handled in the parent when defining the child. So when the child `<my-thing/>` has a listener `thingamajig`, the parent holding that element must place a handler inside for information to pass upwards (`<my-thing onthingamajig={parentsEventListener}>`) - the context will then move to the parent element.
    * off-topic, but one thing I just learned is something called "bubbles", if you create an event and it dispatches on a child, then if the parent has the event listener, it too will react to the event. It's usefull because the parent will know the child was the one that initiated the event.
    * https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent/CustomEvent 
* using the @api allows variables to be exposed in a component as if it were a built-in html value.
* the css for each component is in the scope of the component itself? so for example `body` would pertain to the component's body.
    * Ah - so if a component holds another, then the css applied to the parent also applies to the child. gotta think with a scoping mindset here.
* SF has it's own theming for salesforce stuff: Salesforce Lightning Design System.
* 


## Misc

* The lightning data service (lds) is the method of which LWC can obtain data from salesforce. It's a wire, which means you hook it up to salesforce itself in order to use this ability. I'd guess it's not baked into LWC itself if that's the case, but rather a thing you would connect to if you had the code hosted on salesforce.
* to use an apex method as a stateless method for lwc, you need `@AuraEnable(cacheable=true)
* stealing this snippet from the page because it's interesting; to communicate with apex, you can wire it like you would a salesforce soql query! `import queryAccounts from '@salesforce/apex/AccountListControllerLwc.queryAccounts';`
* If you want to see changes you made to lightning pages right away, you can disable caching: https://trailhead.salesforce.com/content/learn/modules/lwc-for-visualforce-developers/work-with-salesforce-data-in-lwc#disable-lightning-component-caching
    * They advise for this that you don't want to do that in a production instance because it takes a while to load stuff otherwise
* example wire `@wire(queryAccountsByRevenue({annualRevenue:"$annualRevenue"})) accounts;`
    * I wonder if this can be updated again after the initial definition
* There is another service called the "lightning navigation service" - which is similar to URLFOR in visualforce.
* You can cross communicate with visualforce and LWC: https://developer.salesforce.com/docs/component-library/documentation/lwc/use_visualforce