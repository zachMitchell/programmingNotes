--I'm getting my favorite things from: http://love2d.org/wiki/love.graphics.setColor

--looking at this from time to time as well: http://sheepolution.com/learn/book/contents

--Each love program requires three different functions:

function love.load()
    --The initial loading of all variables
  end
  
  function love.update(dt)
    --for every frame, this function runs.
    --If you want to update your variables based on time, then you need a variable named dt.
    --[[
    dt is short for "delta time". its the fraction of time that love took to draw the previous frame (which adds up to one second)
    ]]
  end
  
  function love.draw()
    --this is where you draw your frame.
    --You can set the color of your shape before you draw it:
    love.graphics.setColor(r,g,b)
    
    --Then you can draw! (you have many choices too!)
    love.graphics.rectangle(width,height,x,y)
  end