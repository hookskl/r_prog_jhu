Data Types - Factors
================

## Factors

Factors are used to represent categorical data. Factors can be unordered
or ordered. One can think of a factor as an integer vector where each
integer is *labeled*.

-   Factors are treated specially by modelling fuctions like `lm()` and
    `glm()`
-   Using factors with labels is *better* than using integers because
    factors are self-describing; having a variable that has values
    “Male” and “Female” is better than a variable that has values 1
    and 2.

``` r
x <- factor(c("yes", "yes", "no", "yes", "no"))
print(x)
```

    ## [1] yes yes no  yes no 
    ## Levels: no yes

``` r
print(table(x))
```

    ## x
    ##  no yes 
    ##   2   3

``` r
print(unclass(x))
```

    ## [1] 2 2 1 2 1
    ## attr(,"levels")
    ## [1] "no"  "yes"

The order of the levels can be set using the `levels` argument to
`factor()`. This can be important in linear modeling because the first
level is used as the baseline level. **NOTE**: The default choice for
levels is alphabetical order.

``` r
x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes", "no"))

x
```

    ## [1] yes yes no  yes no 
    ## Levels: yes no
