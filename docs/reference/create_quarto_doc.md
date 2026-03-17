# Create a new directory with the Quarto template

`create_quarto_doc` creates a new subdirectory inside the current
directory, which will contain the ready-to-use Quarto file and all
associated files. The Word and PDF templates are based on the standard
template of the University of Hamburg.

## Usage

``` r
create_quarto_doc(
  dirname = "new-doc",
  template = "html_doc",
  font = "Helvetica",
  path = "."
)
```

## Arguments

- dirname:

  character; the name of the directory to create.

- template:

  character; the template type to use. Choose "html_doc" (default),
  "pdf_doc", "pdf_report", "pdf_cheatsheet", or "word_doc".

- font:

  The font family of the document. Default is "Helvetica" (i.e.
  Helvetica Neue). For members of the UHH, there is also the font
  "TheSansUHH" available for the PDF and Word templates.

- path:

  character; the path where the directory should be created. Default is
  the current working directory (".").

## See also

[`create_rmd_doc`](https://uham-bio.github.io/UHHformats/reference/create_rmd_doc.md)
for R Markdown templates.

## Examples

``` r
if (FALSE) { # \dontrun{
 # Create template for HTML document
 create_quarto_doc(dirname = "my_html_doc", template = "html_doc")
 # Create template for simple PDF document using the default font 'Helvetica'
 create_quarto_doc(dirname = "my_pdf_doc", template = "pdf_doc")
 # Create template for Word document using the University's
 # font 'TheSansUHH'
 create_quarto_doc(dirname = "my_word_doc", template = "word_doc", font = "TheSansUHH")
 # Create template for PDF cheatsheet (landscape, multi-column)
 create_quarto_doc(dirname = "my_cheatsheet", template = "pdf_cheatsheet")
 # Create in a specific directory
 create_quarto_doc(dirname = "my_doc", template = "pdf_doc", path = "~/Documents")
} # }
```
