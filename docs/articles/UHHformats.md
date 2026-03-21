# Getting started with UHHformats

The UHHformats package provides R Markdown and Quarto templates for
HTML, PDF, and Word output. This vignette gives a quick overview of the
different templates and how to get started.

## Available templates

| Template | R Markdown function | Quarto template |
|:---|:---|:---|
| HTML document | [`html_doc()`](https://uham-bio.github.io/UHHformats/reference/html_doc.md) | `html_doc` |
| Simple PDF document | [`pdf_doc()`](https://uham-bio.github.io/UHHformats/reference/pdf_doc.md) | `pdf_doc` |
| PDF report | pdf_report()`|`pdf_report`| | PDF cheat sheet | pdf_cheatsheet()` | `pdf_cheatsheet` |
| Word document | [`word_doc()`](https://uham-bio.github.io/UHHformats/reference/word_doc.md) | `word_doc` |

## Getting started

### R Markdown documents

#### Creating a document in RStudio

Once you installed the package you might need to close and re-open
RStudio to see the `UHHformats` templates listed.

1.  Choose **File** \> **New File** \> **R Markdown**, then select
    **From Template**. You should then be able to create a new document
    from one of the package templates.

2.  Choose the directory in which you want to save your file and provide
    a file name (that name will be used for both the .Rmd file and the
    new folder in which the .Rmd file will be placed).

3.  If you are interested in the documentation already provided in the
    template file for getting started, render the document once before
    you start changing the content (click the `Knit` button).

![Creating a new document in RStudio](images/img_create_document.png)

Creating a new document in RStudio

#### Creating a document from the console

Use
[`create_rmd_doc()`](https://uham-bio.github.io/UHHformats/reference/create_rmd_doc.md)
to create a new directory with the template and all associated files:

``` r

UHHformats::create_rmd_doc(dirname = "my_report", template = "pdf_report")
```

Or use the standard rmarkdown function:

``` r

rmarkdown::draft("my_report.Rmd", template = "html_doc", package = "UHHformats")
```

Both functions create a subdirectory containing the `.Rmd` file and all
required resources (images, fonts, LaTeX templates, etc.).

#### Rendering

In RStudio, click the **Knit** button. From the console:

``` r

rmarkdown::render("my_report/my_report.Rmd")
```

**Important note**:
[`rmarkdown::render`](https://pkgs.rstudio.com/rmarkdown/reference/render.html)
uses as default Pandoc to convert the Markdown document into PDF, HTML
or Word. While RStudio uses its internal Pandoc installation (e.g., on a
Mac located in ‘/Applications/RStudio.app/Contents/MacOS/pandoc/’), you
need to have Pandoc and its citation parser also installed on your
system. See <https://pandoc.org/installing.html> for instructions. This
book chapter is also helpful:
<https://bookdown.org/yihui/rmarkdown-cookbook/install-pandoc.html>

#### YAML header

Each template pre-fills an appropriate YAML header. For example,
`html_doc`:

``` yaml
---
title: "Title"
author: "Name"
date: "2026-03-21"
output:
  UHHformats::html_doc:
    highlight: kate
    code_folding: show
    use_bookdown: true
    number_sections: false
---
```

See the help pages
(e.g. [`?html_doc`](https://uham-bio.github.io/UHHformats/reference/html_doc.md),
[`?pdf_report`](https://uham-bio.github.io/UHHformats/reference/pdf_report.md))
for all available options.

### Quarto documents

Use
[`create_quarto_doc()`](https://uham-bio.github.io/UHHformats/reference/create_quarto_doc.md)
to set up a Quarto project:

``` r

UHHformats::create_quarto_doc(dirname = "my_html", template = "html_doc")
UHHformats::create_quarto_doc(dirname = "my_pdf", template = "pdf_doc", font = "TheSansUHH")
```

Available templates: `html_doc`, `pdf_doc`, `pdf_report`,
`pdf_cheatsheet`, `word_doc`.

#### Rendering

In RStudio, open the `.qmd` file and click **Render**. From the console:

``` r

quarto::quarto_render("my_html/my_html.qmd")
```

## Template folder structure

Both
[`create_rmd_doc()`](https://uham-bio.github.io/UHHformats/reference/create_rmd_doc.md)
and
[`create_quarto_doc()`](https://uham-bio.github.io/UHHformats/reference/create_quarto_doc.md)
create a new directory containing the template file and all required
resources. The folder structure depends on the template and format:

**R Markdown templates** typically contain:

    my_report/
    ├── my_report.Rmd        # The R Markdown document
    ├── bib/                 # Bibliography (.bib) and citation style (.csl) files
    ├── data/                # Example dataset (mtcars.csv)
    └── images/              # Example images used in the template

**Quarto templates** include additional files:

    my_report/
    ├── my_report.qmd        # The Quarto document
    ├── bib/                 # Bibliography (.bib) and citation style (.csl) files
    ├── data/                # Example dataset (mtcars.csv)
    ├── images/              # Example images used in the template
    ├── styles/              # Styling files (LaTeX headers, CSS, JS)
    └── custom_lang.yml      # Custom language settings (e.g., figure/table labels)

The `bib/` folder contains a sample `.bib` file with dummy references
and a `.csl` file for the citation style (SAGE Harvard by default). The
`styles/` folder in Quarto templates holds the LaTeX preamble files (for
PDF) or CSS/JS files (for HTML) that control the document appearance.
The `custom_lang.yml` file allows you to customise labels such as
“Figure”, “Table”, or “Contents” for different languages.

You can safely modify, add, or remove files in these folders to suit
your needs.

### Customising the `pdf_report` cover page

The `pdf_report` template includes a front cover page with a background
image. You can replace the default image by swapping the file
`images/cover.png` with your own image (keeping the same file name).

In the **Quarto version**, you can additionally customise the cover
appearance directly in the YAML header:

- `cover-bg-image`: path to the cover image.
- `cover-page-color`: background colour as hex code (e.g., `"7EB7DF"`).
- `cover-text-color`: title text colour as hex code (e.g., `"3A515C"`).
- `cover-fade-effect`: if `true` (default), the background colour fades
  over the image from top to bottom. Set to `false` to display the image
  without the fade overlay.

In the **R Markdown version**, the cover image path is set via the
`params` field in the YAML header (e.g., `cover: images/cover.png`).
Replace the image file to use your own cover.

## Font options

The default font for all templates is **Helvetica**. PDF and Word
templates also support the University of Hamburg’s own font **TheSans
UHH** (available to UHH members). Set the font via:

- **R Markdown:** `font: "TheSansUHH"` in the YAML header, or
  `font = "TheSansUHH"` in
  [`create_rmd_doc()`](https://uham-bio.github.io/UHHformats/reference/create_rmd_doc.md)
- **Quarto:** `font = "TheSansUHH"` in
  [`create_quarto_doc()`](https://uham-bio.github.io/UHHformats/reference/create_quarto_doc.md)

You can also use a custom font by setting `font = "other"` and replacing
the `font_XXX.ttf` files in the template directory with your own files
(keeping the same file names).

## Prerequisites

- **PDF output** requires a LaTeX distribution. Recommended:
  [tinytex](https://yihui.org/tinytex/).
- **Quarto templates** require the [Quarto
  CLI](https://quarto.org/docs/get-started/).

See
[`?html_doc`](https://uham-bio.github.io/UHHformats/reference/html_doc.md),
[`?pdf_doc`](https://uham-bio.github.io/UHHformats/reference/pdf_doc.md),
[`?pdf_report`](https://uham-bio.github.io/UHHformats/reference/pdf_report.md),
[`?pdf_cheatsheet`](https://uham-bio.github.io/UHHformats/reference/pdf_cheatsheet.md),
or
[`?word_doc`](https://uham-bio.github.io/UHHformats/reference/word_doc.md)
for all YAML options.
