#' Create a new directory with the R Markdown template
#'
#' \code{create_rmd_doc} creates a new subdirectory inside the current directory, which will
#' contain the ready-to-use R Markdown file and all associated files.
#'
#' @param dirname Name of the directory to create.
#' @param template The name of the template to use. Default is "html_simple", other
#'   options are "pdf_simple", "pdf_report", "word_doc", and
#'   "pdf_cheatsheet".
#' @details
#' The function is a modified version of the `create.doc` function in the
#' \href{https://github.com/juba/rmdformats}{rmdformats} package.
#'
#' @examples
#' \dontrun{
#' # Create template for a simple HTML document
#' create_rmd_doc("my_html_doc", template = "html_simple")
#' # Create template for a PDF report document
#' create_rmd_doc("my_report", template = "pdf_report")
#' }
#' @seealso \code{\link{create_quarto_doc}} for Quarto templates.
#' @export
#'
create_rmd_doc <- function(dirname = "new-doc", template = "html_simple") {
  templates <- c("html_simple", "pdf_report",
    "pdf_simple", "word_doc", "pdf_cheatsheet")
  template <- match.arg(template, templates)
  tmp_dir <- paste(dirname, "_tmp", sep = "")
  if (file.exists(dirname) || file.exists(tmp_dir)) {
    stop(paste("Cannot run create_rmd_doc() from a directory containing already",
      dirname, "or", tmp_dir))
  }
  dir.create(tmp_dir)
  template_dir <- template

  # Get all file names in the /skeleton folder
  list_of_files <- list.files(
    system.file(file.path("rmarkdown", "templates", template_dir, "skeleton"),
      package = "UHHformats"))

  # Copy all single files and subfolders into new path
  for (i in seq_along(list_of_files)) {
    file.copy(system.file(file.path("rmarkdown", "templates", template_dir, "skeleton", list_of_files[i]),
      package = "UHHformats"), file.path(tmp_dir), recursive = TRUE)
  }

  file.rename(tmp_dir, dirname)
  file.rename(file.path(dirname, "skeleton.Rmd"), file.path(dirname, paste0(dirname, ".Rmd")))
  unlink(tmp_dir, recursive = TRUE)

}

