--Chapter 1

--chunk: any amount of code; it could be a few lines, or a whole file.

type(--[[value]]) --find out what value something is. The type function itself returns a string.

    --variables can be refferred to regardless if they exhist yet:
    RandomVar
    
    --if you attempt to print a variable that hasn't been asigned, it will simply return nil
    
    --execute another file:
    dofile("/the/file/directory");
    
    --For no reason whatsoever, else if needs end to finish it off, just like if
    
    if this then print("that")
      else if that then print("this")
        end --else if's end statement; it needs to be within "if"
      end
    
    
    --Chapter 2
    
    --shorthand for a for loop that increments 1:
    for i=0,5 do
      print("hello") --prints this 6 times
      end
    
    --Chapter 3: numbers
    
    --to find the type of integer a number is, use:
    math.type(3) --Returns "integer"
    
    --Hex also works:
    0x1F --prints 31
    
    --to divide via integers, you need //
    3//2 --prints "1"
    
    --math.floor() rounds a float to a lower integer:
    math.floor(5.5) --rounds to 5
    
    --math.ceiling() rounds a float up
    math.ceil(5.5) --rounds up to 6
    
    --Chapter 4: Strings
    
    --"Edit" a section of a string:
    
    name = string.gsub(varToGrab,"Section to replace", "edited section")
    
    --grabbing the length of a string:
    #"string"
    
    --equivelent to the above:
    string.len(<number>)
    
    --concatination doesnt use "+"; instead, it is replaced by ".."
    
    --hex is supported in strings:
    "\x64"
    
    --concatination in lua 5.2 allowed combining numbers:
    5 .. 3 --"53"
    
    --converting a string toa number:
    tonumber("5")
    
    --tostring does the same thing, but in reverse:
    tostring(5)
    
    --grab a specific section of the string
    string.sub(<source>,<beginning>,<end>)
    
    --Grab the char version of ascii input
    string.char(97) --prints 'a'
    
    --grab the ascii number of a character:
    string.byte(<string>[,<int>,<int>,<etc...>])
    
    --The printf of lua, this lets you print a string in a similar format:
    
    --[[variable types:
    "%d" - integer
    "%x" - hex
    "%f" - float
    "%s" - string]]--
    
    string.format("%s",<string>)
    
    