<?php
//Comments are the same as javascript
#in addition to this one

#variables start with a $
$var1=1234;
$var2="string";

#variables are the only case sensitive element in php

#unlike other languages, php locks global variables to the global scope only, UNLESS you do this:
function whatever($randomValue='hi'){ //$randomValue has a default value if it isn't changed.
  global $globalVar1,$globalVar2;
  
  #or this:
  $GLOBALS['globalVar1'] = 1234;
  #where GLOBALS is the array, and 'globalVar1' is addressed in the index section.

#static variables can be used in functions to keep the data after the function is executed
static $fred = "i'm stayin here";
  
}

#you can output your stuff to html with the echo command:
echo "HELLO";
echo "you can have" , "multiple values printed";

#print does the same thing, only this time you have parenthesis to increase portability in other syntax situations:
print "hi" . "there"; //where "." is concatination
print("this is valid?");

#var_dump() prints the variable type, and value of a php value
var_dump(12345.6); //returns float(12345.6)

#defining arrays
$thingy = array(1,2,3,4);

#constants:
define("constName",$value); //a third option is a bool that toggles case-sensitivity

#for each grabs the amount of elements in a value, and increments based on said value:

foreach($thingy as $value){
  //do something
}

//the count function grabs the amount of values in an array:
count($thingy);

//Like lua, arrays can have keys associated to each value:
$blah = array("hihihihihi"=>1234);
echo $blah["hihihihihi"];

//randomness:
rand(LowerNum,HigherNum);

//getting the length of a string
strlen($bleh);

//When using session data, you ALWAYS need to run this function before anything else:
session_start();

?>