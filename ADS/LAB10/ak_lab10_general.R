#Advanced Statistics LAB 10 2018
#ALperen KARA
#LAB 10 Bootstrapping
###################1
#rm(list = ls())
setwd("~/GitHub/smada/ADS/LAB10")
download.file("http://home.agh.edu.pl/~mmd/_media/dydaktyka/as-is/lab10dataset.csv.zip", "lab10dataset.csv.zip")
unzip("lab10dataset.csv.zip")

library(readr)
lab10dataset <- read_csv("lab10dataset.csv")
#clean <- gsub()
hist(lab10dataset$V1)
plot(density(lab10dataset$V1),main="Density")
plot(ecdf(lab10dataset$V1),main="ECDF")
#Exercises 3
boot.mean = function(x,B,binwidth=NULL) {
n = length(x)
boot.samples = matrix( sample(x,size=n*B,replace=TRUE), B, n)
boot.statistics = apply(boot.samples,1,mean)
se = sd(boot.statistics)
require(ggplot2)
if ( is.null(binwidth) )
binwidth = diff(range(boot.statistics))/30
p = ggplot(data.frame(x=boot.statistics),aes(x=x)) +
geom_histogram(aes(y=..density..),binwidth=binwidth) + geom_density(color="red")
plot(p)
interval = mean(x) + c(-1,1)*2*se
print( interval )
return( list(boot.statistics = boot.statistics, interval=interval, se=se, plot=p) )
}

lab10variable = read.csv("lab10dataset.csv")
#Exercises 4
output = with(lab10variable,boot.mean(lab10variable$V1, B= 10000))

#Exercises 3
meanData <- mean(lab10variable$V1) #0.4725156
t.test(meanData, conf.level = 0.95)$conf.int

#Exercises 5

quantile(lab10variable$V1, c(.025, .975))
#2.5%     97.5% 
#-1.787393  3.087810
#calculate 2.5 
mean(lab10variable$V1) - 2 * (sd(lab10variable$V1)) #-2.140813

#calculate 97.5
mean(lab10variable$V1) + 2 * (sd(lab10variable$V1)) #3.085845

#EXERCISES 6
library(boot)

lab.boot<-function(lab10dataset,indices)
{
  return(median(lab10dataset[indices]))
}

lab.median<-boot(lab10dataset$V1,lab.boot,R=10000)
#EXercises 7

