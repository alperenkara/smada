#Advanced Statistics 2018
#LAB5 Data Visualization Part2
#Alperen KARA
#green background colour and red dots
par(col=2,lty=2,bg=3);plot(mpg,wt)
plot(mpg,wt,col=2,bg=3)
#which command do you have to use to see two plots by row ?
par(mfrow=c(1,2)); plot(mpg,wt); plot(mpg,hp)
#Produce 4 different plot at the same time two rows two colums
par(mfrow=c(2,2));plot(mpg,wt);plot(mpg,hp);plot(mpg,hp);plot(mpg,hp)
####
par(mfrow=c(2,2)) ;
plot(x, y, main="Title A", sub="subtitle",
     xlab="X-axis label", ylab="y-axix label")
plot(x, y, main="Title B", sub="subtitle",
     xlab="X-axis label", ylab="y-axix label")
plot(x, y, main="Title C", sub="subtitle",
     xlab="X-axis label", ylab="y-axix label")
plot(x, y, main="Title D", sub="subtitle",
     xlab="X-axis label", ylab="y-axix label")

###Ex4.4
dev.off()