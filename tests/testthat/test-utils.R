test_that("find_resource() locates RMarkdown template files", {
  res <- find_resource("pdf_doc", "template.tex", type = "rmarkdown")
  expect_true(file.exists(res))
  expect_true(grepl("template\\.tex$", res))
})

test_that("find_resource() locates Quarto Word template files", {
  res <- find_resource("word_doc", "uhh-template-helvetica.docx", type = "quarto")
  expect_true(file.exists(res))
})

test_that("find_resource() errors for nonexistent files", {
  expect_error(
    find_resource("pdf_doc", "nonexistent.tex"),
    "Couldn't find template file"
  )
})

test_that("font_dir() returns valid font directory", {
  dir <- font_dir("Helvetica")
  expect_true(dir.exists(dir))
  expect_true(any(grepl("\\.ttf$", list.files(dir))))
})

test_that("font_dir() errors for nonexistent font", {
  expect_error(font_dir("NonexistentFont"), "Couldn't find font directory")
})

test_that("copy_font_files() copies Helvetica fonts into styles/", {
  withr::with_tempdir({
    copy_font_files("pdf_doc", "Helvetica", current_dir = ".")
    expect_true(file.exists("styles/font_regular.ttf"))
    expect_true(file.exists("styles/font_bold.ttf"))
    expect_true(file.exists("styles/font_italic.ttf"))
    expect_true(file.exists("styles/font_bolditalic.ttf"))
  })
})

test_that("copy_font_files() copies TheSansUHH fonts into styles/", {
  withr::with_tempdir({
    copy_font_files("pdf_doc", "TheSansUHH", current_dir = ".")
    expect_true(file.exists("styles/font_regular.ttf"))
    expect_true(file.exists("styles/font_bold.ttf"))
    expect_true(file.exists("styles/font_italic.ttf"))
    expect_true(file.exists("styles/font_bolditalic.ttf"))
  })
})
