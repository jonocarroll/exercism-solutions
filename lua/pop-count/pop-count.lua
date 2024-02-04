local PopCount = {}

function PopCount.egg_count(number)
  local bits = 0
  while number > 0 do
    bits = bits + (number % 2)
    number = number >> 1
  end
  return bits
end

return PopCount
