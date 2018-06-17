#Advanced Statistic 2018
#LAB13 Additional Exercises
#Intro To Time Series Analysis - Part 1
#I have been trying to achive different solutions for same problems

#Exercises 1
#Install the Forecast package. The first step in any analysis is to see the data 
#and use the auto-plot to plot the gold data-set available in the forecast package.
install.packages("forecast")
library(forecast)
library(ggplot2)
autoplot(gold)
#Exercises 2
fr<-gold
median(fr, na.rm = T)
#403.225
#Exercises 3
plot(gas)
seasonplot(gas)
tsdisplay(gas)
ggseasonplot(gas, col=rainbow(12), year.labels=TRUE)
#Exercises 4
starta = c(1950, 2)
ggseasonplot(gas, start)
ggseasonplot(window(gas,start=1990))
#Exercises 5
ggseasonplot(window(gas,start=1990),polar = TRUE)
#Exercises 6
monthplot(gas)
#Exercises 7
findfrequency(gas) #answer:12
