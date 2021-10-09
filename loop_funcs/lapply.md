Loop Functions - lapply
================

## Looping on the Command Line

Writing `for`, `while` loops is useful when programming but not very
convenient/concise when working interactively on on the command line.
There are some functions which implement looping to make life easier.

-   `lapply`: loop over a list and evaluate a function on each element
-   `sapply`: same as `lapply` but try to simplify the result
-   `apply`: apply a function over the margins of an array
-   `tapply`: apply a function over subsets of a vector
-   `mapply`: multivariate version of `lapply`

An auxiliary function `split` is also useful, particularly in
conjunction with `lapply`.

## lapply

`lapply` takes three arguments:

1.  a list `x`
2.  a function (or the name of a function) `FUN`
3.  other arguments via `...`

Note that `lapply` will coerce `x` to a list using `as.list`.

``` r
lapply
```

    ## function (X, FUN, ...) 
    ## {
    ##     FUN <- match.fun(FUN)
    ##     if (!is.vector(X) || is.object(X)) 
    ##         X <- as.list(X)
    ##     .Internal(lapply(X, FUN))
    ## }
    ## <bytecode: 0x00000000134c05a0>
    ## <environment: namespace:base>

The actual looping is done internally in C code.

`lapply` always returns a list, regardless of class input.

``` r
x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)
```

    ## $a
    ## [1] 3
    ## 
    ## $b
    ## [1] -0.2992139

When using `lapply` you can also specify arguments of the function
(`FUN`) that you are applying.

``` r
x <- 1:4
lapply(x, runif, min = 0, max = 10)
```

    ## [[1]]
    ## [1] 4.333901
    ## 
    ## [[2]]
    ## [1] 0.06030897 7.63028292
    ## 
    ## [[3]]
    ## [1] 9.0329480 7.9147877 0.5866455
    ## 
    ## [[4]]
    ## [1] 5.1041640 0.3846949 7.8800898 6.4830241

## Anonymous Functions

`lapply` and related functions make heavy use of *anonymous* functions.
Anonymous functions are just functions defined and called without being
named. These are convenient when a function doesn’t already exist to
perform the operation needed and you have to write it yourself.

``` r
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
lapply(x, function(elt) elt[, 1]) ## anonymous function
```

    ## $a
    ## [1] 1 2
    ## 
    ## $b
    ## [1] 1 2 3

## sapply

`sapply` will try to simplify the result of `lapply` if possible.

-   If the result is a list where every element is length 1 then a
    vector is returned
-   If the result is a list where every element is a vector of the same
    length (&gt;1), a matrix is returned
-   If no simplifications can be made then a list is returned

``` r
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
y <- lapply(x, mean)
z <- sapply(x, mean)
class(y)
```

    ## [1] "list"

``` r
class(z)
```

    ## [1] "numeric"
