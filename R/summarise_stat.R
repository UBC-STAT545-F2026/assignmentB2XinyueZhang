#' Summary statistics for a numeric column
#'
#' This function is a wrapper for calculating the mean, median, minimum and maximum of a numeric
#' column in a data frame, returning the results together in a tibble.
#'
#' @param data A data frame or tibble containing the column to summarise.
#'    Named "data" because it is the conventional name in R functions for referring to the input dataset.
#' @param col The name of a numeric column in data to summarise.
#'    Named "col" because this is short, and it can clearly indicates that a column is expected.
#' @param na.rm This is the logical, that decides whether to remove NA value or not before calculating.
#'    Named "na.rm" because this is conventional in R language that is used to remove the NA value in calculation.
#'
#' @return A tibble with one row and four columns: mean, median, min and max.
#'
#' @examples
#'   summarise_stat(mtcars,mpg)
#'   summarise_stat(airquality, Ozone, na.rm = TRUE)
#'   summarise_stat(dplyr::group_by(mtcars,cyl),mpg)
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
