Data Types - Vectors and Lists
================

## Creating Vectors

The `c()` function can be used to create vectors of objects.

``` r
x <- c(0.5, 0.6)      ## numeric
x <- c(TRUE, FALSE)   ## logical
x <- c(T, F)          ## also logical
x <- c("a", "b", "c") ## character
x <- 9:29             ## integer
x <- c(1+0i, 2+4i)    ## complex
```

Using the `vector()` function

``` r
x <- vector("numeric", length = 10)
x
```

    ##  [1] 0 0 0 0 0 0 0 0 0 0

## Mixing Ojbects

What happens below?

``` r
y <- c(1.7, "a")  ## character
y <- c(TRUE, 2)   ## numeric
y <- c("a", TRUE) ## character
```

R won’t error, but will instead *coerce* every element in the vector to
the same class.

## Explicit Coercion

Objects can be coerced explicitly using the `as.*` functions, if
available.

``` r
x <- 0:6
print(class(x))
```

    ## [1] "integer"

``` r
print(as.numeric(x))
```

    ## [1] 0 1 2 3 4 5 6

``` r
print(as.logical(x))
```

    ## [1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE

``` r
print(as.character(x))
```

    ## [1] "0" "1" "2" "3" "4" "5" "6"

Nonsensical coercion results in `NA`s.

``` r
x <- c("a", "b", "c")
print(as.numeric(x))
```

    ## Warning in print(as.numeric(x)): NAs introduced by coercion

    ## [1] NA NA NA

``` r
print(as.logical(x))
```

    ## [1] NA NA NA

``` r
print(as.complex(x))
```

    ## Warning in print(as.complex(x)): NAs introduced by coercion

    ## [1] NA NA NA

## Lists

Lists are a special type of vector that can contain elements of
different classes. Lists are a very important data type in R.

``` r
x <- list(1, "a", TRUE, 1 + 4i)
x
```

    ## [[1]]
    ## [1] 1
    ## 
    ## [[2]]
    ## [1] "a"
    ## 
    ## [[3]]
    ## [1] TRUE
    ## 
    ## [[4]]
    ## [1] 1+4i
