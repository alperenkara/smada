# Data Mining 2018 
# AGH University of Science and Technology
# Alperen Kara
# 
# . Classification is the process of finding a model (classifier) that describes and
# distinguishes data classes.
# . The derived model is based on the analysis of a set of training data (objects whose
#                                                                         class label is known).
# . The model is used for prediction the class of objects whose class label is unknown.
# . Classification predicts categorical labels.
# . The model can be presented as: decision rules, decision trees, mathematical
# formulae, neural networks etc.
# . Prediction is similar to classification, but is used for prediction missing or
# unavailable numerical data values rather than class labels.
# . Regression analysis is a statistical methodology that is most often used for numeric
# prediction.
# . Classification and prediction may need to be preceded by relevance analysis, which
# attempts to identify attributes that do not contribute to the classification or prediction
# process. These attributes can then be excluded.

#The basic data structure in R is the vector. Vectors come in two flavours: atomic vectors
#and lists. They have three common properties:

# atomics vectors : 
# -logical, integer, double(numeric) and character 
# is.character(), is.double(), is.integer(), is.logical()

# Use is.atomic(x) or is.list(x) to test if an object is actually a vector
data(iris)
head(iris,5)

a=c(12,14,16)
b = list('alp',12,12.44,TRUE)

str(a)
str(b)

typeof(a)
typeof(b)
is.vector(a)
is.vector(b)
as.list(a) 
is.list(a)
is.list(b)
is.atomic(a)
is.atomic(b)

seq(1,12)
seq(3,13,by = 0.75)
seq(2,8,length = 3) -> x # divide by 3 steps with equal steps

rep(x, times=5) # each member of x will be repeated 5 times
x <- vector()
x[3] = 7
is.na(x)
x <- 1:5
x
y <- (x %% 2 == 0)
y
y <- c(13,17,19,23,29)
# y <- y[c(2,3,4)]
y
z <- y[-(2:4)] # 2. 3. 4. discard
z
paste(c("x"),1:8,sep="")

# We can access a particular element of a
# list through an index between double
# square brackets or using $ operator and
# component name.

x <- list(fn="alperen",sn="kara",grades=c(4,5,5,5,5))
x$course <- c("Data Mining","Advanced Programming Techniques")
