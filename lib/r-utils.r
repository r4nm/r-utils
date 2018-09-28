#!/usr/bin/env Rscript

##
# The first operand from left to right that exists and is not NULL.
# NULL if there are no defined values. (like php)
#
# @param x  Left value
# @param y  Right value
#
# @return   The first operand from left is not null
#
# @use
# a <- NULL
# b <- 1
# c <-2
#
# a %??% b %??% c
#
# [1] 1
#
`%??%` <- function(x, y) {
    if (!has.all.values(x, NULL)) x else y
}

##
# The expression x ?: z returns x if x is evaluated as not empty
# and z if it is otherwise. (like php)
#
# @param x  Left value
# @param y  Right value
#
# @return   x, if this is not empty
#
# @use
# NULL %??% c(1:3) %?:% 3
#
# [1] 1 2 3
#
`%?:%` <- function(x, z) {
    if (!is.empty(x)) x else z
}

##
# Check if object is empty. Values such as 0, "", NA, NaN, FALSE
# are taken as empty.
#
# @param o  Object
#
# @return  TRUE if the values of the object are empty
#
# @use
# m <- matrix(NA, 1, 5)
# is.empty(m)
#
# [1] TRUE
#
is.empty <- function(o, values=c(0, "", NA, NaN, FALSE)) {
    has.all.values(o, values)
}

if (!exists("is", mode="function")) {
##
# Test inheritance relationships between an object and a class
# or between two classes
#
# @param o  Object
# @param c  Class
#
# @return   TRUE if test is TRUE
#
is <- function(o, c) {
    # First, check if the variable is a vector, this is due
    # what elements like integer, character, etc ...,
    # can be inherited from one.
    (is.vector(o) && c == "vector") ||
    # Second, verify if the class of the object corresponds to the
    # specified in the second argument.
    (class(o) == c) ||
    # Finally, check if the object inherits from the class.
    inherits(o, c)
}
}

##
# Test inheritance relationships between an object and a class
# or between two classes
#
# @param x  Left value
# @param y  Right value
#
# @return   TRUE if test is TRUE
#
# @use
# m <- matrix(NA, 1, 5)
# m %is% "matrix"
#
# [1] TRUE
#
`%is%` <- function(x, y) {
    is(x, y)
}

##
# Conditional. (like python)
#
# @param x Sentence when it is true
# @param y Expresion
#
# @return  x if y is true
#
# @use
# a <- 1
# 4 %if% (a == 1)
#
# [1] 4
#
# @note
# Parentheses are required in the conditional expression
#
`%if%` <- function(x, y) {
    if (is.true(y)) return (x)
}

##
# Else clause of conditional
#
# @param x Result of if condition
# @param y Sentence when it is false
#
# @return  y if x is null
#
# @use
# a <- 1
# 5 %if% (a == 2) %else% c(1:3)
#
# [1] 1 2 3
#
`%else%` <- function(x, y) {
    x %??% y
}

##
# Perform a regular expression match. Searches text for a match
# to the regular expression given in pattern. (like postgresql)
#
# @param t  Text
# @param p  Pattern
#
# @return TRUE if the text matches the pattern
#
# @use
# "abc" %~% "a+"
#
# [1] TRUE
#
`%~%`<- function(t, p) {
    regexpr(p, t, perl=TRUE)[[1]] > 0
}

##
# Verify that the object does not contain TRUE values in its entirety
#
# @param o  Object
#
# @return   True if values are true
#
is.true <- function(o) {
    has.all.values(o, TRUE)
}

##
# Verify that the object does not contain FALSE values in its entirety
#
# @param o  Object
#
# @return   True if values are false
#
is.false <- function(o) {
    has.all.values(o, FALSE)
}

##
# Verify that the object does not contain null values in its entirety
#
# @param o  Object
#
# @return   True if values are not null
#
is.not.null <- function(o) {
    !has.all.values(o, NULL)
}

##
# Verify that all elements of the object contain the specified values
#
# @param o  Object
#
# @return   TRUE if all the elements contain the values
#
has.all.values <- function(o, v) {
    for (e in o) {
        # If the value of the element does not match any
        # of the values in the list, ...
        if (!(e[[1]] %in% v)) {
            # ... return immediately
            return (FALSE)
        }
    }
    return (TRUE)
}

##
# Retrieve the values of the object between start
# and end value. If end value not exists, this take the
# maximum value in the object.
#
# @param o     Object
# @param s     Start value
# @param e     End value
# @param keep  TRUE, returns the object
#
# @return      Values between start and end.
#
between <- function(o, s, e=NULL, keep=FALSE) {
    e <- ifelse(is.null(e), max(o), e)
    o[!(o %in% c(s:e))] <- NA

    return (
        # You whish to keep the object
        if (is.true(keep)) {
            (o)
        } else {
            (o[!is.na(o)])
        }
    )
}

##
# Retrieve the first element of the object
#
# @param o  Object
#
# @return  The first element
#
first <- function(o) {
    return (as.vector(o)[1])
}

##
# Retrieve the last element of the object
#
# @param o  Object
#
# @return  The last element
#
last <- function(o) {
    return (as.vector(o)[length(o)])
}
