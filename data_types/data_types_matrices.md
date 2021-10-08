Data Types - Matrices
================

## Matrices

Matrices are vectors with a *dimension* attribute. The dimension
attribute is itself an integer vector of length 2 (nrow, ncol).

``` r
m <- matrix(nrow = 2, ncol = 3)
print(m)
```

    ##      [,1] [,2] [,3]
    ## [1,]   NA   NA   NA
    ## [2,]   NA   NA   NA

``` r
print(dim(m))
```

    ## [1] 2 3

``` r
print(attributes(m))
```

    ## $dim
    ## [1] 2 3

Matrices are constructed *column-wise*, so entrices can be thought of
starting in the “upper left” corner and running down the columns.

``` r
m <- matrix(1:6, nrow = 2, ncol = 3)
m
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    3    5
    ## [2,]    2    4    6

Matrices can also be created directly from vectors by adding a dimension
attribute.

``` r
m <- 1:10
print(m)
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10

``` r
dim(m) <- c(2, 5)
print(m)
```

    ##      [,1] [,2] [,3] [,4] [,5]
    ## [1,]    1    3    5    7    9
    ## [2,]    2    4    6    8   10

## cbing-ing and rbind-ing

Matrices can be created by *column-binding* or *row-binding* with
`cbind()` and `rbind()`.

``` r
x <- 1:3
y <- 10:12
print(cbind(x, y))
```

    ##      x  y
    ## [1,] 1 10
    ## [2,] 2 11
    ## [3,] 3 12

``` r
print(rbind(x, y))
```

    ##   [,1] [,2] [,3]
    ## x    1    2    3
    ## y   10   11   12
