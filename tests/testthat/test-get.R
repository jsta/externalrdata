test_that("urls are valid", {
  baseurl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/"
  testthat::expect_true(externalrdata:::url_exists(baseurl))
})
