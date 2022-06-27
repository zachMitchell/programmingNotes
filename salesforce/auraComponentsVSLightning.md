* They made me go and learn aura components first -_-
    * 'tis the message that remained for another millenia. And by that I mean a month because I read slowly. And now it's time to finally take on the unit 😵‍💫

## And away we goooo

* aura & lightning components can share events! That's nice.
* you can place aura components in lightning, but not vice versa. I'd presume that's because lightning is fundamentally different and would probably hurt the structure if we were interacting with the shadow dom in a weird way
* with LWC, you can grab svg files through static resources, whereas aura can have it's own dedicated svg file as part of the bundle?
* with aura you're defining attributes in the markup, whereas with LWC you're using the javascript itself to define properties.
    * @api will allow parent components in lwc to set a property you define, without it, it can stay private. It sounds like a unique concept to LWC.
* expressions can be used within the innerHTML of a LWC component
* aura conditional: <aura:if isTrue=""/>, LWC: <tag-here if:true={expressionVariable}>
    * probably good to note, both of these handle expression scope within the context of it's parent... I think...yes
* during an iteration inside of aura, {#propertyName} is used to denotate an item that you're currently looping over.
* `connectedCallback` is a magical LWC word that initializes a component.
* when converting from aura to LWC, you switch from camel (lightning:comopnentName), to kebob (lightning-component-name). kebob is the W3C standard.
* aura components allow styles to cascade into eachother, LWC does not.
* slightly confused by this, but for aura to use exported javascript, you would need to reference a standard es6 module via component syntax (c:moduleHere)
* In aura - you get static resources by using this tag: `<ltng: require scripts="{!$Resource.resourceName}" afterScriptsLoaded="{!c.componentScript}"/>
    * in js you would do the same through the `import` syntax. It starts with `@salesforce` your resource url, and then the name of the resource. so: `@salesforsce/resourceURl/resourceName` [link](https://trailhead.salesforce.com/content/learn/modules/lightning-web-components-for-aura-developers/migrate-javascript?trailmix_creator_id=strailhead&trailmix_slug=prepare-for-your-salesforce-javascript-developer-i-credential#use-third-party-java-script-libraries)
* This is interesting - aura components can be dynamically created using `$A.createComponent()`. Lightning doesn't support this

* I didn't realized there was more than one type of form type in salesforce https://trailhead.salesforce.com/content/learn/modules/lightning-web-components-for-aura-developers/work-with-salesforce-data?trailmix_creator_id=strailhead&trailmix_slug=prepare-for-your-salesforce-javascript-developer-i-credential#create-a-form-to-work-with-single-records
* 

## Misc

* My eyes have been opened to object deconstruction syntax as part of function parameters. `function({a,b,c}){}` expects an object with these three variables.
* lightning web components do not self-close (use />)
* If a child LWC component receives data from a parent, it's stuck as read-only. For it to change, you need to notify the parent and the parent can change it, which will in-turn allow the changes to ripple back down.
* you can send LWC events to aura components: https://trailhead.salesforce.com/content/learn/modules/lightning-web-components-for-aura-developers/communicate-with-events#sending-events-to-an-enclosing-aura-component
* 