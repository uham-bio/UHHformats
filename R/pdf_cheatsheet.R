#' Convert to cheat sheet
#'
#' This function serves as wrapper to \code{\link[rmarkdown]{pdf_document}}
#' and creates a cheat sheet as PDF output.
#'
#' @param highlight character; syntax highlighting style. Supported styles
#'   include "default", "tango", "pygments", "kate" (default here),
#'   "monochrome", "espresso", "zenburn", and "haddock".
#' @param font character; default font is "Helvetica"; for members of the UHH there is also the font
#'        "TheSansUHH" available. If you want to use another font, simply use the setting "other" and
#'        replace the .ttf files for regular, italic, bold, and bold-italic font with your own files
#'        (should be named EXACTLY as the template font files).
#' @param latex_engine character; LaTeX engine for producing PDF output. Options
#'   are "pdflatex", "lualatex", and "xelatex" (default).
#' @param ... Further arguments passed to \code{\link[rmarkdown]{pdf_document}}.
#'
#' @details
#' Possible arguments for the YAML header are:
#' \itemize{
#'   \item \code{author} Character of single or multiple author(s), which will be
#'              shown in the footer together with the date and license.
#'   \item \code{date} The date, which is automatically set but you can also use a
#'              string such as "April 2020".
#'   \item \code{fontsize} The font size for the body text (default is 11pt).
#'   \item \code{params} Further parameters that can be defined
#'   \itemize{
#'     \item \code{logo} Path to a logo for the footer (optional)
#'     \item \code{license} Character; the creative commons license displayed in
#'              the footer (optional); default is the "CC-BY-SA" licence; for more
#'              for more information on creative commons licenses, see
#'              \href{https://creativecommons.org/licenses/}{https://creativecommons.org/licenses/}.
#'     \item \code{multicols} The number of columns in the overall layout; you can choose
#'               any value > 1, default is 3.
#'     \item \code{reduce_space_before_code} logical; defines whether the space before
#'               the code block (when echo =TRUE) should be reduced; this works only
#'               if code chunks are displayed, hence, default is set to `false`.
#'     \item \code{col_title} Hex decimal code of the title color (without the
#'               hashtag); default is '000000' for black.
#'     \item \code{col_sections} Hex decimal code of the color of all (sub)section
#'               header color (without the hashtag); default is '000000' for black.
#'     \item \code{col_code} Hex decimal code of the inline code color (without the
#'               hashtag); default is '000000' for black.
#'     \item \code{col_redbox} Hex decimal code of the red coloured textbox (
#'               Called with the LaTeX command \code{redbox}).
#'               Default is here 'bc0000'. Other colors that can be defined are
#'               \code{col_bluebox} (for \code{bluebox}, default is '027BCB'),
#'               \code{col_greenbox} (for \code{greenbox}, default is '7fa16a'),
#'               \code{col_yellowbox} (for \code{yellowbox}, default is 'eeb422'),
#'               \code{col_graybox} (for \code{graybox}, default is '8c8c8c'),
#'               \code{col_blackbox} (for \code{blackbox}, default is '191919'), and
#'               \code{col_whitebox} (for \code{whitebox}, default is 'e0e0e0').
#'      }
#'   \item \code{header-includes} Custom additions to the header, before the
#'              \code{\\begin\{document\}} statement.
#'   \item \code{include-after} For including additional LaTeX code before the
#'              \code{\\end\{document\}} statement.
#'  }
#' @return R Markdown output format to pass to \code{\link[rmarkdown]{render}}
#' @export
pdf_cheatsheet <- function(highlight = "kate", font = "Helvetica",
  latex_engine = "xelatex", ...) {

  # Font setting
  if (!font %in% c("Helvetica", "TheSansUHH", "other")) {
    stop('Set the font option to "Helvetica", "TheSansUHH" or "other".')
  }
  rmd_pdf_document_format(
    "pdf_cheatsheet",
    highlight = highlight,
    latex_engine = latex_engine,
    pandoc_args = font_pandoc_args(font),
    ...
  )
}
