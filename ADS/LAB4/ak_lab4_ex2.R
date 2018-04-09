#Advanced Statistics 2018
#LAB4 
#ALPEREN KARA
#4.1 Install the lattice package
download.file("http://home.agh.edu.pl/~mmd/_media/dydaktyka/as-is/lab4dataset.csv.zip","lab4dataset.csv.zip")
unzip("lab4dataset.csv.zip")
ex4data <-read.csv("./lab4dataset.csv",header=TRUE, sep=";")

library(lattice)

#4.2 Create a barchart
barchart(ex4data$team ~ex4data$gd, main="Teams", xlab="Goals")

#4.3 Create two datasets by subsetting..
d1 <- ex4data[ex4data$team==1,]
d2 <- ex4data[ex4data$team==2,]

bwplot(d1$gs)
bwplot(d2$gs)

#4.4 Create a density plot
densityplot(~ex4data$gs|ex4data$team, main="Goals",xlab="Team")

#4.5 Create a historgram of win matches 
histogram(~ex4data$win|ex4data$team, col = "red")

#4.6 Create a plot of goals received...
xyplot(ex4data$gs~ex4data$gd + ex4data$home|ex4data$team, main="Goals R. ~ Goals D. & Play at Home", ylab="Goals D.", xlab="Goals R. & Play at Home")

#4.7 Create a quantile-quantile plot 
qq(lab4data $win ~ lab4data $gs + lab4data $inj | lab4data $team, aspect = 1)
