#Advanced Statistic 2018
#LAB13 Additional Exercise
#Intro To Time Series Analysis - Part 1
#I have been trying to achive different solutions for same problems

#Exercise 1
#Install the Forecast package. The first step in any analysis is to see the data 
#and use the auto-plot to plot the gold data-set available in the forecast package.
install.packages("forecast")
library(forecast)
library(ggplot2)
autoplot(gold)
#Exercise 2
fr<-gold
median(fr, na.rm = T)
#403.225
#Exercise 3
plot(gas)
seasonplot(gas)
tsdisplay(gas)
ggseasonplot(gas, col=rainbow(12), year.labels=TRUE)
#Exercise 4
starta = c(1950, 2)
ggseasonplot(gas, start)
ggseasonplot(window(gas,start=1990))
#Exercise 5
ggseasonplot(window(gas,start=1990),polar = TRUE)
#Exercise 6
monthplot(gas)
#Exercise 7
findfrequency(gas) #answer:12
