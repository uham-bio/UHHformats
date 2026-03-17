# Convert to a simple HTML document

This function converts the R Markdown file into a simple HTML document
output format that has a fixed table of contents as navigation bar in
the upper right corner. The basis for this function and the HTML, CSS,
and JavaScript code is the `html_clean` R Markdown template developed by
Julien Barnier in the [rmdformats](https://github.com/juba/rmdformats)
package.

## Usage

``` r
html_doc(
  highlight = "kate",
  code_folding = "show",
  code_download = FALSE,
  toc = TRUE,
  toc_depth = 3,
  number_sections = FALSE,
  lightbox = TRUE,
  thumbnails = TRUE,
  gallery = TRUE,
  fig_width = 6,
  fig_height = 6,
  fig_caption = TRUE,
  use_bookdown = TRUE,
  md_extensions = NULL,
  mathjax = "UHHformats",
  pandoc_args = NULL,
  ...
)

# Deprecated: use html_doc() instead
```

## Arguments

- highlight:

  Syntax highlighting style. Supported styles include "default",
  "tango", "pygments", "kate" (default), "monochrome", "espresso",
  "zenburn", and "haddock". Pass `NULL` to prevent syntax highlighting.

- code_folding:

  Enable document readers to toggle the display of R code chunks.
  Specify "show" to show all R code chunks by default. Specify "none" to
  display all code chunks (assuming they were knit with echo = TRUE).
  Specify "hide" to hide all R code chunks by default (users can show
  hidden code chunks either individually or document-wide).

- code_download:

  Embed the Rmd source code within the document and provide a link that
  can be used by readers to download the code.

- toc:

  `TRUE` to include a fixed table of contents in the output (upper right
  corner).

- toc_depth:

  Depth of headers to include in table of contents. Default is set to 3.

- number_sections:

  `FALSE` to not number section headings.

- lightbox:

  If TRUE, add lightbox effect to content images.

- thumbnails:

  If TRUE display content images as thumbnails.

- gallery:

  If TRUE and lightbox is TRUE, add a gallery navigation between images
  in lightbox display.

- fig_width:

  Default width (in inches) for figures, set here to 6.

- fig_height:

  Default width (in inches) for figures, set here to 4.

- fig_caption:

  `TRUE` to render figures with captions.

- use_bookdown:

  If `TRUE` (default), uses
  [`html_document2`](https://pkgs.rstudio.com/bookdown/reference/html_document2.html)
  instead of
  [`html_document`](https://pkgs.rstudio.com/rmarkdown/reference/html_document.html),
  thus providing numbered sections and automatic numbering of tables and
  figures. The hyperlink in the cross-references, does not work here.

- md_extensions:

  arguments passed to the md_extensions argument of rmarkdown
  [`html_document`](https://pkgs.rstudio.com/rmarkdown/reference/html_document.html)

- mathjax:

  Set to NULL to disable Mathjax insertion.

- pandoc_args:

  Arguments passed to the pandoc_args argument of rmarkdown.
  [`html_document`](https://pkgs.rstudio.com/rmarkdown/reference/html_document.html).

- ...:

  Additional function arguments passed to R Markdown
  [`html_document`](https://pkgs.rstudio.com/rmarkdown/reference/html_document.html).

## Value

R Markdown output format to pass to
[`render`](https://pkgs.rstudio.com/rmarkdown/reference/render.html)
