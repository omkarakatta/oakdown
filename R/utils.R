### Meta -------------------------
###
### Title: Utilities
###
### Description: Useful functions for development
###
### Author: Omkar A. Katta
###

### template_resources -------------------------
#' Find resources within {oakdown} template
#'
#' @param template Name of template
#' @param file Name of file in \code{subdir} directory of \code{template}
#' @param subdir Name of subdirectory in \code{template}
#'
#' @return File path of \code{file} located in {oakdown}'s
#'  \code{template} directory
#'
#' @export
template_resources <- function(template,
                               file = "pandoc.tex",
                               subdir = "resources") {
  fs::path_package(package = "oakdown",
                   "rmarkdown",
                   "templates",
                   template,
                   subdir,
                   file)
}
