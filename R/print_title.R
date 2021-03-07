### Meta ---------------------------
###
### Title: print_title.R
###
### Description: Print the title of the document based on the format
###
### Author: Omkar A. Katta
###
### Notes:
###   Single-document => title belongs in \title{...}
###   Multi-document => title belongs in \chapter{...}
###   Currently, only the single-document note is supported
###

### print_title ---------------------------

#' Print header of document
#'
#' Print the header conditional on the format
#'
#' Different formats require different ways to print the header of the document.
#' Right now, only the single-document note format is supported.
#'
#' @param title Title of document
#' @param subtitle Subtitle of document
#' @param other Other header information
#' @param date Date of document; defaults to date of last render
#' @param author Author of document; defaults to "Omkar A. Katta"
#' @param id Unique label/identifier of the document; useful for multi-document
#'  formats
#'
#' @return Either a yaml header with the pertinent information to be used
#'  by pandoc template or a series of TeX commands
#'
#' @export
print_title <- function(title,
                        subtitle = "FALSE",
                        other = "FALSE",
                        date = format(Sys.Date(), "%B %d, %Y"),
                        author = "Omkar A. Katta",
                        id) {
  cat("---")
  cat("\n")
  cat(paste("title:", title))
  cat("\n")
  cat(paste("subtitle:", subtitle))
  cat("\n")
  cat(paste("other:", other))
  cat("\n")
  cat(paste("date:", date))
  cat("\n")
  cat("author:")
  cat("\n")
  for (a in author) {
    cat(paste("  -", a))
    cat("\n")
  }
  cat("---")
}

