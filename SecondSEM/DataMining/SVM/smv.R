# AGH University of Science and Technology 
# EAIiIB, SMADA, Data Mining 2018
# Alperen KARA
InLength = c(3.87,3.61,4.33,3.43,3.81,3.83,3.46,3.76,3.50,3.58)
InWeight = c(4.87,3.93,6.46,3.33,4.38,4.70,3.50,4.50,3.58,3.64)
alligator <- data.frame(InLength,InWeight)
plot(InWeight~InLength,data=alligator,
xlab = "length",     
ylab = "weight on log scale",
main = "Alligators in Central Florida"
     )
alligator.model1 = lm(InWeight~InLength,data=alligator)
summary(alligator.model1)
