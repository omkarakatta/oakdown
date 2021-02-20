
<!-- README.md is generated from README.Rmd. Please edit that file -->

# oakdown

<!-- badges: start -->
<!-- badges: end -->

The goal of {oakdown} is to store and create single-document and
multi-document templates that are so compatible that it is easy to
switch between these templates.

## Installation

You can install oakdown from
[github](https://github.com/omkarakatta/oakdown) with:

    install.packages("oakdown")

## Example

This is a basic example which shows you how to solve a common problem:

    library(oakdown)
    ## basic example code

## NOTES

-   See [dotfiles](https://github.com/omkarakatta/dotfiles)
    -   Store pandoc templates in `~/.pandoc/templates`
    -   Store/symlink bib files in `~/Library/texmf/bibtex/bib/misc`
    -   Store/symlink bst files in `~/Library/texmf/bibtex/bst/misc`
    -   Store input tex files in `~/Library/texmf/tex/latex/misc`
    -   See:
        -   [TeX Directory
            Structure](http://tug.org/tds/tds.html#Local-additions)
        -   [SE post about storing .sty and .cls
            files](https://tex.stackexchange.com/questions/1137/where-do-i-place-my-own-sty-or-cls-files-to-make-them-available-to-all-my-te)
        -   \[Github Issue comment by
            @yasirs\](<a href="https://github.com/rstudio/bookdown/issues/362#issuecomment-286327374" class="uri">https://github.com/rstudio/bookdown/issues/362#issuecomment-286327374</a>)
-   I would like the following formats (these are all PDF, but in the
    future, I’d like to learn how to create HTML and interactive
    versions):
    -   note: single-document, go-to format
    -   report: multi-document, looks very similar to a note
    -   book: multi-document, operates like a report but looks and feels
        like a book
    -   beamer: single-document presentation format
