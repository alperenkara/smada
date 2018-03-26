#2.1
#assign value of 1 to all elements
m <- matrix(1, nrow = 50, ncol = 50)
#assigned value of 2 from 26 to 50
m[26:50,] <- 2
print(m)
#2.2 divide all elements of 15th column by two
m[ 1:50 , 15] <- m[ 1:50 , 15]/2
#2.3 sum of 13th to 19th column and from 11th to 17th row
sum(m[11:17,13:19])#43.75

