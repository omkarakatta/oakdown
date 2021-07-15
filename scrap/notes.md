# Wishlist

- I would like the following formats (these are all PDF, but in the future, I'd like to learn how to create HTML and interactive versions):
  - note: single-document, go-to format
  - report: multi-document, looks very similar to a note
  - book: multi-document, operates like a report but looks and feels like a book
  - beamer: single-document presentation format [WIP]
- Incorporate {cli}
- Describe the coding philosophy and structure in README
- Abstract components to reduce redundancy in `R/render_fcns.R`

## Jot

- Use `summary` from YAML to print summary of jot
- Reduce top margin
- Have font size of header be same as font size of document

# Issues

- `natbib` is not working when `bibliography` or `bibliography-other` is specified [beamer]
- document the code in inst/rmarkdown/templates/beamer/resources/pandoc.tex

# Incorporating {oakdown} with my pandoc and tex

- There may be external files, e.g., pandoc templates, `.sty` files, or `.bib` files that I would like to have access to.
- The best way to access these files is to store them in directories that are already being search by pandoc and latex.
- I prefer to use symlink these files to the relevant directories so I can store these files in my [dotfiles](https://github.com/omkarakatta/dotfiles) repository
- TeX searching
  - Store or symlink bib files in `~/Library/texmf/bibtex/bst/misc`
  - Store or symlink bst files in `~/Library/texmf/bibtex/bst/misc`
  - Store input tex files in `~/Library/texmf/tex/latex/misc`
  - See:
    - [TeX Directory Structure](http://tug.org/tds/tds.html#Local-additions)
    - [SE post about storing .sty and .cls files](https://tex.stackexchange.com/questions/1137/where-do-i-place-my-own-sty-or-cls-files-to-make-them-available-to-all-my-te)
- Pandoc 
  - Store pandoc templates in `~/.pandoc/templates`.
    - Note that as of commit f86ca8e, I moved the `note.tex` pandoc template into `inst/rmarkdown/templates/note/resources/template.tex` to make the pandoc templates available via {oakdown}
  - [Github Issue comment by @yasirs](https://github.com/rstudio/bookdown/issues/362#issuecomment-286327374)
