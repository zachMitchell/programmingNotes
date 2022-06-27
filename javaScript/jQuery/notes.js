//Tutorial notes from: https://www.w3schools.com/jquery/jquery_get_started.asp

//this is microsoft's hosted version of jquery:
//https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js

//jquery is a way to quickly find elements without having to type: "getElementById" all the time! it also comes with some other neat features to help make the code shorter

//in jquery syntax, the main variable is always defined by a css element (with the exception of "this") 

$("#idName")//grabs an id
$(".className")//grabs a class
//etc...



//When starting a jquery portion of a program, it's a good practice to execute your stuff after the page is loaded:

$(document).ready(function(){
  //insert code here
});
                 
//or...

$(function(){
//short-hand for the above.
});

//hide()/show(): this seems to store the html somewhere else when this function is called:
$("body").hide();//now everything's hidden
$("body").show(500);//This shows the body with a 1/2 a millisecond animation!
$("body").toggle();//this combines hide and show together

//functions seem to be allowed inside the show/hide functions to allow doing something straight before performing the action:
$("body").toggle(100,alert("hi"));

//handlers:
$("#whatever").click(randomFunction()); //onClick
$("*").dblclick(); //double click

//end handlers

//Selecting all elements:
$("*");

//big examples of what can be done:
//https://www.w3schools.com/jquery/jquery_selectors.asp

//"this" context can be used when you are implementing functions for jquery

//adding more than one handler in one block:
$("p").on({
  listener1: function(){},
  listener2: function(){}
});

//fadIn()/fadeOut()/fadeToggle(); functions act like show/hide, but they have a powerfull feature that allows them to come in and out smoothly:
$("tag").fadeIn();
//the above also takes the same argumetns as hide/show

//There's also another version called fadeTo(), which lets you fade items to a certain point!
$("tag").fadeTo(200,.5) //where 200 is milliseconds, and .5 is the opacity level.

//slide<up/down/toggle>() performs the hiding and showing as well, but by doing a slide animation

$("tag").animate({property: "string"},500,"linear")
//animate allows things to move fluidly on the page; without linear, the animation has a slow beginning.

$("tag").stop() //This stops the animation

//.delay causes an animation to wait a minute before it get's played.

//animations can also be chained like so:
$("tag").fadIn().fadeOut();

//grabbing a custom element:
$("tag").attr("tagAttributeHere");

$('element').click(function(argument){})//if you insert an argument into an event, you can get various types of information about the event based on what triggered it. (pg 164)

//One of the features above in the argument is to disable default behavior of an element:
$('element').click(function(argument){
argument.preventDefault();
});

//the on() function is an interesting way to set events; it takes in three arguments: the event type, a data object, and a function:
$('element').on('click',{myLovelyVar = 123},function(){console.log(data.myLovelyVar);}); //as you can see, on() sees the object data as the 'data' value. (that sounded weird after typing that XD)
//you can also write for more than one event:
$('element').on({
'click': function(){},
  'mousemove': function(){}
}
);

$('element').hide() //equivelement to setting the display on all "element" tags to none.

