#--------------------------------------------------------------------------------------
# The following helper functions were adopted from the 'rmdformats' and 'iosp' packages
#--------------------------------------------------------------------------------------

#' @importFrom utils packageVersion

# create an html dependency for Magnific popup
html_dependency_magnific_popup <- function() {
  htmltools::htmlDependency(name = "magnific-popup",
                            version = "1.1.0",
                            src = system.file("templates/magnific-popup-1.1.0", package = "UHHformats"),
                            script = "jquery.magnific-popup.min.js",
                            stylesheet = "magnific-popup.css")
}

# create an html dependency for jquery-stickytableheaders
html_dependency_jquery_stickytableheaders <- function()  {
  htmltools::htmlDependency(name = "jquery-stickytableheaders",
                            version = "0.1.11",
                            src = system.file("templates/jquery-stickytableheaders-0.1.11", package = "UHHformats"),
                            script = "jquery.stickytableheaders.min.js")
}


# Mathjax (functions copied from rmarkdown)
default_mathjax <- function() {
  paste0("https://mathjax.rstudio.com/latest/", mathjax_config())
}
mathjax_config <- function() {
  "MathJax.js?config=TeX-AMS-MML_HTMLorMML"
}


# Navigation.js (adapted from rmarkdown as in rmdformats)
html_dependency_navigation <- function(code_menu = TRUE, source_embed = FALSE) {
  # dynamically build script list
  script <- c("tabsets.js")
  if (code_menu)
    script <- c(script, "codefolding.js")
  if (source_embed)
    script <- c(script, "FileSaver.min.js", "sourceembed.js")
    htmltools::htmlDependency(name = "navigation",
                              version = "1.1",
                              src = system.file("templates/navigation-1.1", package = "UHHformats"),
                              script = script)
}
