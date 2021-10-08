Connections: Interfaces to the Outside World
================

## Interfaces to the Outside World

Data are read in using *connection* interfaces. Connections can be made
to files (most common) or to other more exotic things.

-   `file`, opens a connection to a file
-   `gzfile`, opens a connection to a file compressed with gzip
-   `bzfile`, opens a connection to a file compressed with bzip2
-   `url`, opens a connection to a webpage

``` r
str(file)
```

    ## function (description = "", open = "", blocking = TRUE, encoding = getOption("encoding"), 
    ##     raw = FALSE, method = getOption("url.method", "default"))

-   `description` is the name of the file
-   `open` is a code indicating
    -   “r” read only
    -   “w” writing (and initializing a new file)
    -   “a” appending
    -   “rb”, “wb”, “ab”: reading, writing, or appending in binary mode
        (Windows)

## Connections

In general, connections are powerful tools that let you navigate files
or other external objects. In practice, we often don’t need to deal with
the connection interface directly.

``` r
con <- file("foo.txt", "r")
data <- read.csv(con)
close(con)
```

Is equivalent to

``` r
data <- read.csv("foo.txt")
```

## Reading Lines of a Text File

``` r
con <- gzfile("words.gz")
x <- readLines(con, 10) # reads the first 10 lines of a file
```

`writeLines` takes a character vector and writes each element one line
at a time to a text file.

`readLines` can be useful for reading in lines of webpages.

``` r
con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)
head(x, 3)
```

    ## [1] "<!DOCTYPE html>"                                                 
    ## [2] "<html lang=\"en\" dir=\"ltr\" prefix=\"og: https://ogp.me/ns#\">"
    ## [3] "  <head>"
