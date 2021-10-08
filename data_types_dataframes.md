Data Types - Data Frames
================

## Data Frames

Data frames are used to store tabular data

-   They are represented as a special type of list where every element
    of the list has to have the same length
-   Each element of the list can be thought of as a column and the
    length of each element of the list is the number of rows
-   Unlike matrices, data frames can store different classes of objects
    in each column (just like lists); matrices must have every element
    be the same class
-   Data frames also have a special attribute called `row.names`
-   Data frames are usually created by calling `read.table()` or
    `read.csv()`
-   Can be converted to a matrix by calling `data.matrix()`, just be
    mindful this will result in coercion.

``` r
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
print(x)
```

    ##   foo   bar
    ## 1   1  TRUE
    ## 2   2  TRUE
    ## 3   3 FALSE
    ## 4   4 FALSE

``` r
print(nrow(x))
```

    ## [1] 4

``` r
print(ncol(x))
```

    ## [1] 2
