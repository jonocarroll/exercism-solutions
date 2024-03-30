
sieve <- function(limit) {
  if (limit == 1) return(NULL)
  s <- vector(length = limit)
  s[2:limit] <- TRUE
  for (i in 2:limit) {
    if (!s[i] || 2*i > limit) next
      s[seq(2*i, limit, i)] <- FALSE
  }
  which(s)
}
