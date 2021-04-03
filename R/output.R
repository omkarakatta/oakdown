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
#' @param template Name of {oakdown} template
#' @param keep_tex,keep_md,dev,citation_package,pandoc_args,md_extensions,...
#'  Arguments to be passed onto bookdown::pdf_book
#'
#' @export
pdf_output <- function(template = "note",
                       keep_tex = TRUE,
                       keep_md = TRUE,
                       dev = "cairo_pdf",
                       citation_package = "natbib",
                       pandoc_args = "--listings",
                       md_extensions = "-auto_identifiers",
                       ...) {
  bookdown::pdf_book(
    template = resource_path(template),
    keep_tex = keep_tex,
    keep_md = keep_md,
    dev = dev,
    citation_package = citation_package,
    pandoc_args = pandoc_args,
    md_extensions = md_extensions,
    ...
  )
}
