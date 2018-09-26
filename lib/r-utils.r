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

`%?:%` <- function(x, y) {
    if (!is.null(x)) x else y
}

if (!exists("is", mode = "function")) {
##
# Check if object belongs to the class
#
# @param o  Object
# @param c  Class
#
# @return   TRUE if belongs
#
is <- function(o, c) {
    class(o) == c || inherits(o, c)
}
}

##
# Check if object belongs to the class
#
# @param x  Left value
# @param y  Right value
#
# @return   TRUE if object belongs to the class
#
`%is%` <- function(x, y) {
    is(x, y)
}

`%if%` <- function(x, y) {
    if (is.true(y)) return (x)
}

`%else%` <- function(x, y) {
    x %??% y
}
