##Alperen KARA 2018 Advanced Statistics LAB3

#9.1 Create a sum function that takes any number of arguments 
#9.1 (including numeric ortext arguments).

MYsum <- function(...){
  
  numberList <- list(...)
 out <- 0
  for(i in numberList){
    #9.2 convert the arguments to numbers 
    if(is.na(as.numeric(i))){
      #9.3 if any of entered values can not be converted to the number skip!
      next
    }
    else if(length(i)>1){
      out_f <- 0
      for(el in i){
        out_f <- out_f + el
      }
     out <-out + out_f
    }
    else{
     out <-out + as.numeric(i)
    }
  }
  return(output)
}
#9.4 call MYsum
MYsum(1:9, "test", 1:9)