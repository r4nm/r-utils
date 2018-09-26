<b># r-utils</b>

<pre>
sys.source("lib/r-utils.r")

a <- 1
4 %if% (a == 1)
c(1:3) %if% (a == 1) %else% 5

a %?:% 6

1 %??% 2 %??% NULL
NULL %??% 2 %??% 3
NULL %??% NULL %??% 3

8 %is% "vector"
8 %is% "numeric"
</pre>
