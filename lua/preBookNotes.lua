--This is a comment

--[[this is 
also a comment]]


--for loop:

--Counts to 5 incrementing by 1:
for i=0,4,1 do
    print("yo")
    end
    --instead of closing brackets, end is used.
    
    --you don't need any varible parameters to define something new:
    balloon = "pop"
    one = 1
    
    --not equal is normally represented as != in most languages, but here, its ~=
    
    --null is different too, it's called nil
    
    --like in javascript, a function is defined as "function" followed by the name.
    
    repeat --This replaces the do-while loop
    one = one+1
    until one ==2
    
    type("hi")--will say that this is a string
    
    math.type(1)--will say this is an integer
    
    --Math.floor(Math.random()) * 5 is now...
    math.random(5)--!
    
    math.floor(3.9)--makes 3.9, 3
    
    --to concat something, you need to use ".." instead of "+"
    
    --If you have a reeeealy long string, then use this:
    
    bleh = [[
    hi
    there
    jo
    how
    are
    you
    im
    fine
    bye]]
    
    --tostring and tonumber do conversions
    
    string.rep("muahaha",5) -- replicates the strings five times
    
    string.reverse("123456")-- makes it 654321
    
    --string.lower and string.upper are just like toUpperCase() and toLowerCase()
    
    utf8.len("hi")-- is the same as "hi".length() in other languages
    
    io.read()--allows user input.
    
    
    string.char(97)--converts to a
    
    string.byte("abc",1)--grabs 97, the first character of abc.
    
    --[[if you use string.char and string.byte together, you effectevly get
    a charAt function]]