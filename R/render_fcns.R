### Meta ---------------------------
###
### Title: render_fcns.R
###
### Description: Wrap {bookdown} and {rmarkdown} functions w/ preferred options
###
### Author: Omkar A. Katta
###
###
### Notes:
###
###

### render_note ---------------------------

#~ TODO: Check for the existence of a local _bookdown.yml or _output.yml file;
#~    if there is no such file, then look for package defaults
#' Render Rmd to a PDF note
#'
#' @param input Input filename or directory, to be passed to
#'  \code{bookdown::render_book()}
#' @param config_file Book configuration file
#' @param clean Argument to be passed to \code{tinytex.clean} option;
#'  if FALSE (default), keep intermediary files
#' @param title_fcn Function to interpret header information in Rmd
#' @param ... Arguments to be passed to \code{bookdown::render_book}
#'
#' @return A PDF note with the name and directory as specified by
#'  \code{config_file}
#'
#' @export
render_note <- function(input = ".",
                        config_file = "note-bookdown.yml",
                        clean = FALSE,
                        title_fcn = cat_header_to_yaml,
                        ...) {

  # save intermediate files
  options(tinytex.clean = clean)

  # choose how we print the title
  oakdown_print_title <- title_fcn

  bookdown::render_book(
    input = input,
    config_file = config_file,
    ...
  )
}
