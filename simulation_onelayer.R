###################################################################
### CONTUS GROUNDWATER MODEL -Tess Russo, Laureline Josset
### lj2390@columbia.edu
### SIMULATION FUNCTION: for a given groundwater model, the code computes the corresponding lateral flow and piezometric head
###################################################################


head <- matrix(NA, ncol = n_timestep, nrow = n_county)
lateral_flow <- matrix(0, ncol = n_timestep, nrow = n_county)

t<-1
pos <- which(connectivity_matrix==1,arr.ind = TRUE)
for(x in 1:dim(pos)[1]){
  i <- pos[x,1]
  j <- pos[x,2]
  lateral_flow[i,t] = lateral_flow[i,t] + (head0[j]-head0[i])*leakage_factor[i,j]*dt
}

head[,1] = head0 + 1/(county_area*storativity)*(recharge[,1] - withdrawal[,1] + lateral_flow[,1])


if(n_timestep>1){
  for(t in 2:n_timestep){
    for(x in 1:dim(pos)[1]){
      i <- pos[x,1]
      j <- pos[x,2]
      lateral_flow[i,t] = lateral_flow[i,t] + (head[j,t-1]-head[i,t-1])*leakage_factor[i,j]*dt
    }
    head[,t] = head[,t-1] + 1/(county_area*storativity)*(recharge[,t] - withdrawal[,t] + lateral_flow[,t])
  }
}


