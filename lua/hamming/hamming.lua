local Hamming = {}

function Hamming.compute(a,b)
  local d = 0
  if (not (#a == #b)) then return(-1) end
  for i = 1, #a do
    if (not(string.sub(a, i, i) == string.sub(b, i, i))) then
      d = d + 1
    end
  end
  return(d)
end

return Hamming
