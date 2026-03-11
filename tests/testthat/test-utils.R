test_that("find_resource() locates RMarkdown template files", {
  res <- find_resource("pdf_simple", "template.tex", type = "rmarkdown")
  expect_true(file.exists(res))
  expect_true(grepl("template\\.tex$", res))
})

test_that("find_resource() locates Quarto Word template files", {
  res <- find_resource("word_doc", "uhh-template-helvetica.docx", type = "quarto")
  expect_true(file.exists(res))
})

test_that("find_resource() errors for nonexistent files", {
  expect_error(
    find_resource("pdf_simple", "nonexistent.tex"),
    "Couldn't find template file"
  )
})

test_that("copy_font_files() copies Helvetica fonts", {
  withr::with_tempdir({
    copy_font_files("pdf_simple", "Helvetica", current_dir = ".")
    expect_true(file.exists("font_regular.ttf"))
    expect_true(file.exists("font_bold.ttf"))
    expect_true(file.exists("font_italic.ttf"))
    expect_true(file.exists("font_bolditalic.ttf"))
  })
})

test_that("copy_font_files() copies TheSansUHH fonts", {
  withr::with_tempdir({
    copy_font_files("pdf_simple", "TheSansUHH", current_dir = ".")
    expect_true(file.exists("font_regular.ttf"))
    expect_true(file.exists("font_bold.ttf"))
    expect_true(file.exists("font_italic.ttf"))
    expect_true(file.exists("font_bolditalic.ttf"))
  })
})
