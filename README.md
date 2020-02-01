
# Bizarro

<img src="bizarro.jpg" width="40%" style="display: block; margin: auto;" />

This toy packages transforms inputs into “bizarro outputs”. This was
created as an exercise for the [***Building Tidy
Tools***](https://github.com/rstudio-conf-2020/build-tidy-tools)
workshop at RStudio Conference 2020. It contains a single generic
function “bizarro”, powered by the R’s S3 object-oriented system.

**Install with**

``` r
install_github("acastroaraujo/bizarro")
```

**Examples**

``` r
ex <- list(character = "andres castro araujo",
           numeric = 1:10, 
           factor = factor(stringr::fruit[1:5]),
           logical = c(TRUE, FALSE, NA, FALSE, TRUE)
           )

str(ex)
```

    < List of 4
    <  $ character: chr "andres castro araujo"
    <  $ numeric  : int [1:10] 1 2 3 4 5 6 7 8 9 10
    <  $ factor   : Factor w/ 5 levels "apple","apricot",..: 1 2 3 4 5
    <  $ logical  : logi [1:5] TRUE FALSE NA FALSE TRUE

``` r
str(lapply(ex, bizarro))
```

    < List of 4
    <  $ character: chr "ojuara ortsac serdna"
    <  $ numeric  : int [1:10] -1 -2 -3 -4 -5 -6 -7 -8 -9 -10
    <  $ factor   : Factor w/ 5 levels "reppep lleb",..: 5 4 3 2 1
    <  $ logical  : logi [1:5] FALSE TRUE NA TRUE FALSE

``` r
bizarro(iris)
```

    < # A tibble: 150 x 5
    <    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    <           <dbl>       <dbl>        <dbl>       <dbl> <fct>  
    <  1         -5.1        -3.5         -1.4        -0.2 asotes 
    <  2         -4.9        -3           -1.4        -0.2 asotes 
    <  3         -4.7        -3.2         -1.3        -0.2 asotes 
    <  4         -4.6        -3.1         -1.5        -0.2 asotes 
    <  5         -5          -3.6         -1.4        -0.2 asotes 
    <  6         -5.4        -3.9         -1.7        -0.4 asotes 
    <  7         -4.6        -3.4         -1.4        -0.3 asotes 
    <  8         -5          -3.4         -1.5        -0.2 asotes 
    <  9         -4.4        -2.9         -1.4        -0.2 asotes 
    < 10         -4.9        -3.1         -1.5        -0.1 asotes 
    < # … with 140 more rows
