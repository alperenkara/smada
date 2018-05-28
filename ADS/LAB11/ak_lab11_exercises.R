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
