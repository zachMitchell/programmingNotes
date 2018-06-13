//misc:

//you can define multiple variables at once

int hi=1, there, my name=3, is, variable;

//defining booleans requires:
bool name=true;

//so it turns out, when you define an array, the array gets the next 4 sequential spaces in ram to use, so basically...
int array[3]
cout<<array//just


//structures:
//These are like objects, but without public and private values
struct hi{
  int bleh=1;
}

hi fred; //<-- where hi is the definition

//pointers:

//c++ pointer definition:
int num=0;
int *pointer = &num //where * tells it's a pointer, and '&' means "address of"
  
//printing stuff:
cout<<pointer<<endl<<*pointer //"pointer" prints the address it is pointing to. "*pointer" says "what is the actual value inside the address i'm pointing to?"

//when printing a pointer without *, you are getting &num (address of num), therefore, * means "value of".
//references are the opposite of pointers:
int &bleh = num //where & still means "address of", it still looks at the address of a value, but you as the programmer can't see the address of the "bleh" itself

//grabbing something directly from ram:
int *hi = new int;

//stop using whats in that ram slot:
delete hi;//note that this doesn't make the computer forget the variable, it just freed up that location in memory for others to use.


//linked lists

//syntax for inheritance:

class hi
{
public: virtual int function();//this is a function that can be overridden by an inherited object
virtual char otherFunct()=0;// if you do this, the inherited object MUST make its own version of that function
}

//templates

//in c++, generics is called templates. to make one, you need:
template<typename bleh> //where bleh is the name of your type

bleh function();//can return anything with the bleh type, and can do calculations with bleh, as long as bleh is a number


//syntax for inserting arguments: (jumping into c++ pg. 424)
int main(int argc, char *argv[]) {} //these must be named correctly; naming one "fred" won't work.

//argv is not an ordinary string array; it's in a format that can't use comparisons. to compare, you need to use the c++ function "strcmp"

strcmp(argv[1],"string2Compare");

//The arguments can also be directly be converted to string format; just keep resources in mind when doing this though :)
//(https://stackoverflow.com/questions/3648620/c-command-line-argument-comparison)