
<!-- README.md is generated from README.Rmd. Please edit that file -->

# assignmentB2XinyueZhang

<!-- badges: start -->

<!-- badges: end -->

‘assignmentB2XinyueZhang’ provides the function called
‘summarise_stat()’, which calculate mean, median, minimum and maximum of
a numeric column in a data frame, and returns them in a tibble. It works
with the grouped data frame, and the user can choose whether to remove
NA value or not.

## Installation

You can install the development version of assignmentB2XinyueZhang from
[GitHub](https://github.com/UBC-STAT545-F2026/assignmentB2XinyueZhang)
with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-STAT545-F2026/assignmentB2XinyueZhang",ref="0.1.0")
```

## Usage

``` r
library(assignmentB2XinyueZhang)

# summary statistic for a numeric column
summarise_stat(mtcars, mpg)
#>       mean median  min  max
#> 1 20.09062   19.2 10.4 33.9

# remove NA values before calculating
summarise_stat(airquality, Ozone, na.rm = TRUE)
#>       mean median min max
#> 1 42.12931   31.5   1 168

# summarise statistic for each group
summarise_stat(dplyr::group_by(mtcars, cyl), mpg)
#> # A tibble: 3 × 5
#>     cyl  mean median   min   max
#>   <dbl> <dbl>  <dbl> <dbl> <dbl>
#> 1     4  26.7   26    21.4  33.9
#> 2     6  19.7   19.7  17.8  21.4
#> 3     8  15.1   15.2  10.4  19.2
```
