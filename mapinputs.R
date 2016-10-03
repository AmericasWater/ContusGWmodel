source("plots/plots.R")

if(n_layer==1){
  mapdata(rowSums(leakage_factor),"leakage factor lateral in m2/month","log1p")
  mapdata(head0,"Head initial in m")
  mapdata(withdrawal,"withdrawal in m3")
  mapdata(storativity,"Storativity [-]","log")
}else{
  mapdata(rowSums(leakage_factor1),"leakage factor lat 1 in m2/month","log1p")
  mapdata(leakage_factor2,"leakage factor vert in m2/month","log1p")
  mapdata(rowSums(leakage_factor3),"leakage factor lat 3 in m2/month","log1p")
  mapdata(head01,"h0 L3 in m")
  mapdata(head03,"h0 L1 in m")
  mapdata(withdrawal,"withdrawal in m3")
  mapdata(storativity1,"s1 -","log")
  mapdata(storativity3,"s3 -","log")
}
