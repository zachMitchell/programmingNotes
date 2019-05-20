# Apex

[Trailhead (primary learning resource)](https://trailhead.salesforce.com/) | [Salesforce developers](https://developer.salesforce.com) | [Object Reference](https://developer.salesforce.com/docs/atlas.en-us.218.0.object_reference.meta/object_reference/sforce_api_objects_concepts.htm)
-|-|-

*Apex* is the proprietary programming language for [salesforce](http://salesforce.com/), a CRM. It is a Object Oriented, strictly-typed language similar to Java, and features something unique: built-int sql functionality (SOQL). It also works with a markup language called [Visualforce](./visualforce.md), which is the foundation for salesforce pages, and directly talks to apex.

## CRMs

**Customer relationship management** systems are designed to make use of data coming from different locations. It reminds me of a database but with a gui in front of it, or an all-in-one full stack development suite. You can accumulate data with front-end programs either pre-made or programmed by you (**apex**), and make use of that data everywhere[? writing this as newb :P].

## The beef starts here

* Logging to the debug console: `System.Debug('msg');`
* Salesforce Objects can be created just like any other object in apex! This involves calling the ui name, with the constructor calling the individual field ui names as well. ( [Example](https://trailhead.salesforce.com/content/learn/modules/developer_console/developer_console_queries?trail_id=force_com_dev_beginner#Tdxn4tBK-heading4) )
    * On the subject of this, apex supports an argument syntax similar to python: `Account acct = new Account(Name='Acme');` (coppied from trailhead)
* apex supports lists similar to c#, but because it's a custom language, you don't need to specify a list before hand... you would declare an array, then a list (e.g `String[] thing = new List<String>();`)
    * These lists use `.add()` to add subsequent elements to itself, and `.get()` to obtain an indexed value.
    * Just like the main point, you can simply uses lists like you would arrays, so the former isn't neccessary :P [*soooory, reading and taking notes at the same time XP*]
    * Get the length of arrays through `.size()`
* The superclass of all Salesforce objects is `sObject` (Not to be confused with `object`, the object for all objects).

* apex has direct commands to insert, update and delete sObjects in a person's org. This would allow you to create objects through your syntax, and allow for coversion tools to exist!
    * Said statements can also accept arrays of objects.
    * The above statements are the equivelent of using `Database.[commandHere]()`. A second argument exists within this method where you can still run queries if the DML statement has an error. (Boolean)
    * The element that is returned from `insert` is called a `Database.saveResult` (array). This confirms whether or not the action suceeded, and other information.
* use the dedicated `DmlException` object when handling the above situations.
* You can have up to 150 records in a list for one DML action (updating, deleting, etc). You could probably break this down yourself and update those records in small chunks.

When deciding whether to use one or the other statement, trailhead suggests using the `Database` methods if you need more control. If you need a simple solution, using the built-in DML syntax would work just fine.

* If and sObject references another sObject, those objects must be updated independantly from eachother if you update the values of each.
* You can create test classes to make sure your code is working by adding `@isTest` to the beginning of the document, as well as for each test method.
    * At the end of each test, use `System.assertEquals(bool,bool[,errorMessageHere])` to make sure the output is what's expected.
    * If you need test data, trailhead reccomneds making test classes that will help generate unlimited data for you.
* All sObjects can be turned into a map through the following syntax: `sObjectHere.getPopulatedFieldsAsMap();` [source](https://salesforce.stackexchange.com/questions/8773/is-it-possible-to-convert-an-sobject-to-a-map/164436#164436)
### SOQL
* SOQL statements can be natively typed within the language itself...
```apex
Contact[] guys = [SELECT * FROM Contact WHERE name = 'fred'];
```
* They can also be dynamically through `Database.query(strHere)`
* SOQL statements cannot use `*` for queries; you *must* select something or it will not work.
* when using the square bracket syntax, you can use existing variables (so they don't conflict with SOQL) via `:variableName`
* Was just experimenting with SOQL, it's really unique in that if you set your limit within the statement to 1, it can either return an array **or** a single sObject depending on the variable it's going to.
* Sub-queries work a tad differently than what SQL does. When running one, anything that the key object it's related to will be how it get's queried. for example: `select (select Name from Contacts) from Account` is going to return anything associated with the ID of `Account` and that result's criteria.
    * Retrieving that data should be as simple as invoking the plural name of your SObject (Contacts in the above example): `queryResults[0].Contacts` *(Returns a List of Contacts.)*

### [SOSL](https://trailhead.salesforce.com/content/learn/modules/apex_database/apex_database_sosl?trail_id=force_com_dev_beginner)
* **SOSL** Is a simpler sql-like language that makes finding entries within salesforce shorter (probably more expensive though :P). See ([here](https://trailhead.salesforce.com/content/learn/modules/developer_console/developer_console_queries?trail_id=force_com_dev_beginner#Tdxn4tBK-heading6)) for more details.
* The core difference between SOQL and SOSL is that you can search for keywords in many objects vs just one.
* **Example** (stolen from trailhead) `FIND {Wingo} IN ALL FIELDS RETURNING Account(Name), Contact(FirstName,LastName,Department)`
    * The method-like syntax represents which object you want to look for, and what fields you want to compare within that object.
        * You can limit each individual sObject's results by adding `LIMIT [numHere]` to the end of that sObject's argument list (no comma).
    * The curly braces represent the string the user wants to match (or be similar to)
        * This does not work if you're trying to reference a variable; you must use `:variableName`
    * The `in` statement refers to the value type you're looking for (e.g EMAIL, PHONE). Specifying `all` will look at things in general.
* When running a SOSL query, it returns a two-dimensional list; the first dimension being the object type, and the second being the list of results.

### [Triggers](https://trailhead.salesforce.com/content/learn/modules/apex_triggers?trail_id=force_com_dev_beginner)
* Triggers help apex do things after something happens to an object. It's kindof like event handling for sObjects!
* Use `Trigger.Old` and `Trigger.New` to get the befores and afters respectively of the object(s) that caused the trigger.
* The `Trigger` Object can do other things, like tell if it was triggred by one of the things listed on it's definition
* *always* assume more than sObject can enter a trigger. That way you can change everything.
    * on the subject of this, keep in mind that if you have over 200 sObjects in the trigger at once, anything above 200 will be called in a separate trigger. Therefore, 800 records would be broken down into 4 trigger instances.


## Misc.

