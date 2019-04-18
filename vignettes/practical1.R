## ----echo=FALSE----------------------------
library(tufte)
knitr::opts_chunk$set(results = "hide", echo = FALSE)

## ---- tidy=FALSE, echo = TRUE--------------
arg_explore = function(arg1, rg2, rg3)
    paste("a1, a2, a3 = ", arg1, rg2, rg3)

## ---- eval=FALSE, echo = TRUE--------------
#  arg_explore(1, 2, 3)
#  arg_explore(2, 3, arg1 = 1)
#  arg_explore(2, 3, a = 1)
#  arg_explore(1, 3, rg = 1)

## ---- tidy=FALSE---------------------------
## SOLUTION
## See http://goo.gl/NKsved for the offical document
## To summeriase, matching happens in a three stage pass:
#1. Exact matching on tags
#2. Partial matching on tags.
#3. Positional matching

## ---- fig.keep="none", echo = TRUE---------
plot(type="l", 1:10, 11:20)

## ---- results='hide', echo = TRUE----------
rnorm(mean=4, 4, n=5)

## ---- tidy=FALSE, results='hide', fig.keep='none'----
## SOLUTION
#plot(type="l", 1:10, 11:20) is equivilent to
plot(x=1:10, y=11:20, type="l")
#rnorm(mean=4, 4, n=5) is equivilent to
rnorm(n=5, mean=4, sd=4)

## ---- echo = TRUE--------------------------
## Use regression as an example
stat_ana = function(x, y) {
  lm(y ~ x)
}

## ----  tidy=FALSE, results='hide', fig.keep='none'----
## SOLUTION
stat_ana = function(x, y, trans=NULL) {
  lm(y ~ x)
}

## ---- eval=FALSE, echo = TRUE--------------
#  stat_ana(x, y, trans=log)

## ----  tidy=FALSE, results='hide', fig.keep='none'----
## SOLUTION
stat_ana = function(x, y, trans=NULL) {
  if(is.function(trans)) {
    x = trans(x)
    y = trans(y)
  }
  lm(y ~ x)
}

## ----  tidy=FALSE, results='hide', fig.keep='none'----
## SOLUTION
stat_ana = function(x, y, trans=NULL) {
  if(is.function(trans)) {
    x = trans(x)
    y = trans(y)
  } else if (trans == "normalise") {
    x = scale(x)
    y = scale(y)
  }
  lm(y ~ x)
}

## ---- results='hide', echo = TRUE----------
f = function(x) return(x + 1)
f(10)

## ----  tidy=FALSE--------------------------
##Nothing strange here. We just get
f(10)

## ---- results='hide', echo = TRUE----------
f = function(x) {
  f = function(x) {
    x + 1
  }
  x = x + 1
  return(f(x))
}
f(10)

## ---- results='hide', echo = TRUE----------
f = function(x) {
  f = function(x) {
    f = function(x) {
      x + 1
    }
    x = x + 1
    return(f(x))
  }
  x = x + 1
  return(f(x))
}
f(10)

## ---- message = FALSE----------------------
## Solution: The easiest way to understand is to use print statements
f = function(x) {
  f = function(x) {
    f = function(x) {
      message("f1: = ", x)
      x + 1
    }
    message("f2: = ", x)
    x = x + 1
    return(f(x))
  }
  message("f3: = ", x)
  x = x + 1
  return(f(x))
}
f(10)

## ---- results='hide'-----------------------
f = function(x) {
  f = function(x) {
    x = 100
    f = function(x) {
      x + 1
    }
    x = x + 1
    return(f(x))
  }
  x = x + 1
  return(f(x))
}
f(10)

## ----  results='hide'----------------------
##Solution: The easiest way to understand is to use print statements as above

## ---- eval=FALSE, echo = TRUE--------------
#  library("jrAdvGgplot2")
#  vignette("solutions1", package="jrAdvGgplot2")

