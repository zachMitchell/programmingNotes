React-JS
========

React js is a new way of rendering text on a page.
The official website says it's designed to make developing applications easier.

It's designed to run from a compiler called "Babel". Because of this, it needs nodejs to be installed.

## Outputting text
everytime you want to use reactjs, you need to specify where you would like to render:
```html
<div id="randomElement">
	<!--React stuff goes here.-->
</div>

<script type="text/babel">
ReactDOM.render(thingamajig,document.getElementById("randomElement"));
//The element itself is called the "root" element.
</script>
```
since babel is needed to compile the JSX, you can't change anything after it's been created.

### ReactDOM
One interesting thing about reactjs is that is has it's own DOM. According to the website, it uses less recourses to make vs a regular HTML DOM element. See: [here](https://reactjs.org/docs/rendering-elements.html#rendering-an-element-into-the-dom)

## Javascript thingamajigs
* the **let** keyword replaces **var** inside a scope other than gloabal. In other words: let only defines a variable only for that scope and removes it when going back to global.
* Whenever you see reactjs use *class*; it's just syntactic sugar to the regular way of creating classes through functions
* The arrow shortcut doesn't need brackets if there's only one statement inside:
```js
()=>console.log("asdf"); //This wouldn't make any sense to use this :P
```

## JSX
This is a syntax that seems to fuse javascript and html into one product...
```js
var str = "asdf"
var thingamajig = <p>{str}</p>;
```
With jsx, you can create tag-like structures that act just like functions; just be sure to capitalize them...
```js
function Letag(props){
	return <h1> HELLO MR. {props.name} </h1>
}

//Props are the arguments of your function which become the "option" equivelent in your shiny new tag.
ReactDOM.render(<p>yaaaay; random html</p> <Letag name="Fred"/>,yourDomElementHere);
```

## misc...
* A react componenet can have it's state changed on the fly:
```js
class whatever extends React.Component{
	constructor(props){
		super(props);
		this.state = {
		style:"color:red",
		id:"HELLOOOO"
		}
	}
}
```