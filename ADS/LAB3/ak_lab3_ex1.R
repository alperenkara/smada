##Alperen KARA 2018 Advanced Statistics LAB3

#creating matrix 100x100 with natural numbers
#m = matrix(c(1:10000), nrow=100, ncol=100)
#1:dim(m)[2]
for (i in c(1:dim(m)[1])) {
  for(j in c(1:dim(m)[2])){
    if(m[i,j]>5000)
    {
      m[i,j]<-m[i,j]%*%2
      
    }
  }
}

sum6062 <- sum(c(m),60:62,5:6)

print(sum6062)