#Alperen KARA 2018 Advanced Statistics LAB3

#14.1 create an even fuction 
even <- function (...){
  
  numberList <- list(...)
  
  list <- list()
  
  print(numberList)
  
  for(i in numberList){
    #14.2 convert the arguments to numbers
    if(is.na(as.numeric(i))){
    #14.3 skip
      next
      
    }
    
    else{
      ##add
      list <- append(list, as.numeric(i)) 
      
    }
    
  }
  #main loop
  for(i in list){
    
    if((i %% 2) == 0){
      
      print(i)
      
      print("It is even")
      
    }
    
    else{
      
      print(i)
      
      print("It is not even")
      
    }
    
  }
  
}
#14.4 call the function
even(2, 4, 6, 8, "test", 10)