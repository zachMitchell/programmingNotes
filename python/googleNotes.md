Google's python class
=====================

[Link to the lessons](https://developers.google.com/edu/python)

* the **sys** *namespace* contains a *list of arguments* at launch time:
```python
import sys #this needs to be imported before using these values.
print(sys.argv[1]) #where arg 0 is the name of the command.
```
You did not misread that; it may *look* like an object, but namespaces also use dot-notation. For every file that is imported, a namespace is used to separate variable names, so nothing gets overwritten.
* You can import specific values from namespaces so you only need to get the stuff you need:
```python
from my_source import val1 val2
```

* ***len()*** lets you find the amount of elements in an array/string:
```python
len("asdf") #returns 4
```

*  ```__name__``` is a variable that determines whether or not python is running through a different program other than the interpreter.

* when executing this through the interpreter, it returns ```__main__```
google calls this a *"boiler plate"*

* The reason "asdf"*3 returns "asdfasdfasdf" is because "*" is defined as a **overloaded operator**.

* Indentation is an important part of python. Every space of indentation is a new scope, so you need to keep your values etc. in that block.
  * **Indent with spaces, not tabs!!**

* The standard indentation for python is *underscore_spacing* instead of cammel case.
* Strings in python do not directly comply with the utf8 standard; therefore, you need to specify that your string is utf8 when moving output to other languages:
```python
leString = u"hello"
#Let's convert a string into utf8:

```
* numbers and other objects cannotbe directly be printed after a string, therfore you need `str(value)` to actually convert that value print can handle.
* Strings can also be written in a format similar to printf:
```python
name="joe"
age=3
blah = "hi there %s. you are %d years old" % (name,age)
```
* python has this unvonventional method of grabbing substrings: `"hello"[0:2] #gets "he"`
  * I don't know why the above is the case [shouldn't it be 0-1?], but it's almost like it's saying "start at this index, then stop before this index"...
* A list is like an array, except when making a new list, a "copy" is actually referenced33.
* **range(leArg)** is a function that generates a list of numbers up to the single argument.
  * This can help with the single for-loop type in python: foreach
```python
for randomVar in range(3):
 print randomVar #returns 0,1, then 2
```
  * Since this is pretty much all python has, you can use it to your advantage by calling something other than numbers.
* Python has unique syntax for searching for things in lists:
```python
if "targetString" in randomList: #if targetString is one of the elements in randomList...
 print "hi"
```