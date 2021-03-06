//Xml is designed to allow the transfer of objects in a recyclable manner.

var randomXML=`
<randomTag property="asdf">HELLO! im content</randomTag>
`;

//In order to read the xml, you need to make a parser:
var leParser = new  DOMParser();
//then you parse...
var parsedThingy = leParser.parseFromString(randomXML,"text/xml");

//You can then access your tags through the following:

parsedThingy.getElementsByTagName("randomTag"); //returns an array

//attributes of the tags can be accessed by:
parsedThingy.getElementsByTagName("randomTag")[0].attributes //returns an array; accessing this + .value will provide the raw value; .name will provide the name.