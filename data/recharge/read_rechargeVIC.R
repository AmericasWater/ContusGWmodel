library("ncdf4")
datavic=nc_open("VIC_WB.nc")
vicfips=ncvar_get(datavic,"county_fips") + 1000*ncvar_get(datavic,"state_fips")
rge_vic=ncvar_get(datavic,"recharge")
rge=matrix(0,nrow=n_county,ncol=n_timestep)

for(i in 1:(n_county-1)){
  for(m in 1:12){
    rge[i,m]=recharge[m,which(vicfips==v_FIPS[i])]*area_county[i]/1000
  }
}
i=3108
for(m in 1:12){
  rge[i,m]=recharge[m,which(vicfips==v_FIPS[i-1])]*area_county[i]/1000
}
