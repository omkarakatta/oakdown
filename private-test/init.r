### Meta ---------------------------
###
### Title: init.r
###
### Description: {bookdown} will run this script before each chapter; see
###   before_chapter_script in _bookdown.yml
### Author: Omkar A. Katta
###
### Notes:
###
###

### {knitr} Options ---------------------------

knitr::opts_chunk$set(cache = FALSE,
                      collapse = TRUE,
                      tidy = 'styler')

### {tinytex} Options ---------------------------

options(tinytex.clean = FALSE) #~ save intermediate files

### Chunk Font Size ---------------------------

knitr::knit_hooks$set(mysize = function(before, options, envir) {
  if (before) {
    return(options$size)
  } else {
    return("\\normalsize")
  }
})
knitr::opts_chunk$set(mysize = TRUE, size = "\\footnotesize")

### Title ---------------------------

print_title <- function(title,
                        subtitle,
                        other,
                        date = format(Sys.Date(), "%B %d, %Y"),
                        author = "Omkar A. Katta",
                        id) {
  cat("---")
  cat("\n")
  cat(paste("title:", title))
  cat("\n")
  cat(paste("subtitle:", subtitle))
  cat("\n")
  cat(paste("other:", other))
  cat("\n")
  cat(paste("date:", date))
  cat("\n")
  cat("author:")
  cat("\n")
  for (a in author) {
    cat(paste("  -", a))
    cat("\n")
  }
  cat("---")
}
