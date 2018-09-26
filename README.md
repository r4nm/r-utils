<b># r-utils</b>

<pre>
sys.source("lib/r-utils.r")

NULL %??% 5
1 %??% 2 %??% NULL
NULL %??% 2 %??% 3
NULL %??% NULL %??% 3

a <- 2
4 %if% (a == 1)
c(1:3) %if% (a == 1) %else% 5
</pre>
