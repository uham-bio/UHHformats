
<!-- README.md is generated from README.Rmd. Please edit that file -->

# UHHformats <img src="vignettes/images/UHHformats_logo.png" align="right" width="90" height="100" />

This R package provides ready-to-use **R Markdown** and **Quarto**
templates for HTML, PDF, and Microsoft Word output formats. The
templates are designed for the Department of Biology, University of
Hamburg (UHH), and its *Data Science in Biology* program, but can be
used by anyone — logos and styles are easily customizable via the YAML
header.

All templates ship with example text and code for formatting, equations,
tables, figures with cross-references, and citations.

For thesis templates see the companion package
[UHHthesis](https://github.com/saskiaotto/UHHthesis/).

## Available templates

| Template            | Output | R Markdown function | Quarto template  |
|---------------------|--------|---------------------|------------------|
| HTML document       | HTML   | `html_doc()`        | `html_doc`       |
| Simple PDF document | PDF    | `pdf_doc()`         | `pdf_doc`        |
| PDF report          | PDF    | `pdf_report()`      | `pdf_report`     |
| PDF cheat sheet     | PDF    | `pdf_cheatsheet()`  | `pdf_cheatsheet` |
| Word document       | Word   | `word_doc()`        | `word_doc`       |

The default font is Helvetica. PDF and Word templates also support the
University’s own font TheSans UHH (available to UHH members).

> **Backward compatibility:** The old function names `html_simple()` and
> `pdf_simple()` still work as aliases.

See the [template gallery](docs/gallery.md) for screenshots of each
template.

## Installation

Install from GitHub:

``` r
if (!require("remotes")) install.packages("remotes")
remotes::install_github("uham-bio/UHHformats", build_vignettes = TRUE)
```

Required dependencies (rmarkdown, knitr, bookdown) are installed
automatically. For PDF output you also need a LaTeX distribution —
[tinytex](https://yihui.org/tinytex/) is the easiest option:

``` r
install.packages("tinytex")
tinytex::install_tinytex()
```

For Quarto templates, install the [Quarto
CLI](https://quarto.org/docs/get-started/) and optionally the R package:

``` r
install.packages("quarto")
```

Quarto templates can also be installed as a standalone extension
(without the R package):

    quarto add uham-bio/UHHformats

## Getting started

See [docs/getting-started.md](docs/getting-started.md) for detailed
instructions on creating and rendering documents (RStudio, console,
prerequisites).

Or use `vignette("UHHformats")` for a quick overview from within R.

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
