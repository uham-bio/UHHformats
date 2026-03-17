# Create a new directory with the R Markdown template

`create_rmd_doc` creates a new subdirectory inside the current
directory, which will contain the ready-to-use R Markdown file and all
associated files.

## Usage

``` r
create_rmd_doc(dirname = "new-doc", template = "html_doc", path = ".")
```

## Arguments

- dirname:

  Name of the directory to create.

- template:

  The name of the template to use. Default is "html_doc", other options
  are "pdf_doc", "pdf_report", "word_doc", and "pdf_cheatsheet".

- path:

  character; the path where the directory should be created. Default is
  the current working directory (".").

## Details

The function is a modified version of the `create.doc` function in the
[rmdformats](https://github.com/juba/rmdformats) package.

## See also

[`create_quarto_doc`](https://uham-bio.github.io/UHHformats/reference/create_quarto_doc.md)
for Quarto templates.

## Examples

``` r
if (FALSE) { # \dontrun{
# Create template for a simple HTML document
create_rmd_doc("my_html_doc", template = "html_doc")
# Create template for a PDF report document
create_rmd_doc("my_report", template = "pdf_report")
# Create in a specific directory
create_rmd_doc("my_doc", template = "pdf_doc", path = "~/Documents")
} # }
```
