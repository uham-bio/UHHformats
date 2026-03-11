#' Create a new directory with the Quarto template
#'
#' \code{create_quarto_doc} creates a new subdirectory inside the current directory, which will
#' contain the ready-to-use Quarto file and all associated files. The Word and PDF templates are
#' based on the standard template of the University of Hamburg.
#'
#' @param dirname character; the name of the directory to create.
#' @param template character; the template type to use. Choose "html" (default),
#'   "pdf_simple", "pdf_report", or "word_doc".
#' @param font The font family of the document. Default is "Helvetica" (i.e. Helvetica Neue).
#'   For members of the UHH, there is also the font "TheSansUHH" available for the PDF and Word document.
#'
#' @examples
#' \dontrun{
#'  # Create template for HTML document
#'  create_quarto_doc(dirname = "my_html_doc", template = "html")
#'  # Create template for simple PDF document using the default font 'Helvetica'
#'  create_quarto_doc(dirname = "my_pdf_doc", template = "pdf_simple")
#'  # Create template for Word document using the University's
#'  # font 'TheSansUHH'
#'  create_quarto_doc(dirname = "my_word_doc", template = "word_doc", font = "TheSansUHH")
#' }
#' @export

create_quarto_doc <- function(dirname = "new-doc", template = "html",
  font = "Helvetica") {

  if (!font %in% c("Helvetica", "TheSansUHH", "other")) {
    stop('Set the font option to "Helvetica" or "TheSansUHH".')
  }

  templates <- c("html", "pdf_simple", "pdf_report", "word_doc")
  template <- match.arg(template, templates)
  tmp_dir <- paste(dirname, "_tmp", sep = "")
  if (file.exists(dirname) || file.exists(tmp_dir)) {
    stop(paste("Cannot run create_quarto_doc() from a directory containing already",
      dirname, "or", tmp_dir))
  }
  dir.create(tmp_dir)
  template_dir <- template

  # Get all file names in the template folder
  list_of_files <- list.files(
    system.file(file.path("quarto", "templates", template_dir, "skeleton"),
      package = "UHHformats"))

  # Copy all single files and subfolders in skeleton/ into new path
  for (i in seq_along(list_of_files)) {
    file.copy(system.file(file.path("quarto", "templates", template_dir, "skeleton", list_of_files[i]),
      package = "UHHformats"), file.path(tmp_dir), recursive = TRUE)
  }


  # Copy selected resource file into new path
  if (template %in% c("pdf_simple", "pdf_report")) {
    copy_font_files(template, font, type = "quarto", current_dir = tmp_dir)
  }

  if (template == "word_doc") {
    if (font == "Helvetica") filename <- "uhh-template-helvetica.docx"
    if (font == "TheSansUHH") filename <- "uhh-template-thesansuhh.docx"
    file.copy(
      from = find_resource("word_doc", file = filename, type = "quarto"),
      to = file.path(tmp_dir, "uhh-template.docx")
    )
  }

  file.rename(tmp_dir, dirname)
  file.rename(file.path(dirname, "skeleton.qmd"), file.path(dirname, paste0(dirname, ".qmd")))
  unlink(tmp_dir, recursive = TRUE)

}

