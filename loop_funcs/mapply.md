Loop Functions - mapply
================

## mapply

`mapply` is a multivariate apply of sorts. It applies a function in
parallel over a set of arguments.

``` r
str(mapply)
```

    ## function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)

-   `FUN` is a function to be applied
-   `...` contains arguments to apply over
-   `MoreArgs` is a list of other arguments to `FUN`
-   `SIMPLIFY` indicates whether the result should be simplified

Something very tedious to type,
`list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1)`, could instead be
written as:

``` r
mapply(rep, 1:4, 4:1)
```

    ## [[1]]
    ## [1] 1 1 1 1
    ## 
    ## [[2]]
    ## [1] 2 2 2
    ## 
    ## [[3]]
    ## [1] 3 3
    ## 
    ## [[4]]
    ## [1] 4

## Vectorizing a Function

``` r
noise <- function(n, mean, sd) {
  rnorm(n, mean, sd)
}

noise(5, 1, 2)
```

    ## [1]  3.1957852  1.4222218 -0.2950989 -1.6150921  2.3899249

``` r
noise(1:5, 1:5, 2) # doesn't give desired result
```

    ## [1] 1.9172178 0.9724051 6.0365084 6.8178967 3.8405702

## Instant Vectorization

``` r
mapply(noise, 1:5, 1:5, 2)
```

    ## [[1]]
    ## [1] 2.035169
    ## 
    ## [[2]]
    ## [1] 3.633180 3.107269
    ## 
    ## [[3]]
    ## [1] 4.4013909 0.4852371 4.3289688
    ## 
    ## [[4]]
    ## [1] 3.422126 2.136187 3.290513 8.755952
    ## 
    ## [[5]]
    ## [1] 0.8283513 4.0371150 6.2017107 5.9747941 5.7766386

The power of this is a function that doesn’t normally take vectors as an
input can be used in a way that does.
