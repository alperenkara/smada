#Advanced Statistics Lab11 2018
#Linear Regression 
#Alperen KARA

#Preparing Data
download.file("http://home.agh.edu.pl/~mmd/_media/dydaktyka/
as-is/krakow-kurdwanow.zip", "krakow-kurdwanow.zip")
unzip("krakow-kurdwanow.zip")
data <- dget("./krakow-kurdwanow")

#2 Linear Regression
y <- data$PM25
x <- data$PM10

good <- complete.cases(x,y)
y <- y[good]
x <- x[good]

n <- length(x)
l <- (n*sum(x*y)-sum(x)*sum(y))
m <- sqrt((n*sum(x^2) - sum(x)^2) * (n*sum(y^2) - sum(y)^2))
l/m # Result : 0.913628
cor(x,y) #Result : 0.913628
ymean <- mean(y)
xmean <- mean(x)

y <- y - ymean
x <- x - xmean

mean(y) # Result : 9.478185e-16
mean(x) # Result : 1.49278e-15

sum_of_the_squered <- function(y,x,a) {
  sum <- 0
  for(i in seq_along(y)) {
    sum <- sum + (y[i] - (a*x[i]))^2
  }
  sum
}


find_a <- function(y,x,a_vector) {
  min_sum <- Inf
  min_a <- NA
  for(a in a_vector) {
    sum <- sum_of_the_squered(y,x,a)
    if(sum < min_sum) {
      min_sum <- sum
      min_a <- a
    }
  }
  min_a
}


a <- 0
for(i in 0:10) {
  a <- find_a(y,x,seq(a-10^(-i+1), a+10^(-i+1), 10^(-i)))
}
#a : 0.7226706


