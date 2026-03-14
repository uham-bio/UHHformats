# Getting started

## R Markdown documents

### Creating a document in RStudio

1. Choose **File** > **New File** > **R Markdown** > **From Template**
2. Select one of the UHHformats templates (you may need to restart RStudio after installing the package)
3. Choose a directory and file name, then click **OK**
4. Click **Knit** to render the document

![Creating a new document in RStudio](../vignettes/images/img_create_document.png)

### Creating a document from the console

Use `create_rmd_doc()` to create a new directory with the template and all associated files:

```r
UHHformats::create_rmd_doc(dirname = "my_report", template = "pdf_report")
```

Or use the standard rmarkdown function:

```r
rmarkdown::draft("my_report.Rmd", template = "html_doc", package = "UHHformats")
```

Both functions create a subdirectory containing the `.Rmd` file and all required resources (images, fonts, LaTeX templates, etc.).

### Rendering

In RStudio, click the **Knit** button. From the console:

```r
rmarkdown::render("my_report/my_report.Rmd")
```

### YAML header

Each template pre-fills an appropriate YAML header. For example, `html_doc`:

```yaml
---
title: "Title"
author: "Name"
date: "`r Sys.Date()`"
output:
  UHHformats::html_doc:
    highlight: kate
    code_folding: show
    use_bookdown: true
    number_sections: false
---
```

See the help pages (e.g. `?html_doc`, `?pdf_report`) for all available options.


## Quarto documents

### Creating a document

Use `create_quarto_doc()` to set up a Quarto project:

```r
UHHformats::create_quarto_doc(dirname = "my_html", template = "html_doc")
UHHformats::create_quarto_doc(dirname = "my_pdf", template = "pdf_doc", font = "TheSansUHH")
```

Available templates: `html_doc`, `pdf_doc`, `pdf_report`, `pdf_cheatsheet`, `word_doc`.

### Rendering

In RStudio, open the `.qmd` file and click **Render**. From the console:

```r
quarto::quarto_render("my_html/my_html.qmd")
```

### Standalone Quarto extension

The templates can also be installed as a Quarto extension without the R package:

```
quarto add uham-bio/UHHformats
```

This is useful if you work primarily with Quarto and don't need the R helper functions.


## Font options

The default font for all templates is **Helvetica**. PDF and Word templates also support the University of Hamburg's own font **TheSans UHH** (available to UHH members). Set the font via:

- **R Markdown:** `font: "TheSansUHH"` in the YAML header, or `font = "TheSansUHH"` in `create_rmd_doc()`
- **Quarto:** `font = "TheSansUHH"` in `create_quarto_doc()`

You can also use a custom font by setting `font = "other"` and replacing the `font_XXX.ttf` files in the template directory with your own files (keeping the same file names).


## Prerequisites

### Pandoc

R Markdown and Quarto use [Pandoc](https://pandoc.org/) to convert documents. RStudio ships with its own Pandoc installation. If you render from the console without RStudio, you need Pandoc installed on your system:

- Installation: <https://pandoc.org/installing.html>
- Minimum required version: 2.17

### LaTeX (for PDF output)

PDF templates require a LaTeX distribution. Options:

- **tinytex** (recommended): Lightweight, cross-platform, installs missing packages automatically.

  ```r
  install.packages("tinytex")
  tinytex::install_tinytex()
  # Verify:
  tinytex:::is_tinytex()
  ```

- **Full distributions:** [MacTeX](http://www.tug.org/mactex/) (Mac), [MiKTeX](https://miktex.org/) (Windows), [TeX Live](https://www.tug.org/texlive/) (Linux).

You may need to install additional LaTeX packages on your first render --- tinytex handles this automatically.

### Quarto CLI

For Quarto templates, install the [Quarto CLI](https://quarto.org/docs/get-started/). To render `.qmd` files from R, also install the quarto R package:

```r
install.packages("quarto")
```
