% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_rmd_doc.R
\name{create_rmd_doc}
\alias{create_rmd_doc}
\title{Create a new directory with the R Markdown template}
\usage{
create_rmd_doc(dirname = "new-doc", template = "html_simple")
}
\arguments{
\item{dirname}{Name of the directory to create.}

\item{template}{The name of the template to use. Default is "html_simple", other
options are "html_material", "pdf_simple", "pdf_report", "word_doc", and
"pdf_cheatsheet".}
}
\description{
\code{create_rmd_doc} creates a new subdirectory inside the current directory, which will
contain the ready-to-use R Markdown file and all associated files.
}
\details{
The function is a modified version of the \code{create.doc} function in the
\href{https://github.com/juba/rmdformats}{rmdformats} package.
}
\examples{
\dontrun{
# Create template for a simple HTML document
create_rmd_doc("my_html_doc", template = "html_simple")
# Create template for a PDF report document
create_rmd_doc("my_report", template = "pdf_report")
}
}
