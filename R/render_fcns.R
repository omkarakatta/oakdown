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

# TODO: post_script
# TODO: Extract bookdown generation into a separate function

#' Render Rmd to a PDF note
#'
#' This function sets options, generates a bookdown configuration file,
#' and wraps \code{bookdown::pdf_book}.
#' Note that in the bookdown configuration process, this function, by default,
#' specifies the R script to run before the "chapter", which in our case is
#' is the note.
#'
#' @param input Input Rmd, to be passed to
#'  \code{bookdown::render_book()}
#' @param output Name of the output PDF; defaults to "rendered_\code{input}"
#' @param output_dir Name of output directory
#' @param pre_script Name of R script to run before rendering
#' @param config_file Book configuration file; if file does not exist, then
#'  create it
#' @param save_config_file Save generated book configuration file
#' @param clean Argument to be passed to \code{tinytex.clean} option;
#'  if FALSE (default), keep intermediary files
#' @param title_fcn Function to interpret header information in Rmd
#' @param ... Arguments to be passed to \code{bookdown::render_book}
#'
#' @return A PDF note with the name and directory as specified by
#'  \code{config_file}
#'
#' @export
render_note <- function(input = "note",
                        output = paste0("rendered_", input),
                        output_dir = "_render",
                        pre_script = resources("all", "settings.r"),
                        config_file = "note-bookdown.yml",
                        save_config_file = FALSE,
                        clean = FALSE,
                        title_fcn = cat_header_to_yaml,
                        ...) {

  # save intermediate files
  options(tinytex.clean = clean)

  # choose how we print the title
  oakdown_print_title <- title_fcn

  # generate bookdown configuration
  config_file_exists <- fs::file_exists(config_file)
  if (!config_file_exists) {
    config <- list(
      input = input,
      output = output,
      output_dir = output_dir,
      pre_script = pre_script
    )
    bookdown_template <- readLines(resources("note", "_bookdown.yml"))
    bookdown_config <- whisker::whisker.render(bookdown_template, data = config)
    config <- strsplit(bookdown_config, "\n")[[1]]
    writeLines(config, con = config_file)
    message("Generaged bookdown configuration")
  }

  # render PDF
  bookdown::render_book(
    input = input,
    config_file = config_file,
    ...
  )

  # delete generated bookdown config file
  if (!config_file_exists & !save_config_file) {
    fs::file_delete(config_file)
    message("Deleted bookdown configuration")
  }
}
