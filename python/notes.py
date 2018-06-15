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

#There's this interesting method for creating lists: https://developers.google.com/edu/python/sorting#list-comprehensions-optional

#To launch a system command, you need this:
from subprocess import call
call(["commandHere","arg1","arg2"])

#By the way, if you want to import your own stuff, it's different on versions of python < 3... while you can do this in python3+
import directory1.directory2.whatevever #./directory1/directory2/whatever.py

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

#list comprehension is an interesting concept, it lets you run a pattern to generate a series of values for either a list or a generator:
generatedValues = [value+value for value in range(5)]#creates 0,2,6,8,10

