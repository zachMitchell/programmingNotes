--to have object-oriented properties work within object-functions, you need to describe the object you wish to insert your values in.

randomobject.function =  function(self,randomParameters)
    self.asdf= "hi"
  end

otherrandomobject.function(otherrandomobject,1234)

--you can use some syntactic sugar to refer to the object the function is in:
function leObject:randomFunction()
  end --the colon represents the "self" variable, which is your object.

--if you use the colon while calling your object-oriented function, the first parameter will be filled in as the object you inserted.
--by default, tables will be referenced to, not copied!
