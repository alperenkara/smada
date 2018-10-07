##Alperen KARA 2018 Advanced Statistics LAB3
#15.1 create an off function 
odd <- function (...){
  #takes any number of arguments
  numberList <- list(...)
  
  out <- list()
  
  print(numberList)
  
  for(i in numberList){
    #convert and skip
    if(is.na(as.numeric(i))){
      
      next
      
    }
    
    else{
      #add 
      out <- append(out, as.numeric(i)) 
      
    }
    
  }
  
  for(i in out){
    
    if((i %% 2) != 0){
      
      print(i)
      
      print("It is an odd number")
      
    }
    
    else{
      
      print(i)
      
      print("It is an even number")
      
    }
    
  }
  
}

odd(1, 3, 5, 7, "test", 9)