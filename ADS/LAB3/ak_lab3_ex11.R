#Alperen KARA 2018 Advanced Statistics LAB3
#11.1 create a fac function which takes one argument

fac <- function(x){
  
  y <- 1
  
  if(is.na(as.integer(x))){
    #11.3 if the value can not be converted to a nat. number  assign a NA value
    x <- NA
    
    return(x)
    
  }
  
  else{
    #11.2 convert the argument to a natural number.
    x <- as.integer(x)
    
    #write a function that will calculate the fac for a given argument (n!)
    for(i in 1:x){
      
      y <-y*((1:x)[i])
      
    }
    
  }
  
  return(y)
  
}
#calculate factorial
fac(10) #3628800