Flask
=====
[Documentation Link](http://flask.pocoo.org/docs/1.0/)
[Jinja Documentation](http://jinja.pocoo.org/docs/2.10/templates/)

Flask is a window between python and the apache server. With this, you can use the power of python to assist in making webpages!

## Setup
If you're on a system with limited permissions, you can setup a python "Virtual environment" to do your work in.
```bash
#If you don't have virtualenv installed:
pip install virtualenv

#run it in the directory you want:
virtualenv $yourDirectoryName
#Launch it; install flask after your inside:
cd $yourDirectoryName
source ./bin/activate
```

In bash, just set these variables to edit live changes, and specify where the root page should load:
```bash
export FLASK_ENV=development
export FLASK_APP=yourProgram.py

#Just run this to launch the server:
python -m flask run
```
## Usage
* for every path you want the root to render, you can initialize it, and in turn, it can use the path as part of any arguments for your functions:

```python
@app.route('/') #This is default
@app.route('/<varHere>')#This is a value that can be used in function arguemnts
```

 * These routes can be defined as specific variables:
```python
@app.route("/varType:varName")
```

* There are some cases where you need to have static files (since flask can dynamically change the url). You can do this via:
```python
url_for('static', filename='fileHere.blah') #I'm guessing this just returns this as a string
```
**This will allow you to access those files in `/static/`**

* To render an html file,you need this thingy: `render_template('yourHtmlHere',randomValue=someOtherValue,Anothervalue="hoohaa",etc="etc..")`
    * This will look at the templates folder in the current directory to find the respective html. It also sends any python values back with it.
* accessing the above requires a little something called *jinja*; some templating language made by the same fellow:
```html
<p>yaaaaay {{randomValue}}</p>
<!--arrays can be accessed like you would expect...-->
<p>{{randomValue[0]}}</p>
```

## Form data
When getting form data, you need to tell the page that forms can be used:
```python
@app.route('/', methods=['POST','GET']) #either method can be left out if one isn't neeeded.
```

There are two types of methods you need to retrieve form data from get and post:
```python
#post:
request.form['valueHere']
#get:
request.args.get('valueHere')
```

* You can also retrieve files through the `request.files` object. In order to submit files to a server, you need `enctype="multipart/form-data"` in the form. The filenames can be read through the fileObject.filename value. (see [Here](http://werkzeug.pocoo.org/docs/0.14/datastructures/#werkzeug.datastructures.FileStorage) for more info.)

* redirecting is also possible through the following synatx:
```py
return redirect("./url/here")
```

## JSON Files
You can make use of JSON through a collection of utilities from both jinja and flask. See [The Documentation](http://flask.pocoo.org/docs/1.0/api/#module-flask.json)

Flask relies on a couple of json converters, so it created it's own import statement:
```python
from flask import json
```

To insert json-safe code into jinja, you would write:
```html
<script>var myAwesomeJson = {{jsonVal|tojson|safe}}</script>
```