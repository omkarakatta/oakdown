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
#'  if TRUE (default), delete intermediaries, e.g., *.aux, *.toc, etc.
#' @param clean_bookdown Argument to be passed to bookdown configuration;
#'  vector of files to be removed
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
                        clean = TRUE,
                        clean_bookdown = "",
                        title_fcn = cat_header_to_yaml,
                        ...) {

  check_if_newlines_fence <- function(fence, x, direction) {
    remove_top <- c()
    remove_bottom <- c()
    if (length(fence)) {
      if (direction %in% c("top", "both")) is_top_blank <- grepl("^\\s*$", x[fence - 1])
      if (direction %in% c("top", "both")) remove_top <- fence[is_top_blank] - 1
      if (direction %in% c("bottom", "both")) is_bottom_blank <- grepl("^\\s*$", x[fence + 1])
      if (direction %in% c("bottom", "both")) remove_bottom <- fence[is_bottom_blank] + 1
    }
    x[-c(remove_top, remove_bottom)]
  }
  fix_envs <- function(x) {
    beg_reg <- '^\\s*\\\\begin\\{.*\\}'
    end_reg <- '^\\s*\\\\end\\{.*\\}'

    top_fence <- grep(beg_reg, x)
    x <- check_if_newlines_fence(top_fence, x, direction = "both")
    bottom_fence <- grep(end_reg, x)
    x <- check_if_newlines_fence(bottom_fence, x, direction = "both")
    x
  }

  withr::local_options(
    list(tinytex.clean = clean, # save intermediate files
         bookdown.post.latex = function(x) {x <- fix_envs(x)}) # remove empty lines between environments
  )

  # choose how we print the title
  oakdown_print_title <- title_fcn

  # generate bookdown configuration
  config_file_exists <- fs::file_exists(config_file)
  if (!config_file_exists) {
    config <- list(
      input = input,
      output = output,
      output_dir = output_dir,
      pre_script = pre_script,
      clean_bookdown = clean_bookdown
    )
    bookdown_template <- readLines(resources("note", "_bookdown.yml"))
    bookdown_config <- whisker::whisker.render(bookdown_template, data = config)
    config <- strsplit(bookdown_config, "\n")[[1]]
    writeLines(config, con = config_file)
    message("Generated bookdown configuration")
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

### render_beamer ---------------------------

# TODO: Extract bookdown generation into a separate function

#' Render Rmd to a Beamer presentation
#'
#' @param input Input Rmd, to be passed to
#'  \code{bookdown::render_book()}
#' @param ext Extension of input; defaults to "rmd"
#' @param output Name of the output PDF; defaults to "rendered_\code{input}"
#' @param output_dir Name of output directory
#' @param pre_script Name of R script to run before rendering
#' @param clean Argument to be passed to \code{tinytex.clean} option;
#'  if TRUE (default), delete intermediaries, e.g., *.aux, *.toc, etc.
#' @param ... Arguments to be passed to \code{rmarkdown::render}
#'
#' @return A PDF beamer presentation
#'
#' @export
render_beamer <- function(input = "beamer",
                          ext = "rmd",
                          output = paste0("rendered_", input),
                          output_dir = "_render",
                          pre_script = resources("all", "settings.r"),
                          clean = TRUE,
                          ...) {

  check_if_newlines_fence <- function(fence, x, direction) {
    remove_top <- c()
    remove_bottom <- c()
    if (length(fence)) {
      if (direction %in% c("top", "both")) is_top_blank <- grepl("^\\s*$", x[fence - 1])
      if (direction %in% c("top", "both")) remove_top <- fence[is_top_blank] - 1
      if (direction %in% c("bottom", "both")) is_bottom_blank <- grepl("^\\s*$", x[fence + 1])
      if (direction %in% c("bottom", "both")) remove_bottom <- fence[is_bottom_blank] + 1
    }
    x[-c(remove_top, remove_bottom)]
  }
  fix_envs <- function(x) {
    beg_reg <- '^\\s*\\\\begin\\{.*\\}'
    end_reg <- '^\\s*\\\\end\\{.*\\}'

    top_fence <- grep(beg_reg, x)
    x <- check_if_newlines_fence(top_fence, x, direction = "both")
    bottom_fence <- grep(end_reg, x)
    x <- check_if_newlines_fence(bottom_fence, x, direction = "both")
    x
  }

  withr::local_options(
    list(tinytex.clean = clean, # save intermediate files
         bookdown.post.latex = function(x) {x <- fix_envs(x)}) # remove empty lines between environments
  )

  # source pre_script
  source(pre_script)

  # render PDF
  rmarkdown::render(
    input = paste0(input, ".", ext),
    output_dir = output_dir,
    output_file = output,
    ...
  )
}
