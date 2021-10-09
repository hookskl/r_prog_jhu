Loop Functions - tapply
================

## tapply

`tapply` is used to apply a function over subsets of a vector. In this
case the name isn’t conducive to how the function operates.

``` r
str(tapply)
```

    ## function (X, INDEX, FUN = NULL, ..., default = NA, simplify = TRUE)

-   `X` is a vector
-   `INDEX` is a factor or a list of factors (or else they are coerced
    to factors)
-   `FUN` is a function to be applied
-   `...` contains other arguments to be passed to `FUN`
-   `simplify` logical whether result should be simplified

Take group means.

``` r
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
f
```

    ##  [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3
    ## Levels: 1 2 3

``` r
tapply(x, f, mean)
```

    ##         1         2         3 
    ## 0.4236868 0.5593030 1.4045752

Find group ranges.

``` r
tapply(x, f, range)
```

    ## $`1`
    ## [1] -0.6048852  1.5128005
    ## 
    ## $`2`
    ## [1] 0.1076789 0.9672117
    ## 
    ## $`3`
    ## [1] 0.1274499 2.1072814
