# Convert to cheat sheet

This function serves as wrapper to
[`pdf_document`](https://pkgs.rstudio.com/rmarkdown/reference/pdf_document.html)
and creates a cheat sheet as PDF output.

## Usage

``` r
pdf_cheatsheet(
  highlight = "kate",
  font = "Helvetica",
  latex_engine = "xelatex",
  ...
)
```

## Arguments

- highlight:

  character; syntax highlighting style. Supported styles include
  "default", "tango", "pygments", "kate" (default here), "monochrome",
  "espresso", "zenburn", and "haddock".

- font:

  character; default font is "Helvetica"; for members of the UHH there
  is also the font "TheSansUHH" available. If you want to use another
  font, simply use the setting "other" and replace the .ttf files for
  regular, italic, bold, and bold-italic font with your own files
  (should be named EXACTLY as the template font files).

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

- `author` Character of single or multiple author(s), which will be
  shown in the footer together with the date and license.

- `date` The date, which is automatically set but you can also use a
  string such as "April 2020".

- `fontsize` The font size for the body text (default is 11pt).

- `params` Further parameters that can be defined

  - `logo` Path to a logo for the footer (optional)

  - `license` Character; the creative commons license displayed in the
    footer (optional); default is the "CC-BY-SA" licence; for more for
    more information on creative commons licenses, see
    <https://creativecommons.org/licenses/>.

  - `multicols` The number of columns in the overall layout; you can
    choose any value \> 1, default is 3.

  - `reduce_space_before_code` logical; defines whether the space before
    the code block (when echo =TRUE) should be reduced; this works only
    if code chunks are displayed, hence, default is set to `false`.

  - `col_title` Hex decimal code of the title color (without the
    hashtag); default is '000000' for black.

  - `col_sections` Hex decimal code of the color of all (sub)section
    header color (without the hashtag); default is '000000' for black.

  - `col_code` Hex decimal code of the inline code color (without the
    hashtag); default is '000000' for black.

  - `col_redbox` Hex decimal code of the red coloured textbox ( Called
    with the LaTeX command `redbox`). Default is here 'bc0000'. Other
    colors that can be defined are `col_bluebox` (for `bluebox`, default
    is '027BCB'), `col_greenbox` (for `greenbox`, default is '7fa16a'),
    `col_yellowbox` (for `yellowbox`, default is 'eeb422'),
    `col_graybox` (for `graybox`, default is '8c8c8c'), `col_blackbox`
    (for `blackbox`, default is '191919'), and `col_whitebox` (for
    `whitebox`, default is 'e0e0e0').

- `header-includes` Custom additions to the header, before the
  `\begin{document}` statement.

- `include-after` For including additional LaTeX code before the
  `\end{document}` statement.
