
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

### Note

The `note` format puts the spotlight on a single Rmd file, making this
ideal for note-taking. To begin, navigate to the directory where you
want to store the note. Then, initialize the note as follows:

    library(oakdown)
    init_note("<name>")

This produces is an Rmd file called `<name>.Rmd` as well as a .gitignore
if one does not already exist in that directory. Pay careful attention
to the default YAML frontmatter provided in `<name>.Rmd`. For **my**
convenience, I have included `main.bib`, `econometrica.bst`, and
`oaktex.sty` as part of the frontmatter. These are stored on my local
computer and have little to do with {oakdown}. Hence, change or remove
these YAML parameters if you don’t have these files yourself.

After editing the contents of `<name>.Rmd`, you can render the Rmd file
by calling:

    render_note("<name>", config_file = "<config.yml>")

In the background, this function generates a bookdown configuration file
called `<config.yml>` if this file does not already exist in the
directory. The bookdown configuration file will be removed after the
rendering is complete, unless you want to save the file by specifying
`save_config_file = TRUE` as an argument to `render_note()`.

During the rendering process, this function decides how to print the
title of the note. In the `note` format, the title will be passed to the
YAML frontmatter. In other formats, the title may be passed as a section
header while the title in the YAML frontmatter is specified elsewhere.

## NOTES

-   See [dotfiles](https://github.com/omkarakatta/dotfiles)
    -   Store pandoc templates in `~/.pandoc/templates`.
        -   Note that as of commit f86ca8e, I moved the `note.tex`
            pandoc template into
            `inst/rmarkdown/templates/note/resources/template.tex` to
            make the pandoc templates available via {oakdown}
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
