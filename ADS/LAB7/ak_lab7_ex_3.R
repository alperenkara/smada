#Advanced statistics-2018
#Lab7
#Alperen KARA
setwd("~/AMSDC/AdvancedStatistics/LAB7")
set.seed(1)

###1 

alp <- rnorm(100)

###2 
meanOfAlp <- mean(alp)
# Answer 0.1088874
sdOfAlp <- sd(alp)
# Answer 0.8981994
medianOfAlp <- median(alp)
# Answer 0.1139092
###3

dec <- seq(0,1,0.1)
quantile(alp,dec)

###         0%         10%         20%         30%         40%         50%         60%         70%         80% 
#-2.21469989 -1.05265747 -0.61386923 -0.37534202 -0.07670313  0.11390916  0.37707993  0.58121734  0.77125360 
#90%        100% 
#  1.18106508  2.40161776

###4 Devide 
split(alp, ceiling(alp:4))
##5 Install
install.packages("ISwR")
library("ISwR", lib.loc="~/R/win-library/3.4")
attach(juul)
###
### 6
meanOfigf1<- mean(juul$igf1,na.rm=TRUE)

#exercise 7
countNumberONon <- sum(!is.na(juul$igf1))
# 1018 occurences of a number

#exercise 8
descriptiveStatistics <- function(v){
  #get rid of NA values
  v<- na.omit(v)
  m <- mean(v)
  sdev <- sd(v)
  va <- var(v)
  med <- median(v)
  sprintf("mean %f, standard deviation %f, variance %f, median %f", m,sdev,va,med)
  
}
