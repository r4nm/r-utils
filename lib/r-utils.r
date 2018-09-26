#!/usr/bin/env Rscript

`%??%` <- function(x, y) {
    if (!is.null(x)) x else y
}

`%is%` <- function(x, y) {
    is(x, y)
}

`%if%` <- function(x, y) {
    if (is.true(y)) return (x)
}

`%else%` <- function(x, y) {
    x %??% y
}
