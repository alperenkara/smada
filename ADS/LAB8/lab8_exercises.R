#Advanced Statistics 2018
#LAB8 Statistical Inference Part 2
#Alperen KARA

#loading mtcars dataset
data(mtcars)


#calculate descriptive statistics for three variables 

summary(mtcars$mpg)
summary(mtcars$hp)
summary(mtcars$qsec)

#also
k <- describe(mtcars[c(1, 4, 7)])  # mpg, hp, qsec

#calculate mean 

mean(mtcars$mpg)
mean(mtcars$hp)
mean(mtcars$qsec)

#standard deviation

sd(mtcars$mpg)
sd(mtcars$hp)
sd(mtcars$qsec)

#skewness 

require(psych)
skew(mtcars$mpg)
skew(mtcars$hp)
skew(mtcars$qsec)

#kurtosis 

kurtosi(mtcars$mpg)
kurtosi(mtcars$hp)
kurtosi(mtcars$qsec)

#also 
k[, c(3, 4, 11, 12)]