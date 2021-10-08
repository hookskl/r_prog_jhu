Subsetting Lists
================

## Subsetting Lists

``` r
x <- list(foo = 1:4, bar = 0.6)
x[1]
```

    ## $foo
    ## [1] 1 2 3 4

``` r
x[[1]]
```

    ## [1] 1 2 3 4

``` r
x$bar
```

    ## [1] 0.6

``` r
x[["bar"]]
```

    ## [1] 0.6

``` r
x["bar"]
```

    ## $bar
    ## [1] 0.6

Getting multiple elements from a list:

``` r
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]
```

    ## $foo
    ## [1] 1 2 3 4
    ## 
    ## $baz
    ## [1] "hello"

The `[[` operator can be used with *computed* indices; `$` can only be
used with literal names.

``` r
name <- "foo"
x[[name]] ## computed index for `foo`
```

    ## [1] 1 2 3 4

``` r
x$name
```

    ## NULL

``` r
x$foo
```

    ## [1] 1 2 3 4

## Subsetting Nested Elements of a List

The `[[` can take an integer sequence. This works the same as double
subsetting.

``` r
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x[[c(1,3)]]
```

    ## [1] 14

``` r
x[[1]][[3]]
```

    ## [1] 14
