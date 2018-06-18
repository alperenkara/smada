#Advanced Statistics Lab Test 2018
#Alperen KARA
library("ggplot2", lib.loc="~/R/win-library/3.4")
#Question1 

data("airquality")

airquality[1:6,]
dataQuestion1 <- airquality[complete.cases(airquality),]
# without missing values
dataQuestion1 [1:6,] 

#Question2
question2 <- split(airquality, airquality$Month)
str(question2)
#mean of ozone column excluding missing values
meanOzone<-mean(na.omit(airquality[,1]))  
meanSolar<-mean(na.omit(airquality[,2]))
meanWind<-mean(na.omit(airquality[,3]))
#mean for every months


#Question3 

boxplot(airquality$Ozone)

boxplot(Ozone ~ Month, airquality,
        main = "Lab Test",
        xlab = "billion",
        ylab = "Ozone",
        col = "red",
        border = "brown",
        horizontal = TRUE,
        notch = TRUE
)

#Question4
hist(airquality$Ozone)
hist(airquality$Wind)
hist(airquality$Ozone, airquality$Wind)

qplot(Ozone, Wind, data=airquality, geom="point", color=Month)
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "red"))

with(airquality, plot(Wind, Ozone))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Others"))

#Question5

summary(airquality$Ozone)
summary(airquality$Wind)

#Question6

# data("diamonds")
# ggplot(data=diamonds, aes(x = carat, y = color)) +
#   geom_point(position='jitter',size=0.6,alpha=1/2) +
#     ggtitle('Price (log10 by Carat)')

relation_carat <- ggplot(data = diamonds, aes(x = color, y = carat))
relation_carat + geom_jitter(alpha=0.1)

#Question7

lrModel <- lm(diamonds$price ~ diamonds$carat)
abline(lrModel)
plot(y~x)
abline(0,lrModel,col="red", lwd=7)
abline(lrModel, col="blue", lwd=3)

linmodel <- lm(price ~ carat + (x*y*z),
               data = diamonds)
summary(linmodel)

# Residuals:
#   Min       1Q   Median       3Q      Max 
# -18762.2   -531.1    -29.8    293.1  12774.2 

#Question8
question8_Res <- lm(carat~price,data=diamonds)
summary(question8_Res)
q8_diamonds_res <- resid(question8_Res)

plot(diamonds$price, q8_diamonds_res,
     ylab="residuals", xlab="price",
     main="Price~Carat")
abline(0, 0)

