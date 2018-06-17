#Advanced Statistic 2018
#LAB13 Additional Exercises
#Logistic regression in R
#Exercise 1
install.packages("MASS")
library("MASS", lib.loc="~/R/win-library/3.4")
library(ggplot2)

trainData <- rbind(Pima.tr, Pima.tr2)
testData  <- Pima.te

trainData$type <- as.integer(trainData$type) -  1L
testData$type <- as.integer(testData$type) - 1L
sapply(trainData, function(x) sum(is.na(x)))

#Exercise 2

pairs(subset(trainData, select = -c(type)),
      col = as.factor(trainData$type))

ggplot(trainData, aes(x = age, y = type)) +
  geom_jitter(width = 0.5, height = 0.07, alpha = .2) +
  geom_smooth(method = "glm", se = FALSE,
              method.args = list(family = "binomial")) +
  labs(y = expression(hat(P)(Diabetic)))

#Exercise 3
lg1 <- glm(type ~ age + bmi, data = trainData, family = binomial)
summary(lg1)$coefficients[, c(1, 4)]
# Estimate     Pr(>|z|)
# (Intercept) -5.79828987 3.019829e-17
# age          0.05383783 2.628863e-09
# bmi          0.10256607 2.972812e-09

#Exercise 4

predict(lg1, type = "response",
        newdata = data.frame(bmi = c(32, 22), age = 35))
lgs_fun <- function(par, x) {
  1 / (1 + exp(-x %*% par))
}
  
#Exercise 5
lgs_fun(lg1$coefficients, c(1, 55, 37)) / (1 - lgs_fun(lg1$coefficients, c(1, 55, 37)))

#Exercise 6

cm1 <- table(trainData$type[!is.na(trainData$bmi)],
             predict(lg1, type = "response") >= 0.5)
sum(diag(cm1)) / sum(cm1) #0.6740443

#Exercise 7

sapply(testData, function(x) sum(is.na(x))) 
# npreg   glu    bp  skin   bmi   ped   age  type 
# 0     0     0     0     0     0     0     0

test_pred <- predict(lg1, type = "response", newdata = testData)
test_predm <- lgs_fun(lg1$coefficients, as.matrix(cbind(1, testData[, c("age", "bmi")])))

cm1_test <- table(test$type,
                  test_pred >= 0.5)

sum(diag(cm1_test)) / sum(cm1_test) #0.7138554

#Exercise 8
install.packages("ROCR")
predROCR <- prediction(test_predm, test$type)
perfROCR <- performance(predROCR, "tpr", "fpr")
plot(perfROCR, colorize = TRUE)
#Exercise 9

lg2 <- glm(type ~ age + bmi + npreg, data = train, x = TRUE, family = binomial)

test_pred <- predict(lg2, type = "response", newdata = test)
predROCR <- prediction(test_pred, test$type)
perfROCR <- performance(predROCR, "tpr", "fpr")
plot(perfROCR, colorize = TRUE)

#Exercise 10

ex10data <- data.frame(age = 35, bmi = c(25, 35), npreg = 2)
diff(predict(lg2, type = "response", newdata = ex10data)) 

diff(predict(lg2, type = "response", newdata = ex10data)) /
  predict(lg2, type = "response", newdata = ex10data)

p <- lgs_fun(lg2$coefficients, c(1, 35, 25, 2))

p*(1 - p)*lg2$coefficients[3] 
