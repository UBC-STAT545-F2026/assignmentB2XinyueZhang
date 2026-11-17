test_that("summarise_stat works as expected", {
  test_df <- dplyr::tibble(value = c(1, 2, 3, NA),
                           label = c("q", "w", "e", "r"))
  #1. In numeric column, NA is removed. The stat summarise result should be calculated from 1, 2, 3.
  expect_equal(summarise_stat(test_df, value),
               dplyr::tibble(
                 mean = 2,
                 median = 2,
                 min = 1,
                 max = 3
               ))
  #2. when calculation include NA, mean should also be NA
  expect_true(is.na(summarise_stat(test_df, value, na.rm = FALSE)$mean))
  #3. when calculate with non numeric column, output should be an error
  expect_error(summarise_stat(test_df, label), "must be numeric")
})
