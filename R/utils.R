### Meta -------------------------
###
### Title: Utilities
###
### Description: Useful functions for development
###
### Author: Omkar A. Katta
###

### resource_path -------------------------
resource_path <- function(template, file = "template.tex") {
  fs::path_package(package = "oakdown", "rmarkdown", "templates", template, "resources", file)
}