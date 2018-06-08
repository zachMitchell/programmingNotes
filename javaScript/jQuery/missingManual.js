//Changing the inner HTML of a tag:
$('selector').html("<p>Changed content</p>"); //note that it changes INNER, not outer html.
//.append() and .prepend() give you the ability to add on to the text instead of replacing it.
//.before() and .after() adds content from the OUTER html of the selected element. .replaceWith() completely overwrites the outer html.

$("p").remove() //removes all p tags.

//Getting The child of an element:
$("parent > child")

//Finding elements with an attribute:
$("p[style]") //Any paragraph that has a style tag
//You could go further and get a p with a specific style:
$("p[style='color:red']")
//Adding ^ or $ causes the above to query a string that begins or ends with said string respectively:
$("p[style^='color:']") //searches for 'color:' from the beginning of each attribute.
// *= can get anything from any point in the string

//Filters let you grab items based on certain criteria, and begin with ":"
$("p:first") //Lets you grab the first paragraph
// :not() is a negator; you can use this to find attributes not within it's parenthesis.

//Other examples of jquery filters can be found in page 125


$("#yo").addClass("cssClass"); //you can add classes Through this function.
//.removeClass() can also be done. The javascript equivelent could be accomplished in different ways, but this one method is nice.

$("p").each(function(){ //for each p tag, perform this function: (you can refer to the current element via $(this)
});

$('element').clone() //makes a new copy of your element.

//This appears to be original to jquery! it combines onmouseover and onmouseout
$('element').hover(
function(){}, //onmouseover
function(){});//onmouseout

//You can assign variables specific to jquery:
var $newVar = "asdf";
//When assigning jquery variables, you can access those values faster than actuallly going trhough a rabbit hole of commands:
$answer.html();

//Check a style attribute! use the following syntax:
$answer.is(":blue");

//toggle class takes on/off the class on the specified tag:
$('#fred').toggleClass('myLovelyClass');

//You can change an attribute (or more than one) of a tag through the folliowing syntax:
$('element').attr({
style:"asdf",
  width:"1px",
  controls:"controls",
  etc:"etc..."
});
//This function is good for retrieving values as well!
$('element').attr('attribute');

//You can replace the entire html tag you are querying with the following:
$('element').replaceWith("<newTag!!!>yay</newTag!!!>");

//The book had this neat idea to preload images: create a disposable object that has the src value!

//jquery has a very interseting way to create tags on the fly: (see page 213)
$("<tag>").html("");

//you can query more than one thing at once!
$("this, that") //Where the comma separates your tags/elements/youGetTheIdea

//The open() function can set properties of a new window just by using third argument just as if you were making a new tag!
//There are a variety of different methods to altering a window's state (pg. 23{4,5})

//You can create a new object by creating just the tag in jquery [THIS IS SO MIND-BOGGLING!]
$("<div>").attr('tagName'); //This is an object you can store in a variable

//for forms, jquery has an interesting shortcut to obtain input elements:
$(':password')
$(':input')
$(':etc')

//if you use prop() instead of attr(), you get actual values vs the string  within the tag's options.

//css() is another way to change css:
$('blah').css('color','blue');