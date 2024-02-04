to_rna <- function(dna) {
  nucleotides <- strsplit(dna, "")[[1]]
  stopifnot(length(setdiff(nucleotides, c("C", "A", "T", "G"))) == 0)
  chartr("CATG", "GUAC", dna)
}

x <- "123text456"
regmatches(x, regexpr("[^0-9]+", x))
