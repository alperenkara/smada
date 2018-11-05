x <- pretty(c(-3,3),30)
y <- dnorm(x)

plot(x,y, 
     type = "p",
     xlab = "Normal Deviate",
     ylab = "Density",
     yaxs = "i")

c <- matrix(runif(25),nrow = 5)

i <- 15

while (i > 0) {print ("something"); i<- i-1}