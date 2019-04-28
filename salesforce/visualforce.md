# Visualforce

Visualforce is the foundation for salesforce pages. It is similar to ASP.NET where tags are created on the back-end, and contain programatic elements either pre-defined or built by a dev. Or, it can be compared to the likes of php and python *flask* combined. It works with a the language: [Apex](./apex.md).

## Syntax

Just like html, you can set parameters to VF tags.

* You can retrieve variables from your database using `{! $variable.value }` syntax. Expressions are case-insensitive, and can be concatinated through `&`.

* Visualforce works on something called "components". Coarse-grained components have broad functionality, while fine-grained is focused.
* Component tags don't need to be within eachother to interact. It's all handled within the controller.
* adding resources visualforce can use is a breeze! After loading something new from `setup > static resources`, Your things can be loaded directly to the page via `$Resource.yourThingHere`! This creates a link to your resource, allowing you to use it as you please.
* You can build a custom controller through apex in order to grab information directly from the salesforce database. Really the only requirement is that you have a method in your class called `get[YourIdHere]()` with the section in squre brackets being anything the dev calls. (This applies to loop tags, not anything else :P)
* Clicking on a `<commandLink>` refreshes the page with the action from that link running before anything else.

## Tags

* `apex:pageBlock`: creates something similar to an h1 tag, but contains it's own sub sections such as...
* `apex:pageBlockSection`: a section for pageBlock
* `apex:outputField`: a value that comes out from apex using the `value` parameter. Depending on the value type, the formatting of this field will change. Styles are applied automatically.
