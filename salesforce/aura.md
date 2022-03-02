(https://trailhead.salesforce.com/content/learn/modules/lex_dev_lc_basics)

* My-Domain helps you connect a sub-location to your main SF domain
* If I understand the subtle nods from this text, it sounds like aura is what helps insert lightning web components into Visualforce pages?
    * Actually I'm thinking not here, aura is a framework for lightning components, just like the LWC is a framework for lightning
    * it sounds like you *can* place lightning inside of a visualforce component
* using container pages is good if you want to use lightning web compoenents with other frameworks https://developer.salesforce.com/docs/atlas.en-us.224.0.pages.meta/pages/pages_html_container_page.htm
* **slds** - a collection of css that salesforce put together to style components
* Lightning apps created in salesforce can be placed on an external resource as well! LWC can also be used on it's own, but if you have salesforce data hevaily integrated in your system, it might be useful to export it. It's called "Lightning Out"
* aura certainly feels a lot like visualforce. You first create components though the .cmp extension, and then you can place those components inside an app (.app), with the tag `<aura:application>`
* This bundle thing is an interesting concept... the structure looks a lot like how lightning web components are put together.
* `{! }` is an expression!
* `<aura:attribute name="myName" description="1234567890" type="String">` you place this inside of a component to describe what values it can take.
    * calling an atribute within the component of origin requires `{!v.attrHere}`... not sure why it's v and not self/this 
    * Ah, it means "value provider"
    * So that `type` section can actually be any SObject! It's rather interesting because you can insert data directly from SF this way.
    * Oh, there's also a parameter with "required" as the title. Ommitting this means the attribute is not required
    * "description" is one too, describes the attribute itself... is that for code editing?
    * `{!v.expense.Reimbursed__c ? 'slds-theme_success' : ''}` - pasted this from the lesson, it looks like this has ternary logic?
* `<aura:iteration>` is like the for loop of aura components, it takes `items` (list) & `var`, the variable name.
* `<aura:if isTrue={!condition}>` - if statement
    * `<aura:set attribute="else">` - else statement
* Event listeners exist in aura that connect to JS. The javascript itself is located in dedicated files, so `componentName.js` - in a way it looks a lot like a module.exports

~~code for a listener looks like this:~~ waiiiiit a minute - that looks a whole lot like lighting events

```html
<lightning:button onclick="{!c.functionName}">
```

```js
({
    //they must have taken queues from aura to build LWC
    functionName(component, event, helper){
        console.log(arguments);
    }
})
```

* Now I have more questions - how do lightning components communicate this way with aura? If it has the `lightning` I've presumed it's a javascript based component, so how is it getting something within the aura scope?
    * I think I understand better now... aura is wrapping itself around LWC, and the listener is possible to see because we're in that scope and just placing the listener function inside a lightning web component
* So far I only know how to access html attributes through `event.getSource()` in a controller function. You obtain these values by using a `.get("v.attributeHere")` and they can be set through the same means.
* the component itself can be used to find the html of the document, though I'm not sure if they reall want you touching it all that much?
* Finally - the challenge material did not allow me to actually run the code I'm trying to write in order to debug it... that's frankly pretty annoying XP - in the *next unit* (Input Data using Forms), they go on to show a method of placing in a default value for SObject data, which was the key to helping me watch the code itself go. Basically, you place the SObject data in an attribute that looks close to json: `{'SObjectType:':'mySObjectNameHere', 'Property__c':'propertyValue'}`
    * I really didn't like that because I wanted to understand what was going on. For me to get any sort of grasp, I needed to use the reading material's example code and use a javascript debugger.
    * sobject attribute I used: `"{'sObjectType':'Camping_Item__c', 'Price__c':12.34, 'Quantity__c':2, 'Packed__c':false}"`
* Salesforce Lightning Design System (slds) helps to style lightning components; other than that I'm not sure yet what in entails
    * It sounds like it's included with LWC by default, but when using aura, it's not?
* I'm hearing this terminology in more than one location: a "harness" app. It sounds like something that helps you put everything together before constructing the main application.
    * in the case of this lesson, it's more of a "wrapper" application, where it adds slds to list of things it extends `<aura:application extends="force:slds">`. From here it sounds like SF wants to place the "app" itself inside of a compoenent.
* Haven't used javascript's reduce function before in an array: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce
* There's some weird behavior when it comes to aura IDs, they seem different then html IDs in that you can group multiple elements together that have the same ID without reprecussions. If you want to find components with the smae IDs, then you can run `component.find('theIdHere')`. The component itself will return a proxy which acts like an array (not html collection).
    * **Hey future you** - use component.find for aura IDs
* it appears salesforce likes the concept of helpers so much that there are helper files in JS 0_o
* If you have an array you're setting to an aura component, it works just like in js where you just need to reference the values being pushed. However, since you aren't actually changing the reference, aura won't know that anything happened, so you need to tell it yourself by doing `component.set(v.myArrayHere,myJsVariable)`
* `<aura:handler>` - helps with running some javascript upon creating the component.
* It doesn't mention this anywhere else besides trailhead, but lighting input components have a `min` attribute, along with other things (https://trailhead.salesforce.com/content/learn/modules/lex_dev_lc_basics/lex_dev_lc_basics_forms)
* When referencing aura variables inside components, the values themselves are not static. Rather, they will change based on what's inside the respective input field. It's also likely that if you do a setter, it will change everywhere as well.
    * that is indeed what it does! e.g: `temp1.set('v.newItem.Packed__c', true)`

## [Communicating with the salesforce DB](https://trailhead.salesforce.com/content/learn/modules/lwc-for-visualforce-developers/work-with-salesforce-data-in-lwc)

* with LWC/aura, you communicate to SF either through the lightning Data service, or through a component that creates a form using said service.
    * Interesting, it looks really similar to LWC (js)
    * @wire helps you call an apex method, `@wire(methodNameHere, {parameterName: '$jsVariableThatUsedApi'})`
* `@AuraEnabled` is required to use an apex method if you want to communicate to SF
    you can make it `@AuraEnabled(cacheable=true)` if your program makes many calls to salesforce. This will essentially save whatever previous query you did on the backend and replays it when you need it again. Not an ideal solution if you need new data everytime though.
* an apex method built for aura is designed to be stateless. In other words, you don't want the class to create instances of this object or properties. it should be `static`
* It's possible to disable the query cache from the salesforce org itself completely, separate from the code itself. SF doesn't recommend it unless you're developing code.
* ...This basically looks like js LWC, is that the only way for aura components to get SF data?

Holy cow... my browser directed me to the freaken wrong lesson A;SLDFJ;OQWIJPOIMQWC

Ok, on the bright side, there's two things here that are important
* The subject I was learning for aura is the same as lwc
* static methods look to be the same here as well, so perhaps methods inside apex designed for Aura are compatible with LWC too. That would be nice.

The lesson I'm looking for is this: https://trailhead.salesforce.com/content/learn/modules/lex_dev_lc_basics/lex_dev_lc_basics_server

Back to your regularly scheduled programming lessons...
* pasting this straight from the lesson: `<aura:component controller="ExpensesController">`; that's a lot more straightforward then LWC
* Gonna look at this next time, but it looks like you would initiate some async javascript on the controller side of your JS in order to use aura queries in SF.
* They mention that in the controller context, `c.` is a reference to a server-side method, while the same thing on the markup is for referencing javascript controllers.
* `$A.enqueAction(actionHere)` helps execute an apex call, it requires a refrence to the target action (defined in the aura markup). The action itself has a function: `setCallback((ctx,response)=>{});`
    * the `ctx` in the example there is most likely going to be `this`, so the context for the function itself and it's values.
* When creating an apex method that works with sharing rules (database items that can be seen by other user types, instead of just your own data), the class definition needs to have `with sharing` on it.
    * beyond this, they mention the implementation of `isAccessible` and `isUpdatable` for these records are things you would have to check yourself.
* Setting parameters for the method you're calling requires the `setParams` function, so `actionHere.setParams({apexParamName:"paramValue"})`;
* When setting a field in aura markup, just remember that `required` in it's context is purely aesthetic, you'd have to still evaluate it in js.
* I missed this one at the beginning, an **init handler** is a function called from aura, that runs when the component is created. `<aura:handler name="init" action="{!c.doInit}" value="{!this}"/>` is the example they have in the notes.
* When using aura components, salesforce field names are case-sensitive, including when they are expressions in the markup. Perhaps case insensitivity is a visualforce & apex thing only.

## Events

* Events are a way to communicate to other components on the page. You don't set items directly. Reminds me of react's pure functional approach.
* grabbing events can be done through the event handler in js: `component.getEvent("customEventName")`. ~~There doesn't have to be a definition for this, but anything listening will hear it, just like in vanilla js.~~
    * I lied again, it looks like you need a `<aura:event>` tag in the markup. you set attributes inside using an `<aura:attribute>` tag.
        * Ok interesting, the attribute can take primitives as well; that's something I've forgotten about all this time, but that will probably help set things up easliy for when you want something to execute
        * `<aura:attribute name="variableName" type="String">`
        * oh wait, does it need to be in a dedicated file? I suppose it could, though trailhead doesn't really talk about that here.
            * ah here we go, it does, it just doesn't define that's going to be a .evt file. So if that's the case, we would use that to define an event we'd want to listen to.
    * `event.setParams()` helps you send information to anything listening. The function takes an object which contains key/value pairs
        * `event.setParam("variableName", "hello wolrd!");`
    * finally, `.fire()` runs the event.
* I read through it, but I'm a little lost as to what the structure looks like because it's dispersed across the expenses app which I stopped building. Instead I'm gonna look at the docs: https://developer.salesforce.com/docs/atlas.en-us.lightning.meta/lightning/events_component.htm
* Ok, I think things are more sorted out now. to Create an event:
    1. create a .evt file (lighting event). It uses attributes like components do to define it's parameters.
    1. in the desired component, register the event. This means you give it a name within the component and grab the source (name of the event file without .evt).
        * This name is used in locations where you want to fire the event upon doing something else. (component.getEvent)
        * Registering looks something like this: `<aura:registerEvent name="customEventName" type="c:customEventFile"/>`
        * registering means to let this component fire events with this event component. It doesn't mean you are handling them though.
    1. to handle the event, you need a handler in another component. I presume this component would be connected to the application itself in some way. This would be the core communictaion between components. JS would be set here to take in that event's parameters
        * `<aura:handler name="customEventName" event="c:customEventFile" action="{!c.jsHandler}"/>`
* That makes a lot more sense after looking at just two pages and skimming through the trailhead. I should really do that more often XP

# holy cow I'm done... bye!