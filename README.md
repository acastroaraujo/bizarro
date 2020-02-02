
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BIZARRO

<!-- badges: start -->

<!-- badges: end -->

<img src="bizarro.jpg" width="40%" />

  - This toy packages transforms inputs into “bizarro outputs”.

  - It was created as an exercise for the [***Building Tidy
    Tools***](https://github.com/rstudio-conf-2020/build-tidy-tools)
    workshop at RStudio Conference 2020.

  - It contains a single generic function `bizarro()`, powered by the
    R’s S3 object-oriented system.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("acastroaraujo/bizarro")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(bizarro)

bizarro("andrés castro araújo")
#< [1] "ojúara ortsac sérdna"

## works on lists
example <- list(numeric = 1:10, 
                factor = factor(stringr::fruit[1:5]),
                logical = c(TRUE, FALSE, NA, FALSE, TRUE)
                )

bizarro(example)
#< $numeric
#<  [1]  -1  -2  -3  -4  -5  -6  -7  -8  -9 -10
#< 
#< $factor
#< [1] elppa       tocirpa     odacova     ananab      reppep lleb
#< Levels: reppep lleb ananab odacova tocirpa elppa
#< 
#< $logical
#< [1] FALSE  TRUE    NA  TRUE FALSE

## works on data frames (and nested data frames)
bizarro(iris)
#< # A tibble: 150 x 5
#<    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#<           <dbl>       <dbl>        <dbl>       <dbl> <fct>  
#<  1         -5.1        -3.5         -1.4        -0.2 asotes 
#<  2         -4.9        -3           -1.4        -0.2 asotes 
#<  3         -4.7        -3.2         -1.3        -0.2 asotes 
#<  4         -4.6        -3.1         -1.5        -0.2 asotes 
#<  5         -5          -3.6         -1.4        -0.2 asotes 
#<  6         -5.4        -3.9         -1.7        -0.4 asotes 
#<  7         -4.6        -3.4         -1.4        -0.3 asotes 
#<  8         -5          -3.4         -1.5        -0.2 asotes 
#<  9         -4.4        -2.9         -1.4        -0.2 asotes 
#< 10         -4.9        -3.1         -1.5        -0.1 asotes 
#< # … with 140 more rows

## doesn't work on dates
bizarro(as.Date("1990-04-03"))
#< Error: Don't know how to make bizzaro <Date>
```
