# [Salesforce] Lightning data service

* SF prefers to use slds when tranferring data in LWCs.  [THREE ACRONYMS IN ONE SENTENCE]
* Salesforce comes with it's own form components though so you don't have to necessarily deal apex. Probably good for general solutions, but apex is the place where you'll perform other logic.
    * They call this collection the lightning-record-*-form -> lightning-record["","-view","-edit"]-form
    * Huh... despite using this form system, you have to load the form types anyway... I suppose that makes sense?
    * ahhhh, ok it's a parameter in the form. Ok, that makes more sense.
* Here we go, this is the more standard way to communictate to SF, the LDS wire system. It uses that decorator syntax that I *really* want to practice. It's not documented at all right now in the mozilla docs, so I'd have to rely on other sources for decorators.
    * You first import api & wire from 'lwc'. you then import the apex method from the link closely related to salesforce. The field type should also be imported.
    * When you run a wired function, it needs to run through the decorator first in order to retrieve salesforce data. After that it comes back with the results of the data.
* there's something else called LDS functions too, they're essentialy async functions that can be run in regular ones. You pass parameters like you would to the wired function, but instead within the async function itself.
    * This showed me even *more* object destructuring syntax: `{[your.object.value.here]: 12345}`
    * The lds functions can update only one record at a time... for some reason

## Using Apex to work with data

* In order to use the `@wire` decorator, the apex method attaached to it must be set to cachable.
* You can refresh values that were cached by using [`refreshApex()`](https://developer.salesforce.com/docs/component-library/documentation/en/lwc/apex_result_caching). It's specific though to each record.
* Fascinating, When you use LDS, it doesn't have a concept of cache internally, for all it knows it just received data. That means the data would need to be queried in a special way for it to be saved in memory like that.
* Salesforce wire functions have a concept of "reactive" variables. if you send in a string with a dollar sign ($asdf), the function will re-run and get up-to-date data.
* In addition to having these wired functions interact while the data changes, you can also run them "imperitively", so just executing them on demand. It returns a promise.
* [lightning-datatable](https://developer.salesforce.com/docs/component-library/bundle/lightning-datatable/documentation) is a thing that exists
* want to learn more about the meta.xml later: https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.reference_configuration_tags

## Handle Server Errors

* When querying an item from apex, you need to be able to grab the errors from the results if that were to happen.
    * In the lesson, they import this from a component library: `import { reduceErrors } from 'c/ldsUtils';`... which appears to be something I write.
    * Ok, I think that makes sense, when you query your data, you can get these keys (probably others as well) - `data` and `error`. Honestly that seems pretty straightforward
    * A wired function confirms this behavior
    * If you call a apex method through a promise, you wind up getting the data like you normally would through standard JS
* Ok here's an interesting lesson, for the import system to work in LWC, you need a folder with the name of the file you're importing. It will then grab the file within that folder, based on the `c/fileOrFolderName` syntax. It's known as a bundle just like in aura
* I just learned today that you don't have to return anything in an apex method, despite it saying it would, so as long as you throw an exception beforehand.