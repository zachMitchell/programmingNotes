/*objects are a little different in javascript than other languages:

when defining variables, they don't have to just have one single value, they can have mutiple values inisde them (automatically making an exclusive object for that one variable...)*/

var variable = {thing1:1,thing2:2,thing3:12345};

//there is this special function though called object() that allows for creating on the fly objects

var variable = new object();

variable.thing1=1;
variable.thing2=2;
//...

//Functions can also be used to return a full object back, thus representing an object constructor:

function newObject(){
  this.value1=1;
  this.value2=2;
  this.value3=3;
}

/*combining this with function overload, you can create a dedicated javascript file that just creates a specific object depending on what you want.

You can also access object values with the style of lua:*/

console.log(newObject["value1"]);