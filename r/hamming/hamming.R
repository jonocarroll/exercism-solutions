# This is a stub function to take two strings
# and calculate the hamming distance
hamming <- function(strand1, strand2) {
  stopifnot(nchar(strand1) == nchar(strand2))
  s1 <- strsplit(strand1, "")[[1]]
  s2 <- strsplit(strand2, "")[[1]]
  sum(s1 != s2)
}
