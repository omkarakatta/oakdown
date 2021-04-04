### Meta -------------------------
###
### Title: Initialize a template
###
### Description: Start a new document / directory using {oakdown} templates
###
### Author: Omkar A. Katta
###

### init -------------------------
# TODO: create a new directory or specify a path to create the new template

#' Initialize {oakdown} template in current directory
#'
#' Create files from {oakdown} template
#'
#' If \code{use_gitignore} is TRUE, this function creates a .gitignore
#' if one does not already exist in the current directory.
#' This function is a wrapper for \code{rmarkdown::draft()}.
#'
#' @param template Name of {oakdown} template; defaults to "note"
#' @param name Name of Rmd file; defaults to \code{template}
#' @param use_gitignore If TRUE (default), create .gitignore if one does not
#'  already exist.
#' @param overwrite_gitignore If \code{use_gitignore} is TRUE and .gitignore
#'  exists, overwrite the current .gitignore with the {oakdown} .gitignore
#'
#' @export
init <- function(template = "note",
                 name = template,
                 use_gitignore = TRUE,
                 overwrite_gitignore = FALSE) {
  if (use_gitignore) {
    if (fs::file_exists(".gitignore") & !overwrite_gitignore) {
      message(".gitignore exists in current directory")
    } else {
      fs::file_copy(
        fs::path_package(package = "oakdown", "resources", ".gitignore"),
        ".",
        overwrite = overwrite_gitignore
      )
      message("Creating .gitignore")
    }
  }
  rmarkdown::draft(file = name, template = template, package = "oakdown")
}

### init_note -------------------------
#' Initialize note template
#'
#' @param name Name of Rmd file; defaults to \code{template}
#' @param use_gitignore If TRUE (default), create .gitignore if one does not
#'  already exist.
#' @param overwrite_gitignore If \code{use_gitignore} is TRUE and .gitignore
#'  exists, overwrite the current .gitignore with the {oakdown} .gitignore
#'
#' @export
#'
#' @seealso \code{\link{init}}
init_note <- function(name, use_gitignore = TRUE, overwrite_gitignore = FALSE) {
  init(template = "note",
       name = name,
       use_gitignore = use_gitignore,
       overwrite_gitignore = overwrite_gitignore)
}
