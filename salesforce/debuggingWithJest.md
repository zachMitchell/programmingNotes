# Debugging With Jest

[Unit](https://trailhead.salesforce.com/content/learn/modules/test-lightning-web-components/set-up-jest-testing-framework)

* Unit testing encourages devs to write components in a more modular manner, in order to write the tests easier.
* End-to-end testing more like a runthrough of the app and faces the realities of outside sources
* It looks like SF has built their own jest library specific to testing LWC on salesforce
* this sets up jest: `sfdx force:lightning:lwc:test:setup`
* "Git is preinstalled in Visual Studio Code." ...eh? I *really* don't think that's the case; that would be a whole array of packages vscode would have to install that are large... maybe I'm misunderstanding here
* lifecycle hooks assist in detecting if a dom element was just added or removed to JSDOM.
* there seems to be a way to emulate @wires...
    * When doing this, you need to create a mock, register it, and then emit it when you create the element.
* Looks like you can also mock other components that aren't present: https://trailhead.salesforce.com/content/learn/modules/test-lightning-web-components/mock-other-components
* 