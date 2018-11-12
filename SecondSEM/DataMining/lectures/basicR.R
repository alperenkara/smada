# Data Mining 2018 
# AGH University of Science and Technology
# Alperen Kara

data(iris)
head(iris,5)

a=c(12,14,16)
b = list('alp',12,12.44,TRUE)

str(a)
str(b)

typeof(a)
typeof(b)
is.vector(a)
is.vector(b)
as.list(a) 
is.list(a)
is.list(b)
is.atomic(a)
is.atomic(b)

seq(1,12)
seq(3,13,by = 0.75)