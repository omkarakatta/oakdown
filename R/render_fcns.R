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
