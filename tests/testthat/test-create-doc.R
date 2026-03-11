test_that("create_rmd_doc() creates expected directory structure", {
  withr::with_tempdir({
    create_rmd_doc("test_doc", template = "html_simple")
    expect_true(dir.exists("test_doc"))
    expect_true(file.exists("test_doc/test_doc.Rmd"))
    expect_true(dir.exists("test_doc/bib"))
    expect_true(dir.exists("test_doc/data"))
    expect_true(dir.exists("test_doc/images"))
  })
})

test_that("create_rmd_doc() rejects invalid templates", {
  withr::with_tempdir({
    expect_error(
      create_rmd_doc("test_doc", template = "nonexistent"),
      "arg"
    )
  })
})

test_that("create_quarto_doc() creates expected directory structure", {
  withr::with_tempdir({
    create_quarto_doc("test_doc", template = "html")
    expect_true(dir.exists("test_doc"))
    expect_true(file.exists("test_doc/test_doc.qmd"))
  })
})

test_that("create_quarto_doc() rejects invalid templates", {
  withr::with_tempdir({
    expect_error(
      create_quarto_doc("test_doc", template = "nonexistent"),
      "arg"
    )
  })
})

test_that("create_rmd_doc() errors when directory already exists", {
  withr::with_tempdir({
    dir.create("existing_dir")
    expect_error(
      create_rmd_doc("existing_dir"),
      "Cannot run"
    )
  })
})
