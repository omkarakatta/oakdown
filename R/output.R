### Meta -------------------------
###
### Title: {oakdown} output formats
###
### Description: Wrappers for bookdown::pdf_book
### See [Deriving from Built-in Formats](https://bookdown.org/yihui/rmarkdown/format-derive.html)
###
### Author: Omkar A. Katta
###

### pdf_output -------------------------
#' Convert RMD to PDF Output with {oakdown} templates
#'
#' @param format Name of {oakdown} template
#' @param keep_tex,keep_md,dev,citation_package,pandoc_args,md_extensions,...
#'  Arguments to be passed onto bookdown::pdf_book
#'
#' @export
pdf_output <- function(format = "note",
                       keep_tex = TRUE,
                       keep_md = TRUE,
                       dev = "cairo_pdf",
                       citation_package = "natbib",
                       pandoc_args = c("--listings"),
                       md_extensions = "-auto_identifiers",
                       FUN,
                       ...) {
  FUN(
    template = resources(format),
    keep_tex = keep_tex,
    keep_md = keep_md,
    dev = dev,
    citation_package = citation_package,
    pandoc_args = pandoc_args,
    md_extensions = md_extensions,
    ...
  )
}

### pdf_note -------------------------
#' Convert Rmd into a note
#'
#' @param ... Arguments to be passed to \code{\link{pdf_output}}
#'
#' @export
pdf_note <- function(...) {
  pdf_output(
    format = "note",
    pandoc_args = c("--listings",
                    "--shift-heading-level-by=-1"),
    FUN = bookdown::pdf_book,
    ...
  )
}

### beamer -------------------------
#' Convert Rmd into a beamer presentation
#'
#' @param pandoc_args Pandoc arguments to be passed to \code{\link{pdf_output}};
#'  defaults to "--listings"
#' @param slide_level Heading level defining individual slides; defaults to 2
#' @param ... Arguments to be passed to \code{\link{pdf_output}}
#'
#' @export
beamer <- function(pandoc_args = c("--listings"),
                   slide_level = 2,
                   ...) {
  pdf_output(
    format = "beamer",
    pandoc_args = pandoc_args,
    slide_level = slide_level,
    FUN = rmarkdown::beamer_presentation,
    ...
  )
}
