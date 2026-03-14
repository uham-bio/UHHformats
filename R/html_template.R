
#-----------------------------------------------------------------------
# The following template function is adopted from the 'rmdformats' package
# that is called by html_doc()
#-----------------------------------------------------------------------

html_template <- function(template_name, template_path,
  template_dependencies, pandoc_args, ...) {

    args <- list(...)
    ## For compatibility with pkgdown
    args$template <- NULL

    ## Extract custom args before removing them
    code_folding <- args[["code_folding"]]
    code_folding <- ifelse(is.null(code_folding), "none", code_folding)
    code_download <- args[["code_download"]]
    code_download <- ifelse(is.null(code_download), FALSE, code_download)
    code_menu <- !identical(code_folding, "none") || code_download

    lightbox <- isTRUE(args[["lightbox"]])
    thumbnails <- isTRUE(args[["thumbnails"]])
    gallery <- isTRUE(args[["gallery"]])
    cards <- isTRUE(args[["cards"]])
    use_bookdown <- isTRUE(args[["use_bookdown"]])

    ## Remove args we handle ourselves (prevents rmarkdown from requiring Bootstrap)
    args[["code_folding"]] <- NULL
    args[["code_download"]] <- NULL
    args[["lightbox"]] <- NULL
    args[["thumbnails"]] <- NULL
    args[["gallery"]] <- NULL
    args[["cards"]] <- NULL
    args[["use_bookdown"]] <- NULL

    ## js and css dependencies
    extra_dependencies <- c(
        list(
            rmarkdown::html_dependency_jquery(),
            rmarkdown::html_dependency_jqueryui(),
            html_dependency_navigation(
                code_menu = code_menu,
                source_embed = code_download
            ),
            html_dependency_magnific_popup()
        ),
        template_dependencies
    )
    ## Merge "extra_dependencies"
    if ("extra_dependencies" %in% names(args)) {
        extra_dependencies <- append(extra_dependencies, args[["extra_dependencies"]])
        args[["extra_dependencies"]] <- NULL
        args[["mathjax"]] <- NULL
    }

    ## Force mathjax arguments
    if (!is.null(args[["mathjax"]])) {
        pandoc_args <- c(pandoc_args,
                         "--mathjax",
                         "--variable", paste0("mathjax-url:", default_mathjax()))
    }
    ## Remove mathjax from args (we handle it via pandoc_args)
    args[["mathjax"]] <- NULL

    ## Code folding and menu pandoc variables
    if (code_menu) {
        pandoc_args <- c(pandoc_args, "--variable", "code_menu:1")
    }
    if (!identical(code_folding, "none")) {
        pandoc_args <- c(pandoc_args, "--variable", paste0("code_folding:", code_folding))
    }
    if (code_download) {
        pandoc_args <- c(pandoc_args, "--variable", paste0("source_embed:", code_download))
    }

    ## Other arguments
    pandoc_args <- c(pandoc_args,
                     "--variable", paste0(template_name, ":true"))
    if (lightbox) {
        pandoc_args <- c(pandoc_args, "--variable", "lightbox:true")
    }
    if (thumbnails) {
        pandoc_args <- c(pandoc_args, "--variable", "thumbnails:true")
    }
    if (gallery) {
        pandoc_args <- c(pandoc_args, "--variable", "gallery:true")
    } else {
        pandoc_args <- c(pandoc_args, "--variable", "gallery:false")
    }
    if (cards) {
        pandoc_args <- c(pandoc_args, "--variable", "cards:true")
    }


    ## Call rmarkdown::html_document
    html_document_args <- list(
        template = system.file(template_path, package = "UHHformats"),
        extra_dependencies = extra_dependencies,
        pandoc_args = pandoc_args,
        theme = NULL  # disable rmarkdown's built-in Bootstrap injection
    )
    html_document_args <- append(html_document_args, args)
    if (use_bookdown) {
        html_document_func <- bookdown::html_document2
    } else {
        html_document_func <- rmarkdown::html_document
    }

    do.call(html_document_func, html_document_args)

}
