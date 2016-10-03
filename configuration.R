################################################
### CONFIGURATION ##############################
################################################
#________________________________________________________________________________________
# GROUNDWATER MODEL
# Number of counties: 
#     3109 for the national model.
n_county <- 3109

# Layers represented in the model: 
#     1  for the surficial unconfined aquifer
#     3  for the deep confined aquifer
# "full" for the full model.
model_layer <- 3

# model for aquifer properties T, K, S
#     data: to specify "gleeson" or "full"
#     type: to specify which values should be picked "mean","min" or "max"
#     "truncrnorm" values generated randomly following a truncated gaussian distribution
model_data <- "full"
model_type <- "mean"

#________________________________________________________________________________________
# SIMULATION PARAMETERS
# Time
#     total simulation time in month
total_simulation_time <- 12
#     step length in months
dt <- 1
#     number of timesteps
n_timestep <- dt*total_simulation_time

# Recharge: "zero" if no recharge, "VIC" to load vic restuls
recharge_model <- "zero"

# Head initialization: "null" to investigate anthropogenic effect, "total" when starting with USGS estimates
head_init <- "null"

# Water demands: "USGS" for yearly 2010 withdrawals in m3
demand_model <- "USGS"
#________________________________________________________________________________________

