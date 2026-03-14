#' Create a new directory with the R Markdown template
#'
#' \code{create_rmd_doc} creates a new subdirectory inside the current directory, which will
#' contain the ready-to-use R Markdown file and all associated files.
#'
#' @param dirname Name of the directory to create.
#' @param template The name of the template to use. Default is "html_doc", other
#'   options are "pdf_doc", "pdf_report", "word_doc", and
#'   "pdf_cheatsheet".
#' @param path character; the path where the directory should be created. Default
#'   is the current working directory (".").
#' @details
#' The function is a modified version of the `create.doc` function in the
#' \href{https://github.com/juba/rmdformats}{rmdformats} package.
#'
#' @examples
#' \dontrun{
#' # Create template for a simple HTML document
#' create_rmd_doc("my_html_doc", template = "html_doc")
#' # Create template for a PDF report document
#' create_rmd_doc("my_report", template = "pdf_report")
#' # Create in a specific directory
#' create_rmd_doc("my_doc", template = "pdf_doc", path = "~/Documents")
#' }
#' @seealso \code{\link{create_quarto_doc}} for Quarto templates.
#' @export
#'
create_rmd_doc <- function(dirname = "new-doc", template = "html_doc",
  path = ".") {
  templates <- c("html_doc", "pdf_report",
    "pdf_doc", "word_doc", "pdf_cheatsheet")
  template <- match.arg(template, templates)

  target_dir <- file.path(path, dirname)
  tmp_dir <- paste(target_dir, "_tmp", sep = "")
  if (file.exists(target_dir) || file.exists(tmp_dir)) {
    stop(paste("Cannot run create_rmd_doc() from a directory containing already",
      dirname, "or", paste0(dirname, "_tmp")))
  }
  dir.create(tmp_dir, recursive = TRUE)
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

  file.rename(tmp_dir, target_dir)
  file.rename(file.path(target_dir, "skeleton.Rmd"), file.path(target_dir, paste0(dirname, ".Rmd")))
  unlink(tmp_dir, recursive = TRUE)

}
