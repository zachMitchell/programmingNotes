--Chapter 5:

--The table is a method of storing information. It seems to be more advaned than arrays, where each address can have a "key".
table={} --define the table

table[bleh]=3 --Where bleh is the address

variable=123 --where 123 is the key

table[variable] = 456 --variable is now the address of this value. (table[variable])
--That includes variables' value as well (123)...
table[123] --returns 456

--keys are optional, but if you have more than one variable with the same key...
variable2=123
table[variable2]=789
--variable will be changed to 789 because variable2 has the same key. It's more like a value is being pointed to by different variables.

--you can change the key of a variable, causing it to point to another value.

--dot notation (table.string) works to replace table["string"]

--Tables can be used as a way of creating objects.

--numbers & strings can be used to define table addresses, allowing you to not have a key attatched to each value.

--constructors let you define your table in array format:
table={2,4,6,8,10}
table[5]--prints 10

--or in another, new format:
table={fred=1,drik=2,son=3}
table["fred"]--prints 1
table["drik"]--prints 2
table["son"]--prints 3


--Beware... if you wanna copy a table, don't just say table1=table2; they will be linked to eachother!


--Chapter 6: functions

--when calling a function, if the developer places in more values required, those values are discarded
--the book says this can be usefull if you want a function that can accept no arguments and one argument.

--to define multiple values:
var1,var2=123,456 --var1 is 123, var2 is 456

--a vardaic function lets you input multiple variables for the argument
function name(...) --where '...' indicates unlimited variables
  
--since "..." is a table of values, assigning a variable to this table allows looking at each value like an array
  
--the function table.unpack returns all values in a table to insert into multiple values at once.

--a tail call is simply calling a function after everything is done in the function that called it, but it clears out memory beforehand. this allows recucrsive functions to go on forever without ever maxing out the user's ram.
  
--Chapter 7: I/O

--this helps write to a file

  --open something for the output stream:
io.output("randomFile.txt")
--actually WRITE to the file:
io.write("text")
  --close it to be nice XP
 io.close()

--reading a file:
io.read(<char>) --where char represents the setting (a for all or l for line)
  
--This same function can read user input:
io.read()

--read a file by line
io.lines()
  
--***I lost some data here, sooo there might be a gap of information***:
  
  hi:write("q;lakhrqpwoir") 
--you can also write errors directly in lua: 
io.stderr:write(<string>) 

--io: 
--grabbing a file: io.input("/file/directory") 

--write:
io.write("add stuff") io.input:close() 

--This takes you out of lua: 
os.exit() 

--you can execute linux command via: 
os.execute("commands") --!!!
--things from lua can also be concatinated with the string (e.g "command" .. shtuffz)

--lua can grab variables from the terminal your using!? :O
os.getenv("bash/cmd/etc variable")

--chapter 8: review

--goto's are in lua!
::ertyuiop::
--shtuffz
end

goto ertyuiop

--elseif is used instead of doing else if; its usefull because it doesnt require the "end" deliminator
if --[[this]]-- then that 
elseif --[[that]]-- then this end

--repeat-until replaces do-while
repeat
    print "yo"
until 1+1==3 --This never ends XP
  
--regular while's exhist though...
while 1+1==2
  print "hi"
end
  
--local variables are a really good to define when making something in a seperate block; especially since it executes faster

  
  
--chapter 9: closures

--functions are defined into variables:
var = function() while true do end

--because of this, functions can be used in interesting places!
--this also explains why you can nest functions

--non-local variables happen when you define a value, then use it ina nested function to take off the "local"

