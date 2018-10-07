#ADS 2018, 
#lab 9 Statistical Inference Part 3
#Alperen KARA
?state.area
#add library
library(datasets)
data(state.area)
area <-state.area
#2.3 create the histogram of the area
hist(area)
#2.4 create the boxplot of the area and....
boxplot(area)
boxplot.stats(area)
summary(area)
#3.5 compare..
mean(area) #72367.98
median(area) #56222
mean(area, trim = .05) #59957.22, not robust
mean(area, trim = .10) #57781, not robust
mean(area, trim = .20) #57524.03, not robust
mean(area, trim = .50) #56222, robust with median !
#2.6 
sd(area) # 88278.01
mad(area) # Median absolute deviation #35711.39
IQR(area)#45916.75
#3.1
download.file("http://home.agh.edu.pl/~mmd/_media/dydaktyka/as-is/os.csv.zip", "os.csv.zip")
unzip("os.csv.zip")
OS <- read.csv("./os.csv", header = TRUE)
View(OS)
#3.2 Create a new dataset without the outliers
OS.hi <- subset(OS, Proportion > 0.1)
#3.3 In quantitative data the easiest way to see outliers is using boxplots..
require("datasets")
?rivers
data(rivers)
hist(rivers)
#3.4 Create the boxplot for rivers
boxplot(rivers, horizontal = TRUE)
#3.5 Get the statistics from boxplot.stats ...
boxplot.stats(rivers)
#3.6 Remove the outliers...
rivers.low <- rivers[rivers < 1210]
boxplot(rivers.low, horizontal = TRUE)
#why we still have the outliers ?
#Because they are still in the range 
#3.7
rivers.low2 <- rivers[rivers < 1055]
boxplot(rivers.low2)
## Transforming Variables
#TV1 Load data from file islands and display the histogram of them
?islands
islands
hist(islands, breaks = 16)
#TV2 display the boxplot
boxplot(islands)
#TV3 transform the scores into z-scores
islands.z <- scale(islands)
#TV4 Check if mean value is equal to 0 
mean(islands.z) #-1.446393e-17
round(mean(islands.z), 2) # zero
sd(islands.z) #jeden
#TV5 After scaling the data..
attr(islands.z, "scaled:center") #1252.729
attr(islands.z, "scaled:scale") # 3371.146
#TV6 Convert the matrix
islands.z <- as.numeric(islands.z)
islands.z
#TV7 Transform data with logarithmic transformations
islands.ln <- log(islands)
hist(islands.ln)
boxplot(islands.ln)
#TV8 Transform the original data by using ranking
islands.rank <- rank(islands)
hist(islands.rank)
boxplot(islands.rank)
#TV9 Dichotomize data by using the ifelse conditional..
continent <- ifelse(islands > 1000, 1, 0)
continent


#COmparing means with the 2 sample t-test
#1 Look at the sleep data set and then display the first 5 lines of the dataset
?sleep
sleep[1:5, ]
#2 Save just the first two variables
sd <- sleep[, 1:2]
#3 
hist(sd$extra, col = "lightgray")
boxplot(extra ~ group, data = sd)
#4
t.test(extra ~ group, data = sd)
#mean in group 1 mean in group 2 
#0.75            2.33 
#5
t.test(extra ~ group,
       data = sd,
       alternative = "less",
       conf.level = 0.80)
#6 create two groups..
x <- rnorm(30, mean = 20, sd = 5)
y <- rnorm(30, mean = 22, sd = 5)
t.test(x, y)
#mean of x mean of y 
#18.58043  20.57221 
#7 repeat last three lines result :
#mean of x mean of y 
#20.35354  21.87403 

#Comparing paired means with paired t-test
#1
t1 <- rnorm(50, mean = 52, sd = 6)
#2
dif <- rnorm(50, mean = 6, sd = 12)
t2 <- t1 + dif
#3 make and analyze histograms... 
hist(t1)
hist(dif)
hist(t2)
boxplot(t1, t2)
#Create parallel coordinate
pairs <- data.frame(t1, t2)
require("MASS")
parcoord(pairs, var.label = TRUE)
#5 do the paired
t.test(t2, t1, paired = TRUE)
#mean of the differences 8.809322
#6 Change the settings of the paired t-test
t.test(t2, t1, paired = TRUE, mu = 6, alternative = "greater",conf.level = 0.99)
#sample estimates:
 # mean of the differences 
#8.809322

