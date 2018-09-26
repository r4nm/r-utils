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
# If the x variable is not empty, this is returned,
# otherwise, the y variable is returned.
#
# @param x  Left value
# @param y  Right value
#
# @return   x variable, if this is not empty
#
`%?:%` <- function(x, y) {
    return (if (!is.empty(x)) x else y)
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
    (is.vector(o) && c == "vector") || class(o) == c || inherits(o, c)
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

##
# Check if object is empty. Values such as NULL, NA, NaN, FALSE, 0, "",
# are taken as empty.
#
# @param o  Object
#
# @return  TRUE if object is empty
#
is.empty <- function(o) {
    for (e in o) {
        if (!(e %in% c(0, "", NA, NaN, FALSE))) {
            return (FALSE)
        }
    }

    return (TRUE)
}
