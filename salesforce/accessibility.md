(https://trailhead.salesforce.com/content/learn/modules/coding-for-web-accessibility/create-user-interfaces-with-semantic-markupl)

* Building items with the proper html elements help assistive readers determine what's on the page just like you would. Therefore it's always good to use elements for their sepecific purpose before considering using it just as another building block.
    * This is known as "semantic (logic) markup"
* ARIA stands for "accessible rich internet applications", it's a W3C standard to help make the internet accessible for reader tools.
    * There are 3 properties to help with this: roles, states and properties.
    * roles describe the type of item that the reader has hit
    * states tell what the status of the item in question
    * properties describe an html element in detail? like if your select, or a multiselect.
    * https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles
    * something SF didn't properly mention is that states and properties rely on `roles`
    * All three of these items are not designed to change your html structure, but to describe it in more detail

## Understanding accessible navigation

* Users should expect what happens next, and have a choice to change it.
* In this regard, changing the context should bring expected results too
* Consider what would happen for users when you need elements to drag & drop for example; make sure there's an easy way to do this without being a pain for other users.

## Write Accessible Components

* Salesforce put together a list of compliant components for lightning & aura usage: https://developer.salesforce.com/docs/component-library/overview/components
* Web components are awesome, but might cause problems with folks using accessibility tools https://developer.mozilla.org/en-US/docs/Web/Web_Components
* If your structure depends on potentially breaking what an html element would naturally do, using ARIA alongside with things like custom elements and web components may help out with desigining the app.
* lightning web components have a special method of indicating if aria should be used in the entire scope or just a specific element by using camelcase instead of the `aria-` syntax.
* 