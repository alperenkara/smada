##Alperen KARA 2018 Advanced Statistics LAB3
#16.1 create a fibonacci function 
#

fibo=function(n){
  
  fibo=vector()
  
  fibo[1]=1
  
  fibo[2]=1
  
  for(i in 3:n){fibo[i]=fibo[i-1]+fibo[i-2]}
  
  return(fibo)
  
}

fibo(10)