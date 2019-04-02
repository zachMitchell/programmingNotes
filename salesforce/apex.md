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
* The superclass of all Salesforce objects is `sObject` (Not to be confused with `object`, the object for all objects).

## Misc.

* **SOSL** Is a simpler sql-like language that makes finding entries within salesforce shorter (probably more expensive though :P). See ([here](https://trailhead.salesforce.com/content/learn/modules/developer_console/developer_console_queries?trail_id=force_com_dev_beginner#Tdxn4tBK-heading6)) for more details.
