return function(s)
  local seen = {}
  s = string.gsub(string.lower(s), "[^a-z]", "")
  for i = 1, #s do
    char = string.sub(s, i, i)
    if (seen[char]) then
      return false
    else
      seen[char] = true
    end
  end
  return true
end
