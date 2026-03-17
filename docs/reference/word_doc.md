# Convert R Markdown to a Microsoft Word document

This function serves as wrapper for
[`word_document2`](https://pkgs.rstudio.com/bookdown/reference/html_document2.html),
with a custom Pandoc Word template and different knitr default values
(e.g., `number_sections = FALSE`). The Word template is based on the
standard template of the University of Hamburg.

## Usage

``` r
word_doc(
  toc = FALSE,
  toc_depth = 4,
  number_sections = FALSE,
  highlight = "default",
  reference_docx = "uhh-template",
  font = "Helvetica",
  language = "en",
  dpi = 144,
  pandoc_args = NULL,
  ...
)
```

## Arguments

- toc:

  logical; `TRUE` to include a table of contents in the output.

- toc_depth:

  integer; Depth of headers to include in table of contents. Default set
  to 4.

- number_sections:

  logical; whether to number section headers: if TRUE, figure/table
  numbers will be of the form X.i, where X is the current first-level
  section number, and i is an incremental number (the i-th
  figure/table); if FALSE (default), figures/tables will be numbered
  sequentially in the document from 1, 2, ..., and you cannot
  cross-reference section headers in this case.

- highlight:

  character; syntax highlighting style. Supported styles include
  "default", "tango", "pygments", "kate", "monochrome", "espresso",
  "zenburn", and "haddock". Pass `NULL` to prevent syntax highlighting.

- reference_docx:

  character; use the specified file as a style reference in producing a
  docx file. The 'uhh-template.docx' template implements most of the
  standard requirement at the UHH biology department. If you prefer
  another template, pass the file name to this argument or simply use
  'default' to use your standard Word template.

- font:

  character; default font in the template file is "Helvetica"; for
  members of the UHH there is also the font "TheSansUHH" available. If
  you want to provide your own Word template, there is no need to set
  any font here.

- language:

  character; the document language. If set to "de" (ISO code for
  German), a configuration file named '\_bookdown.yml' will be copied
  (unless this file exists already) to the directory of the R Markdown
  file, which language specification for the table and figure legends as
  well as for the equations. The wordings can be adjusted. The default
  is currently 'en' (i.e. English), so the bookdown's default
  terminology will be used.

- dpi:

  integer; the resolution of the output figures, default is 144 dots per
  inch.

- pandoc_args:

  Additional command line options to pass to pandoc.

- ...:

  Additional parameters to pass to
  [`word_document2`](https://pkgs.rstudio.com/bookdown/reference/html_document2.html).

## Value

A modified
[`word_document`](https://pkgs.rstudio.com/rmarkdown/reference/word_document.html)
based on a UHH Word template.

## Examples

``` r
if (FALSE) { # \dontrun{
 # put in YAML header:
 output: UHHformats::word_doc
} # }
```
