The str Function
================

## str: Compactly display the internal structure of an R object

-   A diagnostic function and an alternative to `summary`
-   It is especially well suited to compactly display the (abbreviated)
    contents of (possibly nested) lists
-   Roughly one line per basic object

This is all for the capability to best answer: **What’s in this
object?**

## Some examples

Looking at some functions in R:

``` r
str(str)
```

    ## function (object, ...)

``` r
str(lm)
```

    ## function (formula, data, subset, weights, na.action, method = "qr", model = TRUE, 
    ##     x = FALSE, y = FALSE, qr = TRUE, singular.ok = TRUE, contrasts = NULL, 
    ##     offset, ...)

Also useful for looking at data.

``` r
x <- rnorm(100, 2, 4)
str(x)
```

    ##  num [1:100] 3.776 -2.824 -1.367 5.407 0.677 ...
