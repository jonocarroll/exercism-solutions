
proc reverse*(s: string): string =
  var res = ""
  let l = len(s)
  if l == 0: return res
  for i in countdown(l-1,0):
      res = res & $s[i]
  return res

#[
for c in s:
    result = c & result
]#