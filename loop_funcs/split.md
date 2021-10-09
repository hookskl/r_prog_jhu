Loop Functions - split
================

## split

`split` is not a loop function, but is useful when combined with the
`apply` family. This function takes a vector or other objects and splits
it into groups determined by a factor or list of factors.

``` r
str(split)
```

    ## function (x, f, drop = FALSE, ...)

-   `x` vector/list or data frame
-   `f` factor (or coerced to one) or a list of factors
-   `drop` indicates whether empty factors levels should be dropped

`split` always returns a list.

``` r
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)
```

    ## $`1`
    ##  [1] -0.09318624  0.76504400  0.21142589  0.32342562  0.17371619 -1.41764005
    ##  [7]  0.66151404  0.20920131  1.80538808  0.53359041
    ## 
    ## $`2`
    ##  [1] 0.65095004 0.86394955 0.74169174 0.80015947 0.82851784 0.26269831
    ##  [7] 0.87575242 0.88926191 0.87059612 0.06468143
    ## 
    ## $`3`
    ##  [1]  0.13385068  0.90014413 -0.28047409  0.72705574 -0.13713824  1.36175783
    ##  [7] -0.13686644  0.41747509  1.07645000  0.09046328

A common idiom is to use `split` followed by an `lapply`.

``` r
split(x, f) |>
  lapply(mean)
```

    ## $`1`
    ## [1] 0.3172479
    ## 
    ## $`2`
    ## [1] 0.6848259
    ## 
    ## $`3`
    ## [1] 0.4152718

## Splitting a Data Frame

``` r
library(datasets)
head(airquality)
```

    ##   Ozone Solar.R Wind Temp Month Day
    ## 1    41     190  7.4   67     5   1
    ## 2    36     118  8.0   72     5   2
    ## 3    12     149 12.6   74     5   3
    ## 4    18     313 11.5   62     5   4
    ## 5    NA      NA 14.3   56     5   5
    ## 6    28      NA 14.9   66     5   6

One thing we might want to do is calculate the means of each column,
grouped by each month.

``` r
split(airquality, airquality$Month) |>
  sapply(function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], 
                              na.rm = TRUE))
```

    ##                 5         6          7          8         9
    ## Ozone    23.61538  29.44444  59.115385  59.961538  31.44828
    ## Solar.R 181.29630 190.16667 216.483871 171.857143 167.43333
    ## Wind     11.62258  10.26667   8.941935   8.793548  10.18000

## Splitting on More Than One Level

``` r
x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
interaction(f1, f2)
```

    ##  [1] 1.1 1.1 1.2 1.2 1.3 2.3 2.4 2.4 2.5 2.5
    ## Levels: 1.1 2.1 1.2 2.2 1.3 2.3 1.4 2.4 1.5 2.5

Interactions can create empty levels.

``` r
str(split(x, list(f1, f2)))
```

    ## List of 10
    ##  $ 1.1: num [1:2] -1.89 -2.61
    ##  $ 2.1: num(0) 
    ##  $ 1.2: num [1:2] -0.398 0.177
    ##  $ 2.2: num(0) 
    ##  $ 1.3: num 2.7
    ##  $ 2.3: num -0.702
    ##  $ 1.4: num(0) 
    ##  $ 2.4: num [1:2] -1.41 -0.15
    ##  $ 1.5: num(0) 
    ##  $ 2.5: num [1:2] -1.03 -1.94

Specifying `drop = TRUE` will remove these empty levels.

``` r
str(split(x, list(f1, f2), drop = TRUE))
```

    ## List of 6
    ##  $ 1.1: num [1:2] -1.89 -2.61
    ##  $ 1.2: num [1:2] -0.398 0.177
    ##  $ 1.3: num 2.7
    ##  $ 2.3: num -0.702
    ##  $ 2.4: num [1:2] -1.41 -0.15
    ##  $ 2.5: num [1:2] -1.03 -1.94
