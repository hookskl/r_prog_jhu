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
    ## 1 30  932
    ## 2 29  711
    ## 3 28  475
    ## 4 27  338
    ## 5 26  586
    ## 6 25  463

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

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ## -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313

``` r
cr <- corr("specdata", 400)
head(cr)
```

    ## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860

``` r
summary(cr)
```

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ## -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313

``` r
cr <- corr("specdata", 5000)
summary(cr)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ## 

``` r
length(cr)
```

    ## [1] 0

## Quiz

### 1. What value is returned by the following call to pollutantmean()? You should round your output to 3 digits.

``` r
pollutantmean("specdata", "sulfate", 1:10)
```

    ## [1] 4.064128

### 2. Question 2

What value is returned by the following call to pollutantmean()? You
should round your output to 3 digits.

``` r
pollutantmean("specdata", "nitrate", 70:72)
```

    ## [1] 1.706047

### 3. Question 3

What value is returned by the following call to pollutantmean()? You
should round your output to 3 digits.

``` r
pollutantmean("specdata", "sulfate", 34)
```

    ## [1] 1.477143

### 4. Question 4

What value is returned by the following call to pollutantmean()? You
should round your output to 3 digits.

``` r
pollutantmean("specdata", "nitrate")
```

    ## [1] 1.702932

### 5. What value is printed at end of the following code?

``` r
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
```

    ## [1] 228 148 124 165 104 460 232

### 6. What value is printed at end of the following code?

``` r
cc <- complete("specdata", 54)
print(cc$nobs)
```

    ## [1] 219

### 7. What value is printed at end of the following code?

``` r
RNGversion("3.5.1")  
```

    ## Warning in RNGkind("Mersenne-Twister", "Inversion", "Rounding"): non-uniform
    ## 'Rounding' sampler used

``` r
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
```

    ##  [1] 711 135  74 445 178  73  49   0 687 237

### 8. What value is printed at end of the following code?

``` r
cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
```

    ## Warning in RNGkind("Mersenne-Twister", "Inversion", "Rounding"): non-uniform
    ## 'Rounding' sampler used

``` r
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)
```

    ## [1]  0.2688  0.1127 -0.0085  0.4586  0.0447

### 9. What value is printed at end of the following code?

``` r
cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
```

    ## Warning in RNGkind("Mersenne-Twister", "Inversion", "Rounding"): non-uniform
    ## 'Rounding' sampler used

``` r
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)
```

    ## [1] 243.0000   0.2540   0.0504  -0.1462  -0.1680   0.5969

### 10. What value is printed at end of the following code?

``` r
cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
```

    ## [1]  0.0000 -0.0190  0.0419  0.1901
