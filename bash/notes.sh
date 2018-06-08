#I'm learning from this book online: http://www.tldp.org/LDP/Bash-Beginners-Guide/html/
#When bash executes a command, it makese a copy of the environment.
#ps: looks at the current processes
#export: sets a variable both local and in subshells from the parent shell (usage: export [variable] = [value])
#if you use this command, other scripts can alter the variable as well.

env #prints all environment variables

#If you don't wanna execute a script in a seperate shell, you would type:
source=.

#you can debug any shell script via the -x flag! This works by doing the following within your script:

set -x
echo blah
set +x #where debugging is enabled within whatever's inside the set commands.

#commands can be outputted to other commands like this:
echo $(ls ~);
echo `ls ~`;

#aliases are awesome!!! they allow for shortcuts in the terminal (kindof like macros!)
#usage:
alias asdf = #command here
#run alias by itsef to see a list of commands.

#to change your aliases, you need to go to either "/etc/bashrc" or "~.bashrc" depending on the system configuration.

[ #This is actually a command! It's designed to return a bool when comparing files. a list of flags can be foud in the respective man page.
#some may include:
# -a FILE (if file exhists), -d FILE (ditto and is a directory)
#This command also allows for numerical comparisons through -gt and -lt; Overall, this one command is good for any string or file comprison you would need in bash.
test #equivelent of [

[[ #This command is identical to [, only you don't need double quotes for strings with spaces

#The else statement needs to be within the if statement to work (before "fi")

#shell arguments are identified through the number of the command (e.g: $1 for command 1, etc)
#to determine the number of arguments, use this value: $#
# equivelent to else if: elif

#case statements can accept strings and bools:
case "whatever" in
"whatever") command1;;
"not what your looking for") command2;;
*) command4EverythingElse;;
esac

echo -e "\a" #This is SUPPOSED to make the pc speaker beep, but it doesnt work on mine :(
#that, and -e read's whatever goes in the backslash.

#read is the built-in that allow's user input:
read randomVar1 randomVar2;

read -n 4 randomVar #reads 4 characters, then adds them to $randomVar

#If you don't need your errors to go anywhere, the book says it's a good idea to redirect your errors to /dev/null

#for loops as of this writing only take lists of things; if you want to use just a raw number, you would need to program that yourself :/
for randomVar in "list of words"; do echo "$randomVar\n";done
#returns:
#list
#of
#words

#looks like a less complicated way to count would be to use a while loop:
$i=0;
while [ $i -lt 3 ] do
echo "$i\n";
$i=$[$i+1];
done

#where things in the $[] represent math operations.

#"until"'s syntax works just like "while"'s, only it behaves like a do-while loop, instead of while.

#continue is a pretty usefull statement; if there's no work to be done, you can block said work, by adding a continue statement

#If you want to cycle through your arguments (since they arn't in a list) you can use the "shift" keyword! this shifts your arguments to the left until you run out of args!
while  (( "$#" )); do
        echo $1;
        shift
done

#declare allows for more advanced variables! it has a variety of options:
declare -r fred="asdf" #assigns as read-only for example. (constant)

declare -i asdf=1234 #assings it to an integer; if overwritten to a string, it will revert back to 0.

#!/bin/bash

#you can declare arrays through the following syntax:
leArray[0]="randomVal";
leArray[1]="randomVal2";
#or this:
leArray=("asdf" "fdsa");

#Call the array values:
echo ${leArray[*]};
echo ${leArray[0]};
echo ${leArray[1]};

#you can delete variables via:
unset randomVal;

# $[1+1] This returns 2! $[] is designed to do integer math

#{} can do three things: 1.run a list of commands, 2.access arrays, 3. do other special functions like:
{#randomVal} #grab length

#This thing can output a default value if your variable isn't defined yet:
${undefinedVariable:-"your text here"}

#This prints everything at the start of the desired point:
echo ${randomVal:1}

#Another example: start 4 characters from the start, and grab 6 characters ahead:
echo ${randomVal:4:6}

#more examples can be found in Chapter 10

#Here's the syntax for defining functions:

function yay(){}

#or...

function yay{}

#insert external code through this command:
. /path/to/script

#This is an arithmetic expansion; theese act like "[" only it's dedicated to math, not files.

$(( $randomVar++ ))
$(( $randomVar *= $otherRandomVar ))

#The exact same thing can be done with $[], but it doesn't return whether or not the arithmetic worked or not; it returnes the value itself.

#if for some reason [ says "=: unary operator expected", it means you either don't have any input, or your input was empty!

