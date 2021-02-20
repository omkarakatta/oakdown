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
