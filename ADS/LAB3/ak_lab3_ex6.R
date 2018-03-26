#Alperen KARA 2018 Advanced Statistics
#6.1 create matrix with 60 rows and 30 columns from vector of odd numbers
m1 <- matrix(seq(1,1800,2), nrow=60, ncol=30)

#6.2 composed of nine elements of the matrix m1
m2 <- m1[5:7 , 3:5]

#6.3 multiply matrix m2 with matrix m2 and then calculate MEAN
m3<-mean(m2%*%m2)