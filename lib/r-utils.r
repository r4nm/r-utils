#!/usr/bin/env Rscript

##
# Returns the first value that is not null
#
# @param x  Left value
# @param y  Right value
#
# @return   The first value that is not null
#
`%??%` <- function(x, y) {
    if (!is.null(x)) x else y
}

##
# Check if the element belongs to the specified
#
# @param x  Left value
# @param y  Right value
#
# @return   TRUE if the element belongs to the specified
#
`%is%` <- function(x, y) {
    inherits(x, y)
}

`%if%` <- function(x, y) {
    if (is.true(y)) return (x)
}

`%else%` <- function(x, y) {
    x %??% y
}
