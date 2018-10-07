#Advanced Statistics 2018
#LAB8 Statistical Inference Part 2
#Alperen KARA

groups <- c(rep("blue, 5010"),
            rep("red",4250),
            rep("orange",2630),
            rep("green",4580),
            rep("purple",1460))
groups.t1 <- table(groups)
groups.t1
groups.t2 <- sort(groups.t1, decreasing = TRUE)
groups.t2
prop.table(groups.t2)
round(prop.table(group.t2),2)
round(prop.table(group.t2),2)*100
require("datasets")
?cars
cars
str(cars)
data(cars)
summary(cars$speed)
summary(cars)
fivenum(cars$speed)
install.packages("psych")
require("psych")
describe(cars)
prop.test(98,162)
###
#sample estimates:
#p 
#0.6049383 
prop.test(98,162, alt = "greater", conf.level = .90)
###
#sample estimates:
#p 
#0.6049383 
?quakes
quakes[1:5, ]
mag<-quakes$mag
mag[1:5]
t.test(mag)
t.test(mag,alternative="greater", mu =4)
?HairEyeColor
str(HairEyeColor)
HairEyeColor

eyes <- margin.table(HairEyeColor,2)

eyes

round(prop.table(eyes),2)

chi1 <- chisq.test(eyes)

chi1 #results
#X-squared = 133.47, df = 3, p-value < 2.2e-16

#compare results
browseURL("https://www.statisticbrain.com/eye-color-distribution-percentages/")

chi2 <- chisq.test(eyes, p=c(.41,.32,.15,.12))
chi2
#X-squared = 6.4717, df = 3, p-value = 0.09079

#13  X-squared values are different, chi2 has greater p-value than in chi1