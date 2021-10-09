Air Pollution
================

## Part 1

Write a function named `pollutantmean` that calculates the mean of a
pollutant (sulfate or nitrate) across a specified list of monitors. The
function `pollutantmean` takes three arguments: `directory`,
`pollutant`, and `id`. Given a vector monitor ID numbers,
`pollutantmean` reads that monitors’ particulate matter data from the
directory specified in the `directory` argument and returns the mean of
the pollutant across all of the monitors, ignoring any missing values
coded as `NA`.

``` r
# important function
source("pollutantmean.R")
```

Compare written function with expected test output.

``` r
pollutantmean("specdata", "sulfate", 1:10)  ## 4.064128
```

    ## [1] 4.064128

``` r
pollutantmean("specdata", "nitrate", 70:72) ## 1.706047
```

    ## [1] 1.706047

``` r
pollutantmean("specdata", "nitrate", 23)    ## 1.280833
```

    ## [1] 1.280833

## Part 2

Write a function that reads a directory full of files and reports the
number of completely observed cases in each data file. The function
should return a data frame where the first column is the name of the
file and the second column is the number of complete cases.

``` r
source("complete.R")
```

``` r
complete("specdata", 1)
```

    ##   id nobs
    ## 1  1  117

``` r
complete("specdata", c(2, 4, 8, 10, 12))
```

    ##   id nobs
    ## 1  2 1041
    ## 2  4  474
    ## 3  8  192
    ## 4 10  148
    ## 5 12   96

``` r
complete("specdata", 30:25)
```

    ##   id nobs
    ## 6 30  932
    ## 5 29  711
    ## 4 28  475
    ## 3 27  338
    ## 2 26  586
    ## 1 25  463

``` r
complete("specdata", 3)
```

    ##   id nobs
    ## 1  3  243

## Part 3

Write a function that takes a directory of data files and a threshold
for complete cases and calculates the correlation between sulfate and
nitrate for monitor locations where the number of completely observed
cases (on all variables) is greater than the threshold. The function
should return a vector of correlations for the monitors that meet the
threshold requirement. If no monitors meet the threshold requirement,
then the function should return a numeric vector of length 0.

``` r
source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
head(cr)
```

    ## [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814

``` r
summary(cr)
```

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max.     NA's 
    ## -0.21057 -0.05088  0.09034  0.12495  0.26235  0.78597        6

``` r
cr <- corr("specdata", 400)
head(cr)
```

    ## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860

``` r
summary(cr)
```

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max.     NA's 
    ## -0.17623 -0.03879  0.09114  0.12943  0.25906  0.76313        6

``` r
cr <- corr("specdata", 5000)
summary(cr)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##       0       0       0       0       0       0

``` r
length(cr)
```

    ## [1] 1
