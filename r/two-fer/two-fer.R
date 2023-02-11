two_fer <- function(input) {
    name <- ifelse(missing(input), "you", input)
    paste0("One for ", name, ", one for me.") 
}
