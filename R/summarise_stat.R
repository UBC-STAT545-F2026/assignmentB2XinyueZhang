#' Summary statistics for numeric column
#'
#' This function is a wrapper for calculating mean, median, minimum and maximum for a numeric column
#'  in a data frame, returning the outcome together in a tibble.
#'
#' @param data A dataframe or tibble that containing the column to summarise.
#'  Named "data" because this is a conventional name in function writting to referring dataset.
#' @param col The name of numeric column in the dataframe that used to summarise.
#'  Named "col" because this is short, and it can clearly indicate here is expecting a column.
#' @param na.rm This is the logical, that decide whether to remove NA value or not before calculating.
#'  Named "na.rm" because this is conventional in r language that used to remove the NA value in calculation.
#'
#' @return A tibble with one row and four columns, include mean, median, min and max.
#'
#' @examples
#' summarise_stat(mtcars,mpg)
#' summarise_stat(airquality, Ozone, na.rm = TRUE)
#' summarise_stat(dplyr::group_by(mtcars,cyl),mpg)
#'
#' @export
summarise_stat <- function(data, col, na.rm = TRUE) {
  # using if() to include only numeric value in the stat calculation
  if (!is.numeric(dplyr::pull(data, {{col}}))) {
    stop("'col' must be numeric")
  }
  dplyr::summarise(
    data,
    #calculating mean
    mean = mean({{col}}, na.rm = na.rm),
    # calculating median
    median = stats::median({{col}}, na.rm = na.rm),
    # calculating minimum value
    min = min({{col}}, na.rm = na.rm),
    # calculating max value
    max = max({{col}}, na.rm = na.rm)
  )
}
