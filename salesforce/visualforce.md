# Visualforce

Visualforce is the foundation for salesforce pages. It is similar to ASP.NET where tags are created on the back-end, and contain programatic elements either pre-defined or built by a dev. Or, it can be compared to the likes of php and python *flask* combined. It works with a the language: [Apex](./apex.md).

## Syntax

Just like html, you can set parameters to VF tags.

* You can retrieve variables from your database using `{! $variable.value }` syntax. Expressions are case-insensitive, and can be concatinated through `&`.

* Visualforce works on something called "components". Coarse-grained components have broad functionality, while fine-grained is focused.
* Component tags don't need to be within eachother to interact. It's all handled within the controller.

## Tags

* `apex:pageBlock`: creates something similar to an h1 tag, but contains it's own sub sections such as...
* `apex:pageBlockSection`: a section for pageBlock
* `apex:outputField`: a value that comes out from apex using the `value` parameter. Depending on the value type, the formatting of this field will change. Styles are applied automatically.
