#Alperen KARA 2018 Advanced Statistics LAB3
#12.1 create a maximum function 
max <- function (...){
  
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
  #find an argument with the max. value using a for loop
  for(i in out){
    
    m <- out[1]
    
    if(length(i)>1){
      
      for(el in i){
        
        if(el > m){
          
          m <- el
          
        }
        
      }
      
    }
    
    else{
      
      if (i> m){
        
        m <- i
        
      }
      
    }
    
  }
  
  return(m)
  
}
#call the function 
max("test", 1:9, "test")