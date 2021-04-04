### {knitr} Options ---------------------------

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  cache = FALSE,
  tidy = 'styler'
)

### Chunk Font Size ---------------------------

knitr::knit_hooks$set(mysize = function(before, options, envir) {
  if (before) {
    return(options$size)
  } else {
    return("\\normalsize")
  }
})
knitr::opts_chunk$set(mysize = TRUE, size = "\\footnotesize")
