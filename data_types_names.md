Data Types - Names Attributes
================

## Names

R objects can also have names, which is very useful for writing readable
code and self-describing objects.

``` r
x <- 1:3
print(names(x))
```

    ## NULL

``` r
names(x) <- c("foo", "bar", "norf")
print(x)
```

    ##  foo  bar norf 
    ##    1    2    3

``` r
print(names(x))
```

    ## [1] "foo"  "bar"  "norf"

Lists can also have names.

``` r
x <- list(a = 1, b = 2, c = 3)
x
```

    ## $a
    ## [1] 1
    ## 
    ## $b
    ## [1] 2
    ## 
    ## $c
    ## [1] 3

And matrices.

``` r
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m
```

    ##   c d
    ## a 1 3
    ## b 2 4
