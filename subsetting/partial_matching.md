Subsetting - Partial Matching
================

## Partial Matching

Partial matching of names is allowed with `[[` and `$`.

``` r
x <- list(aardvark = 1:5)
x$a
```

    ## [1] 1 2 3 4 5

``` r
x[["a"]]
```

    ## NULL

``` r
x[["a", exact = FALSE]]
```

    ## [1] 1 2 3 4 5
