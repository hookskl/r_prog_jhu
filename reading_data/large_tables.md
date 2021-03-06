Reading Large Tables
================

## Reading in Larger Datasets with read.table

With much larger datasets, doing the following will make things easier
and prevent R from choking.

-   Read the help page for `read.table`, which contains many hints
-   Make a rough calculation of the memory required to store your
    dataset. If the dataset is larger than the amount of RAM on your
    computer, you can probably stop here.
-   Set `comment.char = ""` if there are no commented lines in the file
-   Use the `colClasses` argument. Specifying this option instead of
    using the default can make `read.table` run **MUCH** faster, often
    double in speed. In order to use this option, you have to know the
    class of each column in our data frame. If all the columns are
    “numeric”, for example, then you can just set
    `colClasses = "numeric"`. A quick and dirty way to figure out the
    classes of each column is the following:

``` r
initial <- read.table("datatable.txt", nrows = 100)
classes <- sapply(initial, class)
tabAll <- read.table("datatable.txt", 
                     colClasses = classes)
```

-   Set `nrows`. This doesn’t help with speed but with memory usage.
    Mild overestimation is fine. Tools like `wc` form Unix can be used
    to help with this calculation.

## Know Thy System

In general, when using R with larger datasets, it’s useful to know a few
things about your system.

-   How much memory is available?
-   What other applications are in use?
-   Are there other users logged into the same system?
-   What os?
-   Is the os 32 or 64 bit?

## Calculating Memory Requirements

Consider a data frame with 1,500,00 rows and 120 columns that is all
numeric data. Roughly, how much memory is required to store this data
frame?

1, 500, 00 × 120 × 8 bytes/numeric

 = 1440000000 bytes

 = 1440000000/2<sup>20</sup> bytes/MB

 = 1, 373.29 MB

 = 1.34 GB

In reality there is additional overhead when importing data, so a good
rule of thumb is to double the amount calculated when deciding if there
is enough memory to read in a dataset.
