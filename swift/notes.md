Swift
-----

Swift is a programming language made by apple! It was designed to be really easy to use, and still have rich complexity.

## Syntax

* **Variables** are defined similar to javaScript, where the datatype doesn't need to be pre-defined:
```swift
var coolVal = true
//You can however define the type (before you initialize anything)
var strVal: String = ":)"

//Instead of the "let" keyword being defined as a local variable, it means "set a constant":
let yo = true
```

* **Arrays** can be defined multiple ways: `var shtuff = [1,2,3]` or `var shtuff = [Int]() //This defines the type before inserting any values.`
* Integers can have the following format to make it easier to read: 1_000
* swift will not consider single values to be true (unless the values is true); therefore, you need to write conditionals in order to use if statements:
```swift
if true{
    print("hi! :)")
}
```
* If statements need curly braces :P

Defining a function:
```swift
func yay(){
    print("hooray!")
}
//You can define the return type before using the function:
func boo() -> Boolean{
    return false
}
//EDIT: The return type is actually required if not void XP
//Any arguments need to have it's type defined:
func asdf(val1:Int,val2:String){}
//When calling this, the values must be in the order they were defined.
```
* The reason you mention the variable name at execution is that you can multiples. If you label a variable with an underscore, it doesn't need a name.
* **Optionals** are a concept in swift similar to how lua handles values: if the value doesn't exist, return nil:
```swift
var thing:Int? //You can leave it like this, or assign a value afterwards.
```
Unlike regular variables, they can be left "blank". Regular variables *must* hold something...
* Interestingly, you can compare these values on their own, or even print them wen nil as long as they are by themselves. In order to make use of them, you "unwrap" [I like unlock better] them by adding `!` (e.g `thing!`)

* Swift comes with conversion functions for all basic data types! Just use the data type name with your value as the argument! (`Double("1")` (converts to 1))
* `ternary conditional`: true ? 1 : 0
* a "Nil-Coalescing Operator" is a shortcut designed for optionals; `asdf ?? ":P"` means: is asdf isn't nil, use asdf, otherwise use the right-hand variable.
* dictionaries are interesting... They let you set the key to any datatype you like!
```swift
var dict:[String:Int] = ["asdf":1]
var dict2:[Double:String] = [2.3:":O"]

print(dict2[2.3])

//Empty:
var dict3 = [String:String]()
```
* Dictionaries also have a `.count` variable! [this is new for me; all associated arrays I've seen didn't have this capability]
* Case works the same, the only difference is no paraenthesis around the value
    * EDIT: Looks like they have a little something extra: compound cases. In additon to the first `case` value, add more separated by commas (`case 1,2,3,4:`) (This saves time vs having to write case for multiple values)
    * They can also use a fallthrough statement which helps a case statement intentionally overflow to the next statement. (This is the opposite of most languages where you would have to stop it every time.)
* The only for-loop available is a for-in

* Closures is like lambda or arrow functions in other languages:
```swift
var myCoolClosure = {() ->String in return "hi"} //really fast
```

* swift comes with a sorting method that requires a function (made by you!) to work. It seems to act like a double for loop in terms of how it's iterating through things.
```swift
[1,2,-1,-2].sorted(by:{(t1:Int,t2:Int) in return t1 < 0}) //The second argument can be used for comparing the first, but I wound up comparing this to 0.
```

* Multiline strings look like python strings, but they must begin and end with `"""` on different lines:

```swift
var myString = """
your string here
"""
```
 * These strings are intelligent enough to know where they are when IDE's use spacing
* sets are a container type that contains unique values, they are initialized by:
```swift
var thing = Set<String>()
//or...
var thing: Set = [1,2,3]
```
* sets come with really neat functions to combine other sets (e.g `union`,`intersection`)
    * they can be returned as a string through the `sorted` function
* The closedRange object is like a set where it can't be directly accessed. It's designed to make iterations with raw numbers easier.
```swift
for i in 1...3 {
    //shtuffz
}
```