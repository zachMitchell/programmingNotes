# Visualforce

Visualforce is the foundation for salesforce pages. It is similar to ASP.NET where tags are created on the back-end, and contain programatic elements either pre-defined or built by a dev. Or, it can be compared to the likes of php and python *flask* combined. It works with a the language: [Apex](./apex.md).

## Syntax:

Just like html, you can set parameters to VF tags.

* You can retrieve variables from your database using `{! $variable.value }` syntax. Expressions are case-insensitive, and can be concatinated through `&`.

* Visualforce works on something called "components". Coarse-grained components have broad functionality, while fine-grained is focused.

* **Controllers** help retrieve data from a specified object. when inside an `apex:page` tag, they have the syntax: `standardController = 'ObjectHere'`

* Data edited within visualforce will be done mostly through forms (`apex:form`). for the form, you can place in tags like `inputField` and `commandButton` to make changes.
    * Accourding to trailhead, using the `commandButton` runs the "save" method within the controller you're using. This means whatever happens would be under the dev's controll.
* section for `pageBlock` allows you to insert buttons on the top and bottom of your page (`pageBlockButtons`)
* `pageMessages` turns messages on for that particular section. the controller for the section will take care of messages that happen to ocurr.

## tag properties

* **columns**: sets the amount of tags allowed in one column.