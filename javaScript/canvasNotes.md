## Defining a canvas
To really make use of a canvas, you need to associate it with an id:

```html
<canvas id="asdf" width="200" height="200"></canvas>
```

## Javscript side...

```js
//Start by getting the "context" of a canvas object (see html tab)
var context = asdf.getContext("2d"); //This is what you will be using to draw on asdf

//There are allot of settings you can toggle in a canvas object, for one, this changes the color of the next thing you draw:
context.fillStyle = "#FF0000"; //Considering this is a hex color, it could probably accept html defined colors as well.

//This draws a rectangle; the first two operators are x (l/r) and y (u/d), and the other two are the size in pixels [?]
context.fillRect(0,0,200,200);
//You can stretch and skew the next object you draw by using this:
context.setTransform(1,0,0,1,0,0);
//The values between the two 1's are for skewing; skewing values are adjusted based on the width and height of the object. (e.g something with a width of 10 will skew to 20 if it's set to 1 (100% more)

//To transform on top of existing transformation values, use:
context.transform(w,h,sw,sh,xw,xh);

//making lines:

//specify the coords you want to go to: (You shouldn't have to do this if a stroke already ran)
context.moveTo(x,y);
//your stroke will go this-away:
context.lineTo(x,y);
//move the line!
context.stroke();

//You can also draw a circle: (see: https://www.w3schools.com/graphics/canvas_coordinates.asp)
context.beginPath();
context.arc(x,y,size,0,2*Math.PI);
context.stroke()

//You can get the actual pixels in a canvas if you create an ImageData object
var newData = context.getData(x,y,width,height);
//You can insert imageData back by:
context.putImageData(newData,x,y)

//This lets you create new image data:
var newData = context.createImageData();

//you can export a canvas image by turning into an actual link:
asdf.toDataURL();
```