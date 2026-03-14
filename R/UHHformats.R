#' UHHformats: R Markdown/Quarto templates designed for the University of Hamburg
#'
#' A package for creating HTML, PDF and Microsoft Word documents, reports,
#' and cheat sheets using either R Markdown or now also Quarto.
#'
#' @section Quarto templates:
#' The following templates can be created using the function \code{\link{create_quarto_doc}}.
#' Simply set the \emph{template} argument to one of the following types:
#' \itemize{
#'   \item \emph{'html_doc'}: Creates a simple HTML document with a
#'     fixed navigation bar on the left side.
#'   \item \emph{'word_doc'}: Creates a simple MS Word document in English
#'     (default) and German.
#'   \item \emph{'pdf_doc'}: Creates a simple PDF/LaTeX document in
#'     English (default) and German.
#'   \item \emph{'pdf_report'}: Creates a report-like PDF/LaTeX document in
#'     English (default) and German.
#'   \item \emph{'pdf_cheatsheet'}: Creates a landscape PDF cheatsheet with
#'     configurable multi-column layout and colored textboxes.
#' }
#'
#'
#' @section R Markdown templates:
#' The following templates can be created using RStudio's IDE or by using the
#' function \code{\link{create_rmd_doc}}:
#' \itemize{
#'   \item \code{\link{html_doc}}: Creates a simple HTML document with a
#'     fixed table of content.
#'   \item \code{\link{word_doc}}: Creates a simple MS Word document in English
#'     (default) and German.
#'   \item \code{\link{pdf_doc}}: Creates a simple PDF/LaTeX document in
#'     English (default) and German.
#'   \item \code{\link{pdf_report}}: Creates a report-like PDF/LaTeX document in
#'     English (default) and German.
#'   \item \code{\link{pdf_cheatsheet}}: Creates a simple PDF cheatsheet with
#'     box layouts.
#' }
"_PACKAGE"
