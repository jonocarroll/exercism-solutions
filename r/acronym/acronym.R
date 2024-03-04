acronym <- function(input) {
    splits <- gsub("-", " ", input)
    just_letters <- gsub("[^[:alpha:] ]", "", splits)
    words <- strsplit(just_letters, " |-")[[1]]
    toupper(paste0(gsub("(.).*", "\\1", words), collapse = ""))
}
