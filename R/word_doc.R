#' Convert R Markdown to a Microsoft Word document
#'
#' This function serves as wrapper for \code{\link[bookdown]{word_document2}}, with a
#' custom Pandoc Word template and different knitr default values (e.g., \code{number_sections = FALSE}).
#' The Word template is based on the standard template of the University of Hamburg.
#'
#' @param toc logical; \code{TRUE} to include a table of contents in the output.
#' @param toc_depth integer; Depth of headers to include in table of contents. Default set to 4.
#' @param number_sections logical; whether to number section headers: if TRUE, figure/table numbers
#'        will be of the form X.i, where X is the current first-level section number, and i is an
#'        incremental number (the i-th figure/table); if FALSE (default), figures/tables will be numbered
#'        sequentially in the document from 1, 2, ..., and you cannot cross-reference section
#'        headers in this case.
#' @param highlight character; syntax highlighting style. Supported styles include "default",
#'        "tango", "pygments", "kate", "monochrome", "espresso", "zenburn", and "haddock".
#'        Pass \code{NULL} to prevent syntax highlighting.
#' @param reference_docx character; use the specified file as a style reference in producing a docx file.
#'        The 'uhh-template.docx' template implements most of the standard requirement at the UHH biology
#'        department. If you prefer another template, pass the file name to this argument or simply use
#'        'default' to use your standard Word template.
#' @param font character; default font in the template file is "Helvetica"; for members of the UHH there is also
#'        the font "TheSansUHH" available. If you want to provide your own Word template, there is no
#'        need to set any font here.
#' @param language character; the document language. If set to "de" (ISO code for German), a configuration file
#'        named '_bookdown.yml' will be copied (unless this file exists already) to the directory of the R
#'        Markdown file, which language specification for the table and figure legends as well as for the
#'        equations. The wordings can be adjusted. The default is currently 'en' (i.e. English), so the
#'        bookdown's default terminology will be used.
#' @param dpi integer; the resolution of the output figures, default is 144 dots per inch.
#' @param pandoc_args Additional command line options to pass to pandoc.
#' @param ... Additional parameters to pass to \code{\link[bookdown]{word_document2}}.
#'
#' @return A modified \code{\link[rmarkdown]{word_document}} based on a UHH Word template.
#'
#' @import bookdown
#' @import knitr
#'
#' @export
#'
#' @examples
#' \dontrun{
#'  # put in YAML header:
#'  output: UHHformats::word_doc
#' }
word_doc <- function(toc = FALSE, toc_depth = 4, number_sections = FALSE,
  highlight = "default", reference_docx = "uhh-template", font = "Helvetica",
  language = "en", dpi = 144, pandoc_args = NULL, ...) {

  # Font setting
  if (!font %in% c("Helvetica", "TheSansUHH", "other")) {
    stop('Set the font option to "Helvetica", "TheSansUHH" or "other".')
  }
  if (font == "Helvetica") filename <- "uhh-template-helvetica.docx"
  if (font == "TheSansUHH") filename <- "uhh-template-thesansuhh.docx"

  # Language setting
  if (!language %in% c("en", "de")) {
    stop('Set the language option either to English (language: "en") or German (language: "de").')
  }
  if (language == "de") {
    if (!file.exists(file.path(".", "_bookdown.yml"))) {
      file.copy(
        from = find_resource("word_doc", file = "_bookdown.yml"),
        to = file.path(".", "_bookdown.yml")
      )
    }
  }

  if (reference_docx == "uhh-template") {
    base <- rmd_word_document_format(
      format         = "word_doc",
      filename       = filename,
      toc            = toc,
      toc_depth      = toc_depth,
      number_sections = number_sections,
      highlight      = highlight,
      keep_md        = FALSE,
      pandoc_args    = c(pandoc_args, "--top-level-division=section"),
      ...
    )
  }
  else {
    base <- bookdown::word_document2(
      toc            = toc,
      toc_depth      = toc_depth,
      number_sections = number_sections,
      highlight      = highlight,
      keep_md        = FALSE,
      reference_docx = reference_docx,
      pandoc_args    = c(pandoc_args, "--top-level-division=section"),
      ...
    )
  }

  # Set chunk options
  base$knitr$opts_chunk$comment   <- NA
  base$knitr$opts_chunk$dpi <- dpi

  return(base)
}



