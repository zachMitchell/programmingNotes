SqlAlchemy
==========
[(Documentation)](https://docs.sqlalchemy.org/en/latest/core/tutorial.html)
Sql Alchemy is a python api that makes it easier to handle database values prorgramatically, so much so that it almost looks exactly the same as python itself!

It doesn't have to be that way however, and can act like a regular thin-clinet to a database if one chooses. It has support for many different sql servers, including mySQL, Oracle, and SQLlite.

## Setup
You will need a few things before starting:
```py
import sqlalchemy
from sqlalchemy import createEngine,Table,Column,Integer,String,MetaData,ForeignKey
```

### Database
To setup a database, you need to setup your metadata, it's address, and the object you will be referencing.
```py
engine = create_engine('sqlite:///:memory:', echo=True) #Where echo just prints out the associated sql commands.
metadata = MetaData() #This is the middleman to help connect the engine with the table obejcts down the road.
```

## Creating Tables
When making tables, it is represented programatically:
```py
myAwesomeTable = Table('nameOfTable',metadata,
Column('myAwesomeVal',Integer),
Column('anotherCoolVal',String))
);

#When you're done, just  tell the engine run the equivelent sql statements:
metadata.create_all(engine)
```
## Executing statements

If you wish to insert something into the database, you can do it with the table you wish to interact with:
```py
myAwesomeTable.insert().values(myAwesomeVal=1234,anotherCoolVal="yoyoyo")
```
* If you run `myAwesomeTable.insert()` alone, it returns a string with the insert statement that will be used.
To execute your command, you first connect to the engine, and then run the sql:
```py
connectionOfBlah = engine.connect()
connectionOfBlah.execute(myAwesomeTable.insert()) #Just now dawned on me that it's executing that returned sql statement...
```

Executing statements can also be done through the connection's execute function. Instead of defining the values before execution, the `execute()` statement takes another parameter:
```py
connectionOfBlah.execute(myAwesomeTable.insert(),myAwesomeVal=4321,anotherCoolVal="hihihihi") 
```
Multiple values can be used at once as well, see [The documentation](https://docs.sqlalchemy.org/en/latest/core/tutorial.html#executing-multiple-statements) for syntax.

### Select
To use select you need to `import select`. This element is independant of table object, so it runs on it's own:
```py
result = conn.execute(select([myAwesomeTable])) #contains a set of rows that can be indexed, or called via dictionary.

row = result.fetchone() #Gives an indexable row. This can be accessed through:
row['myAwesomeVal'] #or...
row[0]
```

If you arn't interested in looking at the rest of the results, you should close the db by: `result.close()`

