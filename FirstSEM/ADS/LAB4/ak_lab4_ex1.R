#Advanced Statistics 2018
#LAB4 
#ALPEREN KARA
#3 Base System Exercise
#3.1 Draw a box plot
boxplot(data$PM25 ~ format(data$date, "%w"),xlab="dayofw",ylab="PM25")
#3.2 Draw a PM25 histogram
hist(data$PM25, col="red")

#3.3 change over time
par(mfrow=c(1,1))
with(data, plot(date, PM25))
title("time  ~ PM2.5")
with(data[data$PM25 > 100,], points(date, PM25,col="red"))