#' Convert to a simple HTML document
#'
#' This function converts the R Markdown file into a simple HTML document output format
#' that has a fixed table of content as naivation bar in the upper right corner.
#' The basis for this function and the HTML, CSS, and JavaScript code is the
#' `html_clean` R Markdown template developed by
#' Julien Barnier in the \href{https://github.com/juba/rmdformats}{rmdformats}
#' package.
#'
#' @param highlight Syntax highlighting style. Supported styles include
#'   "default", "tango", "pygments", "kate" (default), "monochrome", "espresso",
#'   "zenburn", "haddock", and "textmate". Pass \code{NULL} to prevent syntax
#'   highlighting.
#' @param code_folding Enable document readers to toggle the display of R code chunks.
#'   Specify "show" to show all R code chunks by default. Specify "none" to display all
#'   code chunks (assuming they were knit with echo = TRUE). Specify "hide" to hide
#'   all R code chunks by default (users can show hidden code chunks
#'   either individually or document-wide).
#' @param code_download Embed the Rmd source code within the document and provide a
#'   link that can be used by readers to download the code.
#' @param toc \code{TRUE} to include a fixed table of contents in the output (upper right corner).
#' @param toc_depth Depth of headers to include in table of contents. Default is set to 4.
#' @param number_sections \code{FALSE} to not number section headings.
#' @param lightbox If TRUE, add lightbox effect to content images.
#' @param thumbnails If TRUE display content images as thumbnails.
#' @param gallery If TRUE and lightbox is TRUE, add a gallery navigation between images in lightbox display.
#' @param fig_width Default width (in inches) for figures, set here to 6.
#' @param fig_height Default width (in inches) for figures, set here to 4.
#' @param fig_caption \code{TRUE} to render figures with captions.
#' @param use_bookdown If \code{TRUE} (default), uses \code{\link[bookdown]{html_document2}}
#'   instead of \code{\link[rmarkdown]{html_document}}, thus providing numbered sections
#'   and automatic numbering of tables and figures. The hyperlink in the cross-references,
#'   does not work here.
#' @param md_extensions arguments passed to the md_extensions argument of rmarkdown
#'   \code{\link[rmarkdown]{html_document}}
#' @param mathjax Set to NULL to disable Mathjax insertion.
#' @param pandoc_args Arguments passed to the pandoc_args argument of rmarkdown.
#'   \code{\link[rmarkdown]{html_document}}.
#' @param ... Additional function arguments passed to R Markdown \code{\link[rmarkdown]{html_document}}.
#'
#' @return R Markdown output format to pass to \code{\link[rmarkdown]{render}}
#' @import rmarkdown
#' @importFrom htmltools htmlDependency
#' @export

html_doc <- function(
  highlight = "kate", code_folding = "show", code_download = FALSE,
  toc = TRUE, toc_depth = 3, number_sections = FALSE,
  lightbox = TRUE, thumbnails = TRUE, gallery = TRUE,
  fig_width = 6, fig_height = 6, fig_caption = TRUE,
  use_bookdown = TRUE, md_extensions = NULL,
  mathjax = "UHHformats", pandoc_args = NULL, ... ) {

  html_template(
    template_name = "html_doc",
    template_path = "templates/html_doc/html_simple.html",
    template_dependencies = list(
      html_dependency_doc()
    ),
    pandoc_args = pandoc_args,
    highlight = highlight,
    code_folding = code_folding,
    code_download = code_download,
    toc = toc,
    toc_depth = toc_depth,
    number_sections = number_sections,
    lightbox = lightbox,
    thumbnails = thumbnails,
    gallery = gallery,
    fig_width = fig_width,
    fig_height = fig_height,
    fig_caption = fig_caption,
    use_bookdown = use_bookdown,
    md_extensions = md_extensions,
    mathjax = mathjax,
    ...
  )

}

##### This was also adjusted to link to the UHHformats file names:
# html_doc css and js
html_dependency_doc <- function() {
  htmltools::htmlDependency(name = "html_doc",
    version = utils::packageVersion("UHHformats"),
    src = system.file("templates/html_doc", package = "UHHformats"),
    script = "html_simple.js",
    stylesheet = "html_simple.css")
}


#' @rdname html_doc
#' @usage # Deprecated: use html_doc() instead
#' @export
html_simple <- function(...) {
  .Deprecated("html_doc")
  html_doc(...)
}
