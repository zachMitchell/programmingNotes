[Message channels](https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.use_message_channel_intro) are a method of communicating between components. It's more of a salesforce exclusive feature; so for this to work elsewhere another solution would have to be made.

* For these to work, you need to publish a new message channel by uploading an xml config file to your org.
* There are many things that can be imported to help use the service, gonna blatenly steal this from the page:

```js
// Import message service features.
import {
    subscribe, //Receiving end
    unsubscribe,
    APPLICATION_SCOPE, //Not sure what this is
    MessageContext,
    publish // sending end
} from 'lightning/messageService';
```

* From the looks of things, if you are on the receiving end, you "subscribe" to things being listened to. you use `publish()` to send things off to people subscribing.
* 