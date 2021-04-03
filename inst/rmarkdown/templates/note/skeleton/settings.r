### {knitr} Options ---------------------------

knitr::opts_chunk$set(cache = FALSE,
                      collapse = TRUE,
                      tidy = 'styler')

### Chunk Font Size ---------------------------

knitr::knit_hooks$set(mysize = function(before, options, envir) {
  if (before) {
    return(options$size)
  } else {
    return("\\normalsize")
  }
})
knitr::opts_chunk$set(mysize = TRUE, size = "\\footnotesize")
