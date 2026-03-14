test_that("html_doc() returns a valid output format", {
  fmt <- html_doc()
  expect_s3_class(fmt, "rmarkdown_output_format")
})

test_that("pdf_doc() returns a valid output format", {
  fmt <- pdf_doc()
  expect_s3_class(fmt, "rmarkdown_output_format")
})

test_that("pdf_report() returns a valid output format", {
  fmt <- pdf_report()
  expect_s3_class(fmt, "rmarkdown_output_format")
})

test_that("pdf_cheatsheet() returns a valid output format", {
  fmt <- pdf_cheatsheet()
  expect_s3_class(fmt, "rmarkdown_output_format")
})

test_that("word_doc() returns a valid output format", {
  fmt <- word_doc()
  expect_s3_class(fmt, "rmarkdown_output_format")
})

test_that("deprecated html_simple() still works", {
  expect_warning(fmt <- html_simple(), "deprecated")
  expect_s3_class(fmt, "rmarkdown_output_format")
})

test_that("deprecated pdf_simple() still works", {
  expect_warning(fmt <- pdf_simple(), "deprecated")
  expect_s3_class(fmt, "rmarkdown_output_format")
})
