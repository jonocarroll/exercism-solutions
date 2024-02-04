normalized_plaintext <- function(input) {
  txt <- gsub("[^[:alnum:]]*", "", input)
  txt <- gsub(" ", "", txt)
  tolower(txt)
}

plaintext_segments <- function(input) {
  input <- normalized_plaintext(input)
  l <- nchar(input)
  if (l == 0) return("")
  txt <- strsplit(input, "")[[1]]
  r <- floor(sqrt(l))
  c <- l %/% r
  if (c * r < l) {
    c <- c + 1
  }
  if (c * r > l) {
    txt[(l+1):(c * r)] <- ""
  }
  m <- matrix(txt, nrow = r, ncol = c, byrow = TRUE)
  apply(m, 1, paste0, collapse = "")
}

encoded <- function(input) {
  input <- normalized_plaintext(input)
  l <- nchar(input)
  if (l == 0) return("")
  txt <- strsplit(input, "")[[1]]
  r <- floor(sqrt(l))
  c <- l %/% r
  if (c * r < l) {
    c <- c + 1
  }
  if (c * r > l) {
    txt[(l+1):(c * r)] <- ""
  }
  m <- matrix(txt, nrow = r, ncol = c, byrow = TRUE)
  paste0(apply(m, 2, paste0, collapse = ""), collapse = "")
}

ciphertext <- function(input) {
  input <- normalized_plaintext(input)
  l <- nchar(input)
  if (l == 0) return("")
  txt <- strsplit(input, "")[[1]]
  r <- floor(sqrt(l))
  c <- l %/% r
  if (c * r < l) {
    c <- c + 1
  }
  if (c * r > l) {
    txt[(l+1):(c * r)] <- " "
  }
  m <- matrix(txt, nrow = r, ncol = c, byrow = TRUE)
  paste(apply(m, 2, paste0, collapse = ""), collapse = " ")
}
