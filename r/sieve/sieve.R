
sieve <- function(limit) {
  if (limit == 1) return(NULL)
  s <- vector(length = limit)
  for (i in 2:limit) {
    s[i] = length(grep(r"(^.?$|^(..+?)\1+$)", strrep('!', i))) == 0
  }
  which(s)
}
