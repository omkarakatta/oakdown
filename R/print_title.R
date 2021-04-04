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

### cat_header_to_yaml ---------------------------

#' Concatenate and print header info as YAML parameter
#'
#' Single-document formats use this function to record the header as YAML
#' paramaters.
#'
#' Multi-document formats require the title of the Rmd file as a heading,
#' not as a title. But single-document formats require the title of the Rmd
#' to be the title of the document. Hence, this function will \code{cat} the
#' header information as YAML parameters.
#'
#' @param title Title of document
#' @param subtitle Subtitle of document
#' @param other Other header information
#' @param date Date of document; defaults to date of last render
#' @param author Author of document; defaults to "Omkar A. Katta"
#' @param id Unique label/identifier of the document; useful for multi-document
#'  formats
#'
#' @return YAML header with the pertinent information to be used
#'  by pandoc template
#'
#' @export
cat_header_to_yaml <- function(title,
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

