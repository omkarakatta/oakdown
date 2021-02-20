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

render_note <- function(input = ".",
                        config_file = "note-bookdown.yml",
                        output_yaml = "note-output.yml",
                        ...) {
  bookdown::render_book(
    input = input,
    config_file = config_file,
    output_yaml = output_yaml,
    ...
  )
}
