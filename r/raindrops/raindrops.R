raindrops <- function(number) {
  # - has 3 as a factor, add 'Pling' to the result.
  # - has 5 as a factor, add 'Plang' to the result.
  # - has 7 as a factor, add 'Plong' to the result.
  # - _does not_ have any of 3, 5, or 7 as a factor, the result should be the digits of the number.
  res <- ""
  if (number %% 3 == 0) res <- paste0(res, "Pling")
  if (number %% 5 == 0) res <- paste0(res, "Plang")
  if (number %% 7 == 0) res <- paste0(res, "Plong")
  if (res == "") return(as.character(number))
  res
}
