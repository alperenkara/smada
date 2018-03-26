##Alperen KARA 2018 Advanced Statistics LAB3

#10.1 create an average function 
average <- function (...){
  
  numberList <- list(...)
  
  out <- 0
  
  num_elements <- 0
  
  for(i in numberList){
    #10.2 conver the arguments to numbers
    if(is.na(as.numeric(i))){
      next
    }
    else if(length(i)>1){
      out_f <- 0
      #10.3 for loop
      for(el in i){
        out_f <- out_f + el
      }
      out <- out + out_f
      num_elements <- num_elements + length(i)
    }
    else{
      out <- out + as.numeric(i)
      num_elements <- num_elements + 1
      }
     }
  
  return(out/num_elements)
  
}
#10.4 call created function
average(1:9, "test", 1:9)