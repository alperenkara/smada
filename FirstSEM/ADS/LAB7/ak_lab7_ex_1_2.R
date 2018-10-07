#Advanced statistics-2018
#Lab7
#Alperen KARA

setwd("~/AMSDC/AdvancedStatistics/LAB7")
set.seed(1)
random_numbers = runif(10,1,100)
###2
set.seed(1)
for(a in c(random_numbers)){
if(a > 0.5 ) {
  print(paste("head")) }
 else {print("tail")}
}
###3
set.seed(1)
unfairCoin <- rbinom(10, 1, 0.3)

###4
set.seed(1)
die_roll = runif(10,0,6)
ceiling(die_roll)
##[1] 3 4 3 5 5 4 3 3 2 4 RESULT

###5
windows()
set.seed(1)
heightsOfPeople <- rnorm(n = 100, mean = 1.70, sd = 0.1 )
summary(heightsOfPeople)
###6 Use pnorm to answer that questions
#6.a) 
pnorm(1.90, mean = 1.70 , sd = 0.1)
# Answer: 0.9772499
#6.b)
pnorm(1.60, mean = 1.70, sd = 0.1)
#7 The waiting time at a doctor's clinic
set.seed(1)
waiting <- rexp(rate = 1/50, n = 30)

#7.a) waiting time average 

qexp(.5, rate = 1/50)
#7.b)
set.seed(1)
pexp(50,1/50,lower.tail = FALSE )

