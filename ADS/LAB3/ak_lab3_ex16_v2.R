fibo <- function(n) {
  x <- c(0,1)
  while (length(x) < n) {
    position <- length(x)
    newValue <- x[position] + x[position-1]
    x <- c(x,newValue)
  }
  return(x)
}