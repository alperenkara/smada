#Alperen KARA 2018 Advanced Statistics LAB3

#13.1 create a min. function which takes any number...

min <- function (...){
  
  numberList <- list(...)
  out <- list()
  for(i in numberList){
    #convert the arguments to numbers
    if(is.na(as.numeric(i))){
      next
    }
    else{
      #add elements
      out <- append(out, as.numeric(i))
      }
  }
  #find an argument with the min. value using a for loop
  for(i in out){
    m <- out[1]
    
    if(length(i)>1){
      
      for(el in i){
        
        if(el < m){
          
          m <- el
        }
      }
    }
    else{
      if (i< m){
        m <- i
     }
    }
  }
  return(m)
}
#call the function 
min("test", 1:9, "test")