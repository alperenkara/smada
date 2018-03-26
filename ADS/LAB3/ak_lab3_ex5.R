##Alperen KARA 2018 Advanced Statistics LAB3

#5.1 create matrix with 60 rows and 30 columns from vector of even numbers
m1 <- matrix(seq(2,1800,2), nrow=60, ncol=30)

#5.2 composed of nine elements of the matrix m1
m2 <- m1[5:7 , 3:5]

#5.3 multiply matrix m2 with matrix m2 and then calculate the sum
m3<-sum(m2%*%m2)