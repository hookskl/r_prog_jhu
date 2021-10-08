Subsetting - Removing Missing Values
================

## Removing NA Values

A common task is to remove missing values (`NA`s). A simple a approach
to this is create a logical vector using `is.na` and then subsetting the
data.

``` r
x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]
```

    ## [1] 1 2 4 5

What if there are multiple things and you want to take the subset with
no missing values?

``` r
x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", NA, NA, "d", NA, "f")
good <- complete.cases(x, y)
good
```

    ## [1]  TRUE FALSE FALSE  TRUE FALSE  TRUE

``` r
x[good]
```

    ## [1] 1 4 5

``` r
y[good]
```

    ## [1] "a" "d" "f"

Note the behavior of `complete.cases` above, where if only one
corresponding element from the two vectors is missing then it considers
this to be an “incomplete” case.
