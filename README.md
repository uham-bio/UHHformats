
<!-- README.md is generated from README.Rmd. Please edit that file -->

# UHHformats <img src="vignettes/images/UHHformats_logo.png" align="right" width="90" height="100" />

[![Author: Saskia
Otto](https://img.shields.io/badge/author-Saskia%20Otto-blue)](https://github.com/saskiaotto)
[![License:
MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)

This R package provides ready-to-use **R Markdown** and **Quarto**
templates for HTML, PDF, and Microsoft Word output formats. The
templates are designed for the Department of Biology, University of
Hamburg (UHH), and its *Data Science in Biology* program, but can be
used by anyone — logos and styles are easily customizable via the YAML
header.

All templates ship with example text and code for formatting, equations,
tables, figures with cross-references, and citations.

For thesis templates see the companion package
[UHHthesis](https://github.com/uham-bio/UHHthesis) or the separate
[Quarto extension](https://github.com/uham-bio/quarto-UHHthesis).

## Available templates

| Template            | R Markdown function | Quarto template  |
|:--------------------|:--------------------|:-----------------|
| HTML document       | `html_doc()`        | `html_doc`       |
| Simple PDF document | `pdf_doc()`         | `pdf_doc`        |
| PDF report          | `pdf_report()`      | `pdf_report`     |
| PDF cheat sheet     | `pdf_cheatsheet()`  | `pdf_cheatsheet` |
| Word document       | `word_doc()`        | `word_doc`       |

The default font is Helvetica. PDF and Word templates also support the
University’s own font TheSans UHH (available to UHH members).

> **Backward compatibility:** The old function names `html_simple()` and
> `pdf_simple()` still work as aliases.

See the [template
gallery](https://uham-bio.github.io/UHHformats/articles/gallery.html)
for screenshots and demo files.

## Installation

Install from GitHub:

``` r
# Using the package 'pak' (recommended)
if (!require("pak")) install.packages("pak")
pak::pak("uham-bio/UHHformats")

# Alternatively, using 'remotes'
if (!require("remotes")) install.packages("remotes")
remotes::install_github("uham-bio/UHHformats", build_vignettes = TRUE)
```

Required dependencies (rmarkdown, knitr, bookdown) are installed
automatically.

## Prerequisites

### Quarto CLI

For Quarto templates, install the [Quarto
CLI](https://quarto.org/docs/get-started/). To render `.qmd` files from
R, also install the quarto R package:

``` r
install.packages("quarto")
```

### Pandoc

R Markdown and Quarto use [Pandoc](https://pandoc.org/) to convert
documents. RStudio ships with its own Pandoc installation. If you render
from the console without RStudio, you need Pandoc installed on your
system:

- Installation: <https://pandoc.org/installing.html>
- Minimum required version: 2.17

### LaTeX (for PDF output)

For PDF output you also need a LaTeX distribution. An easy
cross-platform option is the [tinytex](https://yihui.org/tinytex/) R
package:

``` r
install.packages("tinytex")
tinytex::install_tinytex()
```

For other distributions see <https://www.latex-project.org/get/>.

------------------------------------------------------------------------

## Credits

- Julien Barnier’s [rmdformats](https://github.com/juba/rmdformats)
  package
- The [rticles](https://github.com/rstudio/rticles) package
- INWTlab’s [ireports](https://github.com/INWTlab/ireports) package
- Sarah Lang’s [LaTeX cheat sheet
  template](https://www.overleaf.com/latex/templates/colourful-cheatsheet-template/qdsshbjktndd)
- Eli Holmes’ [quarto
  titlepages](https://nmfs-opensci.github.io/quarto_titlepages/)
  collection
