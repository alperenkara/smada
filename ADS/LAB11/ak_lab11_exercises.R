#Advanced Statistics Lab11 2018
#Exercises
#Linear Regression 
#Alperen KARA

#EX 1

download.file("http://home.agh.edu.pl/~mmd/_media/dydaktyka/
as-is/krakow-kurdwanow.zip", "krakow-kurdwanow2.zip")
unzip("krakow-kurdwanow2.zip")

#EX2 
data2 <- dget("./krakow-kurdwanow")

a <- data2$SO2
b <- data2$NO2
c <- data2$PM10

good <- complete.cases(a,b,c)

a <- a[good]
b <- b[good]
c <- c[good]

#EX 3

cor(a,b) # result :0.5790506 
cor(a,c) # result : 0.7578741
cor(b,c) # result : 0.7017614

#EX 4
#The highest correlation value is 0.7578741
#for SO2 PM10

model<- lm(a~c)
model$coefficients[1] # 1.592554
model$coefficients[2] # 0.1052081

#EX 5

plot(a~c)
abline(model,col="red",lwd=1)

#EX 6

sum_of_the_squares_line<- function(y,x,z,t){
  sum<-0
  for(i in seq_along(y)){
    sum<- sum + (y[i] - (z*x[i]+t))^2
  }
  sum
}

sum_of_the_squares_line(a,c,model$coefficients[2],model$coefficients[1])
#3395.174