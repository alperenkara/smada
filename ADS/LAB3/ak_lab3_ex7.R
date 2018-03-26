#Alperen KARA 2018 Advanced Statistics
#7.1 create matrix with 60 rows and 30 columns from vector of odd numbers
m1 <- matrix(seq(5,3600,5), nrow=60, ncol=60)

#7.2 composed of nine elements of the matrix m1
m2 <- m1[15:17 , 13:15]

#7.3 multiply matrix m2 with matrix m2 and then calculate MEAN
m3<-sum(m2%*%m2)