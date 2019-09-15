#temperature converter

#ex 2a
degF_to_degC <- function(temp_in_f=0) {
  temp_in_c = (5/9) * (temp_in_f - 32)
  return(temp_in_c) 
}

#ex 2c
degC_to_degF <- function(temp_in_c=0) {
  temp_in_f = ((9/5) *temp_in_c) + 32
  return(temp_in_f) 
}

#ex 2b
degF_to_gas <- function(temp_in_f=0){
  
  if(temp_in_f >=275 && temp_in_f < 300){
    return(1)
  }
  
  if(temp_in_f >= 300 && temp_in_f < 325){
    return(2)
  }  
  
  if(temp_in_f >= 325 && temp_in_f < 350){
    return(3)
  }
  
  if(temp_in_f >= 350 && temp_in_f < 375){
    return(4)
  }
  
  if(temp_in_f >= 375 && temp_in_f < 400){
    return(5)
  }
  
  if(temp_in_f >= 400 && temp_in_f < 425){
    return(6)
  }
  if(temp_in_f >= 425 && temp_in_f < 450){
    return(7)
  }
  
  if(temp_in_f >= 450 && temp_in_f < 475){
    return(8)
  }

  return(9)
}

decC_to_gas <- function(degrees_c=0){
  degF_to_gas(degC_to_degF(degrees_c))
}

#ex 2d
#according to the conversion table I have, this is accurate
decC_to_gas(140) #1
decC_to_gas(150) #2
decC_to_gas(160) #3 160 degrees c IS gas mark 2
decC_to_gas(180) #4
decC_to_gas(190) #5
decC_to_gas(200) #6
decC_to_gas(220) #7
decC_to_gas(230) #8
decC_to_gas(240) #9