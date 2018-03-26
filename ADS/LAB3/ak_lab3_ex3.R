##Alperen KARA 2018 Advanced Statistics LAB3

#3.1 create matrix of 25 columns adn 50 rows 
#start at 1 with natural numbers

m <- matrix(c(1:1250), nrow = 50, ncol = 25)

#3.2 if one of the matrix values is equal to..

m[m%in%c(1,2,3,5,8)]<-NA

#3.3 erase NA and show the average of all items
m <- na.exclude(m)
rowMeans(x, na.rm = TRUE); colMeans(x, na.rm = TRUE)
#