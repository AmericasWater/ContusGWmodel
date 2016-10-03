###################################################################
##### CONTUS GROUNDWATER MODEL -Tess Russo, Laureline Josset
##### lj2390@columbia.edu
#####
###################################################################

source("configuration.R")
source("initialization.R")
#source("mapinputs.R")

# SIMULATION
if(n_layer==1){
  source("simulation_onelayer.R")
}else{
  source("simulation_threelayer.R")
}

#________________________________________________________________________________________
# SAVE RESULTS
if(n_layer==1){
save(head, file = paste0("results/",filename, "_headresults.RData"))
save(lateral_flow, file = paste0("results/",filename, "_latflowresults.RData"))
}else{
  save(head1, file = paste0("results/",filename, "_headresults1.RData"))
  save(lateral_flow1, file = paste0("results/",filename, "_latflowresults1.RData"))
  save(head3, file = paste0("results/",filename, "_headresults3.RData"))
  save(lateral_flow3, file = paste0("results/",filename, "_latflowresults3.RData"))
  save(vertical_flow, file = paste0("results/",filename, "_vertflowresults2.RData"))
}
#________________________________________________________________________________________
# PLOT RESULTS
source("mapresults.R")
