#Advanced Statistics 2018
#LAB5 Data Visualization Part2
#Alperen KARA

x <- data$PM10
y <- data$PM25
x<-x[!is.na(x)]
y<-y[!is.na(y)]
x[!is.finite(x)] <- 0
y[!is.finite(y)] <- 0
x<-x[!is.nan(x)]
y<-y[!is.nan(y)]

points<-data.frame(cbind(x,y))

distance<-dist(points)

cluster<-hclust(distance)

plot(cluster)
#bordering with green 
rect.hclust(cluster,k=4,border="yellow")

groups <- cutree(cluster,k=4)
#showed on a plot
plot(y~x , points,col=groups)