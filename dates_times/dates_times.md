Dates and Times in R
================

R has developed a special representation of dates and times.

-   Dates are represented by the `Date` class
-   Times are represented by the `POSIXct` or the `POSIXlt` class
-   Dates are stored internally as the number of days since 1970-01-01
-   Times are stored internally as the number of seconds since
    1970-01-01

## Dates in R

Dates are represented by the `Date` class and can be coerced from a
character string using the `as.Date()` function.

``` r
x <- as.Date("1970-01-01")
x
```

    ## [1] "1970-01-01"

``` r
unclass(x)
```

    ## [1] 0

``` r
unclass(as.Date("1969-01-01"))
```

    ## [1] -365

Note that when printing a date in R, it appears as a character string.
It is **NOT** a character string, there is just a special print function
for dates.

## Times in R

Times are represented by the `POSIXct` or the `POSIXlt` class.

-   `POSIXct` is just a very large integer under the hood; it is a
    useful class when you want to store times in something like a data
    frame
-   `POSIXlt` is a list underneath and it stores a bunch of other useful
    information like the day of the week, day of the year, etc.

There are a number of generic functions that work on dates and times.

-   `weekdays`: give the day of the week
-   `months`: give the month name
-   `quarters`: give the quarter name (“Q1”, “Q2”, “Q3”, or “Q4”)

Times can be coerced from a character string using the `as.POSIXlt` or
`as.POSIXct` function.

``` r
x <- Sys.time()
p <- as.POSIXlt(x)
names(unclass(p))
```

    ##  [1] "sec"    "min"    "hour"   "mday"   "mon"    "year"   "wday"   "yday"  
    ##  [9] "isdst"  "zone"   "gmtoff"

``` r
p$sec
```

    ## [1] 30.00926

You can also use the `POSIXct` format.

Finally, there is the `strptime` function in case your dates are written
in a different format.

``` r
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
```

    ## [1] "2012-01-10 10:40:00 EST" "2011-12-09 09:10:00 EST"

``` r
class(x)
```

    ## [1] "POSIXlt" "POSIXt"

For formatting help use `?strptime`.

## Operations on Dates and Times

You can use mathematical operations on dates and times. Addition,
subtraction, and logical comparisons are all allowed.

``` r
x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
# x-y throws an error for incompatible methods
x <- as.POSIXlt(x)
x-y
```

    ## Time difference of 356.3095 days

A very nice benefit of these operations is they track things like leap
years, leap seconds, daylight savings, and time zones.
