###################################################################
### CONTUS GROUNDWATER MODEL -Tess Russo, Laureline Josset
### lj2390@columbia.edu
### SIMULATION FUNCTION: for a given groundwater model, the code computes the corresponding lateral flow and piezometric head
###################################################################

head1 <- matrix(NA, ncol = n_timestep, nrow = n_county)
head3 <- matrix(NA, ncol = n_timestep, nrow = n_county)
lateral_flow1 <- matrix(0, ncol = n_timestep, nrow = n_county)
lateral_flow3 <- matrix(0, ncol = n_timestep, nrow = n_county)
vertical_flow <- matrix(0, ncol = n_timestep, nrow = n_county)
AtimeS1 <- 1/(county_area*storativity1)
AtimeS3 <- 1/(county_area*storativity3)
t<-1

pos <- which(connectivity_matrix==1,arr.ind = TRUE)
for(x in 1:dim(pos)[1]){
  i <- pos[x,1]
  j <- pos[x,2]
  lateral_flow1[i,t] = lateral_flow1[i,t] + (head01[j]-head01[i])*leakage_factor1[i,j]*dt
  lateral_flow3[i,t] = lateral_flow3[i,t] + (head03[j]-head03[i])*leakage_factor3[i,j]*dt
}
vertical_flow[,t] = (head01-head03)*leakage_factor2*dt

head1[,t] = head01 + AtimeS1*(recharge[,t] + lateral_flow1[,t] - vertical_flow[,t])
head3[,t] = head03 + AtimeS3*(lateral_flow3[,t] + vertical_flow[,t] - withdrawal[,t])

if(n_timestep>1){
  for(t in 2:n_timestep){
    for(x in 1:dim(pos)[1]){
      i <- pos[x,1]
      j <- pos[x,2]
      lateral_flow1[i,t] = lateral_flow1[i,t] + (head1[j,t-1]-head1[i,t-1])*leakage_factor1[i,j]*dt
      lateral_flow3[i,t] = lateral_flow3[i,t] + (head3[j,t-1]-head3[i,t-1])*leakage_factor3[i,j]*dt
    }
    vertical_flow[,t] = (head1[,t-1]-head3[,t-1])*leakage_factor2*dt
    
    head1[,t] = head1[,t-1] + AtimeS1*(recharge[,t] + lateral_flow1[,t] - vertical_flow[,t])
    head3[,t] = head3[,t-1] + AtimeS3*(lateral_flow3[,t] + vertical_flow[,t] - withdrawal[,t])
   }
}



