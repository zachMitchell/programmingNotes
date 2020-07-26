# php-xml notes

This is an extension of the php language. The documentation says it's loaded by default so you shouldn't have to install it... except I had to :/

THEREFORE; if you have that problem like I did; for me at least I found the needed package in the ubuntu repositories: `phpX.X-xml` where `X.X` is your version.

## DOMDocument

This can be used to load html files quickly and make a dom. Not required to make elements themeselves... but php has an error trying to do anything else after that :P

* loadHTMLFile -> loads html file based on path name given
* saveXML -> prints result DOM.
* importNode -> if you have another DOMDocument, and want to transfer some elements, this is the way to go! To import nodes inside of the one your importing (including text), set second argument to `true`

## DOMNode

* textContent/wholeText/data/nodeValue -> outerHTML
* string -> innerHTML

## DOMDocument & DOMNode

* getElementsByTagName -> 1:1 equivelent to js.
* insertBefore($yourNode,$refNode) -> document.prepend... sortof. Note that also any text before the reference node will be sandwiched between the two nodes. If the target node is null, it acts like `appendChild()`