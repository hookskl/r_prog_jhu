Data Types - R Objects and Attributes
================

## Objects

R has five basic or “atomic” classes of objects:

-   character
-   numeric (real numbers)
-   integer
-   complex
-   logical (True/False)

The most basic object is a vector

-   A vector can only contain objects of the *same* class
-   **BUT**: The one exception is a *list*, which is represented as a
    vector but can contain objects of different classes (indeed, that’s
    usually why we use them)

Empty vectors can be created with the `vector()` function.

## Numbers

-   Numbers in R are generally treated as numeric objects (i.e. double
    precision real numbers)
-   If you explicitly want an integer, you need to specify the `L`
    suffix
-   Ex: Entering `1` gives you a numeric object; entering `1L`
    explicitly gives you an integer.
-   There is also a special number `Inf` which represents infinity;
    e.g. `1 / 0`; `Inf` can be used in ordinary calculations
-   The value `NaN` represents an undefined value (“not a number”); e.g
    `0 / 0`; `NaN` can also be thought of as a **missing value**

## Attributes

R objects can have attributes

-   names, dimnames
-   dimensions (e.g. matrices, arrays)
-   class
-   length
-   other user-defined attributes/metadata

Attributes of an object can be accessed using the `attributes()`
function.
