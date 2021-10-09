Loop Functions - apply
================

## apply

`apply` is used to evaluate a function over the margins of an array.

-   It is most often used to apply a function to the rows or columns of
    a matrix
-   It can be used with general arrays, e.g. taking the average of an
    array of matrices
-   It is not really faster than writing a loop, but it works in one
    line

``` r
str(apply)
```

    ## function (X, MARGIN, FUN, ..., simplify = TRUE)

-   `x` is an array
-   `MARGIN` is an integer vector indicating which margins should be
    “retained”
-   `FUN` is a function to be applied
-   `...` is for other arguments to be passed to `FUN`

``` r
x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean) # gets the mean of each column
```

    ##  [1]  0.44093272  0.23361573 -0.39461065  0.13322551 -0.22769586 -0.21711838
    ##  [7]  0.11626324  0.08909408 -0.01052466  0.16641279

``` r
apply(x, 1, sum) # gets the sum of each row
```

    ##  [1] -0.1272991 -0.4925525 -0.2688362  0.2387069 -3.5659151  1.7472068
    ##  [7] -4.7088647  1.2112491  1.5657681 -3.3837474  7.0401685 -0.4745169
    ## [13]  1.4679752  4.3013857  2.3574463 -2.1434996  1.8681655  1.1185791
    ## [19] -1.4974627  0.3379330

## col/row sums and means

For sums and means of matrix dimensions, we have some shortcuts.

-   `rowSums` = `apply(x, 1, sum)`
-   `rowMeans` = `apply(x, 1, mean)`
-   `colSums` = `apply(x, 2, sum)`
-   `colMeans` = `apply(x, 2, mean)`

These shortcuts are *much* faster than `apply` when using large
matrices.

## Working in More Than 2 Dimensions

Let’s say we want the average matrix of an array of matrices. Below we
have an array of 10 2 × 2 matrices (total dimensions 2 × 2 × 10), we can
pass a vector to the `MARGIN` argument specifying to retain the first
two dimensions and collapsing the third.

``` r
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
dim(a) # array of 10 2x2 matrices
```

    ## [1]  2  2 10

``` r
apply(a, c(1, 2), mean)
```

    ##            [,1]        [,2]
    ## [1,] 0.15662714  0.07016828
    ## [2,] 0.07744307 -0.50052244

``` r
# equivlent call using rowMeans
rowMeans(a, dims = 2)
```

    ##            [,1]        [,2]
    ## [1,] 0.15662714  0.07016828
    ## [2,] 0.07744307 -0.50052244
