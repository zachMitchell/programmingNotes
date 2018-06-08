--Chapter 10: pattern matching

--string.find returns two things, the beginning of the search result, and the end.

--see 332 for a list of a list of escape keys


--chapter 12: time

os.time()--displays the time in seconds

os.date()--displays the time in a standard format
--if you want, you can insert an integer as an argument, as well as *t to return a table
--figure in the programming book 12.1 shows a list of chararacters that can be used for a custom display format.

os.difftime(table1,table2) --the difference between two times

--Chapter 13: bits and bytes

--a bunch of the explanations were found via wikipedia (https://en.wikipedia.org/wiki/Bitwise_operation)

--logical left shift and right shift, shifts a number by x amount of times on the binary level:

1<<2 --turns into binary 4 [0001 --> 0100]
9>>1 --turns into binary 4 again! [1001 --> 0100]

--bitwise & checks on the binary level if integers have the same bit, and if they do, the bit is kept in the end result:

3 & 2 --returns 2 (11 and 10 both have the second bit, so it returns the bit both have in common.)

--bitwise | combines all bits together into one number

7 | 4 --[[returns 7:
 0111
|0100 --> 1111--]]

--string.pack and string.unpack are methods of compressing numbers into "binary strings" (a.k.a, the characters for the corresponding ascii number... and some other secret sauce :/)
string.pack("ii",1,2) --packs 1 and 2 because ii signified two integers

string.unpack("iii", var) --unpacks var, which has 3 integers.

--string.unpack also has the ability to return a "zero terminated string" (pg 100)