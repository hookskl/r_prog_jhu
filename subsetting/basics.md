Subsetting - Basics
================

## Subsetting

There are a number of operators that can be used to extract subsets of R
objects.

-   `[` always returns an object of the same class ase the original; can
    be used to select more than one element (there is one exception)
-   `[[` is used to extract elements of a list or a data frame; it can
    only be used to extract a single element and the class of the
    returned object will not necessarily be a list or data frame
-   `$` is used to extract elements of a list or data frame by name;
    semantics are similar to that of `[[`

``` r
# numerical indexing
x <- c("a", "b", "c", "c", "d", "a")
x[1]
```

    ## [1] "a"

``` r
x[2]
```

    ## [1] "b"

``` r
x[1:4]
```

    ## [1] "a" "b" "c" "c"

``` r
# logical indexing
x[x > "a"]
```

    ## [1] "b" "c" "c" "d"

``` r
# create a logical vector for indexing
u <- x > "a"
u
```

    ## [1] FALSE  TRUE  TRUE  TRUE  TRUE FALSE

``` r
x[u]
```

    ## [1] "b" "c" "c" "d"
