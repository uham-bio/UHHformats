# UHHformats 1.1.0

## New features

* New Quarto `pdf_cheatsheet` template: landscape, multi-column cheatsheet with configurable colored textboxes.

## Breaking changes

* `html_material` template removed (use `html_doc` instead).
* `rmd_to_jupyter` function removed (use Quarto's native notebook conversion instead).
* `pdf_simple` renamed to `pdf_doc`; `html_simple` renamed to `html_doc`. The old names still work as aliases.
* Quarto Word template renamed from `word` to `word_doc` for consistency with the R Markdown function.
* Bootstrap removed from `html_doc` template, replaced with lightweight custom CSS and JavaScript. The template no longer depends on Bootstrap for layout, tabs, code folding, scrollspy, or dropdowns.

## Bug fixes

* Fixed `pdf_report` header rule appearing on all pages instead of only on non-section pages. Section pages now correctly use a plain page style.
* Fixed `word_doc` example referencing wrong package name (`UHHthesis` instead of `UHHformats`).
* Fixed undefined `linkcol` color in Quarto PDF `hypersetup` (both `pdf_simple` and `pdf_report`).
* Fixed scrollspy (ToC highlighting) not activating first/last sections when scrolling to page extremes.

## Other changes

* Font files consolidated into `inst/fonts/` (single location instead of per-template copies).
* HTML template styling refined: improved typography, Monaco font for code blocks, table captions, reference list formatting, hyperlink colors.
* Minimum version requirements updated: R >= 4.1.0, rmarkdown >= 2.25, pandoc >= 2.17.
* GitHub Actions updated to latest versions (v4/v2).
* Test suite added using testthat.
* `.DS_Store` files removed from version control.
* Documentation rewritten: README made compact, vignette focused on getting started.


# UHHformats 1.0.0

* Bachelor and Master thesis templates migrated to their own package named 'UHHthesis'.
* Small design makeover of various templates.
* A new Word template for R Markdown was added.
* This package version now also contains templates for Quarto documents that generate HTML, PDF, and MS Word output.
