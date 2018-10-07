##Alperen KARA 2018 Advanced Statistics LAB3

#8.1 create matrix with 30 rows and 30 columns from vector of odd numbers
m1 <- matrix(2^(1:900), nrow=30, ncol=30)

#8.2 composed of nine elements of the matrix m1
m2 <- m1[15:17 , 13:15]

#8.3 multiply matrix m2 with matrix m2 and then calculate with MEAN
m3<-mean(m2%*%m2)