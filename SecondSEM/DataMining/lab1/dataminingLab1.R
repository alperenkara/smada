# Alperen Kara 
# Data Mining Lab1  10/10/2018

# Exercise 1.1
x <- c("blue","red","black","green")
color <- factor(x)
pattern <- list(sample(color,500,replace = TRUE))

#Exercise 1.2
library(units)
data(cars)
cars2 <- cars

cars2_speed <- set_units(cars2$speed,m/s)
cars2_distance <- set_units(cars2$dist,m)

# plot(cars2_distance, cars2_speed,
#      xlab = "Distance",
#      ylab = "Speed")
scatter.smooth(x=cars2_speed, y=cars2_distance, main="Dist ~ Speed")  # scatterplot

linearMod <- lm(dist ~ speed, data=cars) 
summary(linearMod)
km <- cars$speed
cars2[["km/h"]] <- km

# value <- data.frame(places=c(A, B))
# value <- data.frame(temperature=(17,25))
# 
# convert_celcius <- function(temperature)
#   fahrenheit <- (temperature-32)*5/9+273

# Exercise 1.3
age <- c(13, 15, 16, 16, 19, 20, 20, 21, 22, 22, 25, 25, 25, 25, 30, 33, 33, 35, 35, 35, 35, 36, 40, 45, 46, 52, 70)
mean(age)

# Create the function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}


# Calculate the mode using the user function.
result <- getmode(age)
print(result)

# midrange 
minV <- min(age)
maxV <- max(age)
midrange <- (minV+maxV)/2
quantile(age)
summary(age)
boxplot(age)

# Exercise 1.4
age <- data.frame(age=c(23, 23, 27, 27, 39, 41, 47, 49, 50, 52, 54, 54, 56, 57, 58, 58, 60, 61))
fat <- data.frame(fat=c(9.5, 26.5, 7.8, 17.8, 31.4, 25.9, 27.4, 27.2, 31.2, 34.6, 42.5, 28.8, 33.4, 30.2, 34.1, 32.9, 41.2, 35.7))
hospital[["age"]] <- age
hospital[["fat"]] <- fat
mean(hospital$fat)
