### Meta -------------------------
###
### Title: Utilities
###
### Description: Useful functions for development
###
### Author: Omkar A. Katta
###

### template_resources -------------------------
template_resources <- function(template, file = "template.tex") {
  fs::path_package(package = "oakdown", "rmarkdown", "templates", template, "resources", file)
}
