#This is a comment.

"""
This is also a comment
"""

#define a variable!
randomVar = "1234asdf"

#python supports integers, floats, bools, and strings

#for bools, they are capitalized
yay = True
asdf = False

#lists are like arrays, they can be defined, and accessed just like javascript
randomList = ["asdf",1234,'a',test]
randomList[1] #returns 1234

#Tuples are like locked-down lists (They have a restricted size instead of dynamic)
randomTuple = (randomList)

#<list>.append(variable) adds content to your list

#<list>.remove(var2Remove) removes the current element (specify the element, NOT the address)

#dictionaries are interesting, you insert one value, and it returns another:
randomDictionary = {
  "asdf":"fsda","qwer":"rewq"}

print (randomDictionary["asdf"]) #returns fsda

#You can get the keys of a dictionary by using:
randomDictionary.keys() #Returns a list of keys in the system.

#functions
def functionName():
   #Things inside the function must always start with a space
    return

#do NOT use space unless you are making functions

#Convserion can be done both up or down:
int("1234") #returns 1234 in integer format

#input comes through:

randomVar = input("GIMME SOMETHING!!!!!!") #this only accepts strings

#to get randomness:
import random

#defining a random number:
asdf= random.randint(1,100000) #between the first and second arguments

random.random() #returns a traditional random number.

#Here's for time:
import time

#for loop:
for varName in range(3):
  print varName
#It's more like for-each

#&& || ! acts like lua (and, or, not) (it's also the only way to do those)
if not True:
  print "blah"

#classes are defined via:
class whatever(object): #ommit object to just make a class.
  asdf = "hi"
  def oi():
    print "hi"

#to define a new instance, do:
yourObject = whatever() #without the parentesis, python will think your referencing the class itself...
#There's this interesting method for creating lists: https://developers.google.com/edu/python/sorting#list-comprehensions-optional

#To launch a system command, you need this:
from subprocess import call
call(["commandHere","arg1","arg2"])

#Sooooo, It turns out from the above that you can't return the string with that method. To do that you need this:
from subprocess import Popen,PIPE
yay = Popen(['command','arg'],stdout=PIPE).communicate() #runs the command and returns a tupple with the string at index 0
#source: https://docs.python.org/3.6/library/subprocess.html?highlight=call#popen-objects

#By the way, if you want to import your own stuff, it's different on versions of python < 3... while you can do this in python3+
import directory1.directory2.whatevever #./directory1/directory2/whatever.py
#reload your module with:
reload(leModule)

#python 2.7 or less can only read within the same directory...

#handling files is pretty simple in python; there's a builtin called open() that can handle this:
myFile = open("AWESOMEFILE.html.txt.zip.gz.bin") #awwww yeah; ultimate compression B)

#Python has nice compatibility with the for syntax for file management. simply running this will allow you to read each line on the fly.
#You can also read everything at once, though it's probably best to do this when the file is small...
awesomeFile = myFile.readlines() #Returns a list of lines from the file.
#Close the file by running:
awesomeFile.close()

#Go back to the beginning of the file:
myFile.seek(0)
#Learn more about file management here: https://docs.python.org/2/library/stdtypes.html#file-objects
#There's also a method to make a file object just through a string: (https://docs.python.org/3.6/library/io.html#io.StringIO)
io.StringIO("my\nawesome\nstring") #returns a file object containing unicode strings.

#list comprehension is an interesting concept, it lets you run a pattern to generate a series of values for either a list or a generator:
generatedValues = [value+value for value in range(5)]#creates 0,2,6,8,10

#This is shorthand for a tupple:
1,2,3,4
#You can detect types with a couple of components:
import types
type("asdf") #This returns a type object which can be compared with:
type('') == types.StringType
#the types object has an equivelent that matches whatever gets returned from type(), so it can be used for nearly all variable types

#If you want to pass by reference, things get a little weird. The idea is to not directly alter a mutable value...
mutableList=[1,2,3]
def changeList(lInput):
  lInput.append(4) #Change the output by reference. This appears to be the only way to alter something because you can't access the argument list

#Tupples are like lists... but constant :/
myTupple = (1,2,3,4)
#You can make a function that accepts multiple arguments; a variable starting with * indicates a tupple, and ** represents a dictionary:
#https://stackoverflow.com/questions/919680/can-a-variable-number-of-arguments-be-passed-to-a-function/919720#919720
def leFunction(*myArgTupple):
  for thing in myArgTupple:
    print(thing)
#You would call this function like:
leFunction("yay","whatever >:(","another value","for the tupple")

def dictFunction(**values):
  for key,value in values:
    print("Key:"+key+"\nvalue:"+value+"\n\n")

dictFunction(myCoolVal = 1,myLameVal="laaaaaaame")

#You can alter the behaivior of python itself thorugh some built-in functions!! (https://docs.python.org/3.6/reference/datamodel.html?highlight=__getitem__#emulating-container-types)
#For example, you can alter the way indexing works on something that's not a list!
class yay(object):
  def __getitem__(self,key):
    #return whatever you want based on output!
    return key*key

