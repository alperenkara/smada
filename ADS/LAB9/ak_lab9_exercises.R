#ADS 2018, 
#lab 9 Statistical Inference Part 3
#Alperen KARA
#1 Download and extract 
download.file("http://home.agh.edu.pl/~mmd/_media/dydaktyka/as-is/mlb2011.zip", "mlb2011.zip")
unzip("mlb2011.zip")
TEAM <- read.csv("./mlb2011.csv", header = TRUE)
TEAM
