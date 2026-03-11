#-----------------------------------------------------------------------
# ----- Utility functions for RMarkdown and Quarto templates -----------
#-----------------------------------------------------------------------

### Both types

find_resource <- function(template, file, type = "rmarkdown") {
  types <- c("rmarkdown", "quarto")
  type <- match.arg(type, types)
  if (type == "rmarkdown") {
    res <- system.file(
      "rmarkdown", "templates", template, "resources", file, package = "UHHformats"
    )
  }
  if (type == "quarto") {
    res <- system.file(
      "quarto", "templates", template, "resources", file, package = "UHHformats"
    )
  }
  if (res == "") stop(
    "Couldn't find template file ", template, "/resources/", file, call. = FALSE
  )
  return(res)
}


# Helper function to copy font files under different name into working directory
copy_font_files <- function(template, font, type = "rmarkdown", current_dir = ".") {
  find_font <- function(font_family, filename) {
    res <- system.file("fonts", font_family, filename, package = "UHHformats")
    if (res == "") stop("Couldn't find font file ", font_family, "/", filename, call. = FALSE)
    return(res)
  }
  file_copy <- function(font, input, output, current_dir) {
    file.copy(
      from = find_font(font, input),
      to = file.path(current_dir, output), overwrite = TRUE
    )
  }
  if (font == "Helvetica") {
    file_copy(font, "HelNeueLight8.ttf", "font_regular.ttf", current_dir)
    file_copy(font, "HelNeueLightItalic9.ttf", "font_italic.ttf", current_dir)
    file_copy(font, "HelNeueBold2.ttf", "font_bold.ttf", current_dir)
    file_copy(font, "HelNeueBoldItalic4.ttf", "font_bolditalic.ttf", current_dir)
  }
  if (font == "TheSansUHH") {
    file_copy(font, "ftsr8a.ttf", "font_regular.ttf", current_dir)
    file_copy(font, "ftsri8a.ttf", "font_italic.ttf", current_dir)
    file_copy(font, "ftsb8a.ttf", "font_bold.ttf", current_dir)
    file_copy(font, "ftsbi8a.ttf", "font_bolditalic.ttf", current_dir)
  }
}


### R Markdown-specific functions

# Helper function to create a custom format derived from rmarkdown::pdf_document
# that includes a custom LaTeX template
rmd_pdf_document_format <- function(format,
    template = find_resource(format, file = 'template.tex'), ...) {
  fmt <- rmarkdown::pdf_document(..., template = template)
  fmt$inherits <- "pdf_document"
  return(fmt)
}


# Helper function to create a custom format derived from bookdown::word_document2
# that includes a custom UHH Word template
rmd_word_document_format <- function(format, filename, ...) {
  template <- find_resource(format, file = filename)
  fmt <- bookdown::word_document2(..., reference_docx = template)
  return(fmt)
}


