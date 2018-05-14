#ADS 2018, 
#lab 9 Statistical Inference Part 3
#Alperen KARA
#1 Download and extract 
download.file("http://home.agh.edu.pl/~mmd/_media/dydaktyka/as-is/mlb2011.zip", "mlb2011.zip")
unzip("mlb2011.zip")
TEAM <- read.csv("./mlb2011.csv", header = TRUE)
TEAM
boxplot(TEAM, vertical = TRUE)
# 2 - statistics on a dataset
#field advantage value
TEAMC<- TEAM$HomeWins/TEAM$AllWins
boxplot(TEAMC)
#on the plot we can observe two outliers
#boxplot stats
#$stats
#[1] 0.4556962 0.5098039 0.5272028 0.5500000 0.5937500
boxplot.stats(TEAMC)
#mean value
mean(TEAMC) #0.5258335
#median value
median(TEAMC) #0.5272028
#3 Compare just hightest
#minimum value - the lowest percentage is 43%
min(TEAMC)
minind<- which(TEAMC ==min(TEAMC))
#maximal value - the higear percentage is 59%
max(TEAM)
maxind<- which(TEAMC ==max(TEAMC))
TEAM$Team[maxind]
TEAM$Team[minind]
