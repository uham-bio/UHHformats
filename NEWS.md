# UHHformats 1.1.0

## New features

* New Quarto `pdf_cheatsheet` template: landscape, multi-column cheatsheet with configurable colored textboxes.
* Quarto extension available: install via `quarto add uham-bio/UHHformats` for standalone use without R.

## Breaking changes

* `html_material` template removed (use `html_simple` instead).
* `rmd_to_jupyter` function removed (use Quarto's native notebook conversion instead).
* Quarto Word template renamed from `word` to `word_doc` for consistency with the R Markdown function.
* Bootstrap upgraded from 3.3.7 to 5.3.3 in `html_simple`. Glyphicons are no longer available; tabset dropdown indicators now use Unicode characters.

## Bug fixes

* Fixed `word_doc` example referencing wrong package name (`UHHthesis` instead of `UHHformats`).
* Fixed undefined `linkcol` color in Quarto PDF `hypersetup` (both `pdf_simple` and `pdf_report`).

## Other changes

* Font files consolidated into `inst/fonts/` (single location instead of per-template copies).
* Minimum version requirements updated: R >= 4.1.0, rmarkdown >= 2.25, pandoc >= 2.17.
* GitHub Actions updated to latest versions (v4/v2).
* Test suite added using testthat.
* `.DS_Store` files removed from version control.


# UHHformats 1.0.0

* Bachelor and Master thesis templates migrated to their own package named 'UHHthesis'.
* Small design makeover of various templates.
* A new Word template for R Markdown was added.
* This package version now also contains templates for Quarto documents that generate HTML, PDF, and MS Word output.
