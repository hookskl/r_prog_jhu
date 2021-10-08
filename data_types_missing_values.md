Data Types - Missing Values
================

## Missing Values

Missing values are denoted by `NA` or `NaN` for undefined mathematical
operations.

-   `is.na()` is used to test objects if they are `NA`
-   `is.nan()` is used to test objects if they are `NaN`
-   `NA` values have a class also, so there are integer `NA`, character
    `NA`, etc.
-   A `NaN` value is also `NA` but the converse is not true

``` r
x <- c(1, 2, NA, 10, 3)
print(is.na(x))
```

    ## [1] FALSE FALSE  TRUE FALSE FALSE

``` r
print(is.nan(x))
```

    ## [1] FALSE FALSE FALSE FALSE FALSE

``` r
x <- c(1, 2, NaN, NA, 4)
print(is.na(x))
```

    ## [1] FALSE FALSE  TRUE  TRUE FALSE

``` r
print(is.nan(x))
```

    ## [1] FALSE FALSE  TRUE FALSE FALSE
