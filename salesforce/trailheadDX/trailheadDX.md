Trailhead DX is a two-day crash course on everything salesforce! I got to attend this, and as of this writing, my schedule is booked XP

[(Website)](https://www.salesforce.com/trailheadx/)

## Choose the Right tool for your next automation job
**Topic:** Lightning flow

* Consumers, devs and administrators love seamless experiences.
    * The more simple something is to the end-user, the more complex it is to make.
* Flow builder is a simplistic system that helps starts you off with macro-like processes
* process builder helps create more complex systems, and even let's you execute apex triggers.
    * There's a new ability available for this feature! You can create applications for appExchange that let's you use process builder!


## Designing Mobile Apps for iOS

This is a talk by Mark Malone from apple!

* Aestetic is important for your app. You wanna stay relevant with your app. You don't really want to keep it in archaic times.
    * Design also spans into usability as well. You want it to "just work" [;P] without much explanation
    * Familiar icons are also usefull for that "just works" element.
    * Animations are important for design too. They help guide the user gently to what happens next.
    * Becuase of the advancements of usability, people of all ages can use interfaces of today.
* Preditcabiltiy helps you create something an end-user would expect from your design.
* inlcusivity is helpfull for when people need accessiblity options.
    * From another thing I saw, it really does empower somebody who wouldn't normally use the app. It makes them capable of things they couldn't before.
    * common examples include color-blindess, font enlargment, and voiceOver
* usability: making full use of all the device's capabilties.
    * if something is tricky to solve using pure code, making use of the hardware capablities could help you solve a tricky problem.
    * Apple has machine learning API's already created so you can get started quickly.
* Apple has a site called "human interface guidelines".
    * salesforce Mobile SDK 7.1

## Keynote
New content!

* We were introduced so salesforce blockchain: salesforce's solution to making blockchain easier.
* Lightning is now open sourced! (http://lwc.dev)

## Salesforce DX cheatsheet

* SFDX is a suite of tools to make things easier for devs.
* Basically anything that's usefull to the developer is part of this "DX" :P
* Scratch vs sandbox:
    * scratch orgs are designed to be built from the ground up, mostly used for experiments
    * sandboxes are designed to have something ready to go.

## Js tips and tricks

* With constants, you cannot derive away from the original referenced object. Basically that means you can add elements to an array because the *array* is referenced, not the elment (This could also apply to objects)
* [array.every()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/every), [array.find()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find)
* rest:
    * the spread operator [...] appends and extracts array elements into one array.
    * destructuring syntax: this can be used to query certain objects while creating a new object at the same time
        *  this technique can also be used in arrays.
* https://bit.ly/2HDIUI7

## a practical guide for turning a commodore 64 into a photo booth
* MuleSoft: conect *anything*
* The idea was to connect polar opposites: the c64, and the internet... by the POWER OF MULESOFT
* this guy could figure out the c64 from it's exhaustive guide that's included with every c64.
* in order to connect the c64, they created a custom cable!

## Salesforce <3's DX

* oclif, buildpacks
* Checkout https://opensource.salesforce.com
* https://gitlab.com/sfdx
* There's something new coming out called preview scratch orgs, which let's you run future verisons of salesforce with your code.
* https://about.gitlab.com/partners/sfdx-offer
* sfdx was released around '17; so you've been using some really new stuff :)

## Becoming a certified salesforce developer

* Buying a reservation to the test is $200, but retrying is half the price.

## Advanced Apex Testing

* @TestVisible
* You can use a csv to create a test on the fly with new data able to be created quickly.
    * This lets you test your code without re-deploying
    * You can reference other id's within the same csv so you can link data to other data!
* One interesting thing you can do is a "sanity check", which is checking data to make sure everything is expected before the test starts (run system.assert())
* Lookup: httpMock
    * [now i remember] He's talking about creating fake http responses.
    * He showed a technique where you return a mock response, then removing them as he returns the value (Javascript does something like this natively, I forget the name though.)
* Lookup: System.StubProvider, Type (Object), Test.createStub
* DML: data manipluation langauage.
    * The guy here said you don't really need to do this stuff in your testing[?] (People tend to do it in order to reference other SObjects... like me XP)

## Tips and tricks for acing your certification Exam

* Getting a certification is a massive leg up on your carreer, you might just get lots of attention on linkedIn!
* Places to learn the right stuff for a certification:
    1. https://trailhead.salesforce.com/credentials
    1. trailheadDX workshops
    1. trailhead
    1. documentation
* Paranthesis: topics of high priority on the exam
* The exam is multiple choice / multi select. Time varies depending on the test.
* You can go back and review questions, it doesn't force you to push forward. It can even take you directly back to the question
* The test can be taken online, but it can also be taken in a testing center! the latter option depends on your location though :P
* Tips & tricks:
    * Know your testing style.
    * do things that help you remember answers to questions, whether it be making a visual chart, verbal repition, etc.
        * [When I think of this, it reminds me of [The method of loci](https://en.wikipedia.org/wiki/Method_of_loci)]
    * Manage your time properly. Know what you need to do depending on your test-taking style. Depending on the test, you have a set number of questions, so you need to manage your time based on that information.
    * Disect each word in the question. Glazing over it can cause mistakes [I can speak from experience XP].
    * remember how you answered the question. Did you guess? Was it an "educated" guess? Was it your gut?
    * You can start the test whenever you want. It doesn't start it until you click the button. That way you can relax and analyze what you want to do.
    * "expect to fail" - Mistakes are human, it's fine if you make a mistake. It's something that happens all the time, so no pressure if you get wrong the first time.
* At the end of the exam, you get feedback based on your test results. (e.g you got Apex 96% correct)
* Having a study budy and going to "Trailblazer community groups" can help you study.