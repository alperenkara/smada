#Advanced Statistics 2018
#LAB12 Regression part2
#Exercises
#Alperen KARA

#1 Load
install.packages("mlbench")
library("mlbench", lib.loc="~/R/win-library/3.4")
library("ggplot2", lib.loc="~/R/win-library/3.4")
install.packages("dplyr")
library("dplyr", lib.loc="~/R/win-library/3.4")

?BostonHousing
#variables:
# crim	 per capita crime rate by town
# zn	 proportion of residential land zoned for lots over 25,000 sq.ft
# indus	 proportion of non-retail business acres per town
# chas	 Charles River dummy variable (= 1 if tract bounds river; 0 otherwise)
# nox	 nitric oxides concentration (parts per 10 million)
# rm	 average number of rooms per dwelling
# age	 proportion of owner-occupied units built prior to 1940
# dis	 weighted distances to five Boston employment centres
# rad	 index of accessibility to radial highways
# tax	 full-value property-tax rate per USD 10,000
# ptratio	 pupil-teacher ratio by town
# b	1000(B - 0.63)^2 where B is the proportion of blacks by town
# lstat	 percentage of lower status of the population
# medv	 median value of owner-occupied homes in USD 1000's
data("BostonHousing")


#2 Explore and visualize the distrubition of the target variable
mainData <- BostonHousing

mainData %>%
ggplot(aes(x = medv))+stat_density()
##################################
#3 Potential correlations between medv and the variables crim,rm ....
library("reshape2", lib.loc="~/R/win-library/3.4")
mainData %>%
  select(c(crim, rm, age, rad, tax, lstat, medv)) %>%
  melt(mainData, id.vars = "medv") %>%
  ggplot(aes(x = value, y = medv, colour = variable)) +
  geom_point(alpha = 0.7) +
  stat_smooth(aes(colour = "black")) +
  facet_wrap(~variable, scales = "free", ncol = 2) +
  labs(x = "Variable Value", y = "Median House Price ($1000s)") +
  theme_minimal()

##################################
#4 Set a seed of 123...


install.packages("caret")
library("caret")
set.seed(123)
split_train <- createDataPartition(y = mainData$medv, p = 0.75, list = FALSE)
train <- mainData[split_train, ]
test <- mainData[-split_train, ]
####################################

#5 As you see crim, rm , tax...

fit_linear_model <- lm(medv ~ crim + rm + tax + lstat, data = train)

####################################


#6 Obtain an r-squared value for your model....

linear_rsquared <- summary(fit_linear_model)$r.squared
print(paste("Linear model has an r-squared value of ", round(linear_rsquared, 3), sep = ""))
plot(fit_linear_model)
###########################################

#7 

second_fit_linear_model <- lm(log(medv) ~ crim + rm + tax + lstat, data = train)
############################################
#8 Examine the diagnotics for the model 
second_linear_model_rsquared <- summary(second_fit_linear_model)$r.squared
round(second_linear_model_rsquared, 3)
#0.735
######################################
#9Create a data frame of your predicted

predicted <- predict(second_fit_linear_model, newdata = test)
results <- data.frame(predicted = exp(predicted), original = test$medv)

####################################
#10 Plot this to visualize the performance of your model 

results %>%
  ggplot(aes(x = predicted, y = original)) +
  geom_point() +
  stat_smooth() +
  labs(x = "Predicted Values", y = "Original Values", title = "Predicted vs. Original Values") +
  theme_minimal()
