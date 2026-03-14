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


# Get the path to the font directory for a given font family in the package.
font_dir <- function(font) {
  res <- system.file("fonts", font, package = "UHHformats")
  if (res == "") stop("Couldn't find font directory for ", font, call. = FALSE)
  return(res)
}

# Standard font filenames (same for all font families)
font_files <- c(
  font_regular    = "regular.ttf",
  font_italic     = "italic.ttf",
  font_bold       = "bold.ttf",
  font_bolditalic = "bolditalic.ttf"
)

# Build pandoc variable arguments for font files.
# Returns a character vector of --variable args for fontpath and font filenames.
# Used by R Markdown format functions so LaTeX templates reference fonts from
# the package directory without copying.
font_pandoc_args <- function(font) {
  if (!font %in% c("Helvetica", "TheSansUHH")) return(character(0))
  fontpath <- font_dir(font)
  c(
    "--variable", paste0("fontpath=", fontpath),
    "--variable", paste0("font_regular=", font_files["font_regular"]),
    "--variable", paste0("font_italic=", font_files["font_italic"]),
    "--variable", paste0("font_bold=", font_files["font_bold"]),
    "--variable", paste0("font_bolditalic=", font_files["font_bolditalic"])
  )
}


# Copy font files into styles/ subdirectory for standalone Quarto documents.
copy_font_files <- function(template, font, type = "rmarkdown", current_dir = ".") {
  if (!font %in% c("Helvetica", "TheSansUHH")) return(invisible(NULL))
  fontpath <- font_dir(font)
  styles_dir <- file.path(current_dir, "styles")
  if (!dir.exists(styles_dir)) dir.create(styles_dir, recursive = TRUE)
  for (f in font_files) {
    file.copy(
      from = file.path(fontpath, f),
      to = file.path(styles_dir, paste0("font_", f)),
      overwrite = TRUE
    )
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


