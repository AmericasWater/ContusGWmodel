################################################
### INITIALIZATION #############################
################################################
if(model_layer == "full"){
  n_layer <- 3
}else{
  n_layer <- 1
}

#________________________________________________________________________________________
# LOAD AQUIFER MODEL
if(n_county != 3109){
  print("Model exists only at the national scale for now")
  
}else{
  filename = paste0(model_data,"gwdata_",model_type)
  if(model_type !="truncrnorm"){
    load(paste0("data/precomputed/",filename,".RData"))
  }else{
    print("script missing")
    #source("data/random/generate_truncrnorm_GWmodel.R")
  }
  county_area <- gwmodel$county_area
  connectivity_matrix <- gwmodel$connectivity_matrix
  if(n_layer==1){
    if(model_layer==1){
    leakage_factor <- gwmodel$leakage_factor1
    storativity <- gwmodel$storativity1
    }else if(model_layer==3){
      leakage_factor <- gwmodel$leakage_factor3
      storativity <- gwmodel$storativity3
    }
  }else if(n_layer==3){
    leakage_factor1 <- gwmodel$leakage_factor1
    leakage_factor2 <- gwmodel$leakage_factor2
    leakage_factor3 <- gwmodel$leakage_factor3
    storativity1 <- gwmodel$storativity1
    storativity3 <- gwmodel$storativity3
  }
}
#________________________________________________________________________________________
# LOAD RECHARGE INPUTS
if(recharge_model=="zero"){
  recharge <- array(0, dim = c(n_county, n_timestep))
}else if(recharge_model=="VIC"){
  if(dt<1){
    print("Recharge VIC data only at monthly-scale")
  }else{
    print("Not implemented yet")
}}

#________________________________________________________________________________________
# INITIALIZE HEAD
if(head_init=="null"){
  if(n_layer==1){
    head0 <- matrix(0, ncol=1,nrow=n_county)
  }else{
    head01 <- matrix(0, ncol=1,nrow=n_county)
    head03 <- matrix(0, ncol=1,nrow=n_county)
  }
}else if(head_init=="total"){
  print("Not implemented yet")
}

#________________________________________________________________________________________
# INITIALIZE WITHDRAWALS in m3
if(demand_model == "USGS"){
  usgsdata<-read.csv("data/demand/simulation2010demanddata.csv")
  withdrawal <- array(usgsdata$TO_WGWTo,dim = c(n_county,n_timestep))*1000/(12*dt)
}
