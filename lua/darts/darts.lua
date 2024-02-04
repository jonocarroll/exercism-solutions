local Darts = {}

function Darts.score(x, y)
  d = dist(x, y)
  if (d > 10) then return(0) end
  if (d > 5) then return(1) end
  if (d > 1) then return(5) end
  return(10)
end

function dist(x, y)
  return(math.sqrt(x^2 + y^2))
end

return Darts
