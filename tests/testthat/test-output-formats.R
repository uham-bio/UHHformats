test_that("html_simple() returns a valid output format", {
  fmt <- html_simple()
  expect_s3_class(fmt, "rmarkdown_output_format")
})

test_that("pdf_simple() returns a valid output format", {
  fmt <- pdf_simple()
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
