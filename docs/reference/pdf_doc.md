# Convert to simple PDF/LaTeX document in English (en)

This function serves as wrapper to
[`pdf_document`](https://pkgs.rstudio.com/rmarkdown/reference/pdf_document.html),
with a custom Pandoc LaTeX template and different default values for
other arguments (e.g., `keep_tex = TRUE`). This function as well as its
helper function are based on the
[rticles](https://github.com/rstudio/rticles) package that provides
templates for various journal articles. The Pandoc LaTeX template and
report layout are inspired by INWTlab's
[ireports](https://github.com/INWTlab/ireports) package.

## Usage

``` r
pdf_doc(
  number_sections = TRUE,
  highlight = "kate",
  font = "Helvetica",
  citation_package = "natbib",
  latex_engine = "xelatex",
  ...
)

# Deprecated: use pdf_doc() instead
```

## Arguments

- number_sections:

  logical; `TRUE` to number section headings.

- highlight:

  character; syntax highlighting style. Supported styles include
  "default", "tango", "pygments", "kate" (default here), "monochrome",
  "espresso", "zenburn", and "haddock". Pass `NULL` to prevent syntax
  highlighting.

- font:

  character; default font is "Helvetica"; for members of the UHH there
  is also the font "TheSansUHH" available. If you want to use another
  font, simply use the setting "other" and replace the .ttf files for
  regular, italic, bold, and bold-italic font with your own files
  (should be named EXACTLY as the template font files).

- citation_package:

  character; the LaTeX package to process "citations", "natbib"
  (default) or "biblatex". Use "none" if neither package is to be used.

- latex_engine:

  character; LaTeX engine for producing PDF output. Options are
  "pdflatex", "lualatex", and "xelatex" (default).

- ...:

  Further arguments passed to
  [`pdf_document`](https://pkgs.rstudio.com/rmarkdown/reference/pdf_document.html).

## Value

R Markdown output format to pass to
[`render`](https://pkgs.rstudio.com/rmarkdown/reference/render.html)

## Details

Possible arguments for the YAML header are:

- `title` Title of the manuscript.

- `subtitle` Subtitle of the manuscript.

- `author` Character of single or multiple author(s).

- `date` The date (automatically set).

- `fontsize` The font size for the body text (default is 11pt).

- `german` If option is set to 'true', the table and figure caption as
  well as the abstract and reference header will be in German; default
  is 'false' (i.e., English).

- `linkcolor`, `filecolor`, `citecolor`, `urlcolor` Colors for internal
  links (incl. ToC), external links, citation links, and linked URLs.

- `classoption` Options of the `article` class.

- `bibliography` Path to the bibliography file to use for references
  (BibTeX *.bib* file). This template uses the bibliography-related
  package [natbib](https://ctan.org/pkg/natbib). The current file
  includes 3 dummy references; either insert your references into this
  file or replace the file with your own.

- `bibliographystyle` The style is provided in the bibstyle.bst file,
  which adopts the [SAGE
  Harvard](https://uk.sagepub.com/sites/default/files/sage_harvard_reference_style_0.pdf)
  reference style. Just leave the file as it is.

- `header-includes` Custom additions to the header, before the
  `\begin{document}` statement.

- `include-after` For including additional LaTeX code before the
  `\end{document}` statement.
