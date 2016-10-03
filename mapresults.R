source("plots/plots.R")

t <- n_timestep

if(n_layer==1){
  mapdata(head[,t],"Head in m")
  mapdata(lateral_flow[,t],"Lateral flow in m3")
}else{
  mapdata(head1[,t],"Head layer 1 in m")
  mapdata(head3[,t],"Head layer 3 in m")
  mapdata(lateral_flow1[,t],"Lateral flow layer 1 in m3")
  mapdata(lateral_flow3[,t],"Lateral flow layer 3 in m3")
  mapdata(vertical_flow[,t],"Vertical flow in m3")
}