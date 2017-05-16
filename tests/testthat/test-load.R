context("temp_load")

test_that("temp_load fails well", {
  expect_error(temp_load("gibberish"),
  paste0("Dataset not found at: ",
  paste0(cache_path(), "data_", "gibberish", ".rds"),
  "\n Try running the appropriate `get*` and/or `compile` commands."),
  fixed = TRUE)}
)
