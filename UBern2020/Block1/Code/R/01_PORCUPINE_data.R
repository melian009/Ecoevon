##### RAREFACTION IN FISH COMMUNITY OF THE PORCUPINE BANK #####

# Start date:   19-06-2020 
# Last update:  18-08-2020
# Authors: Francisco Baldó, IEO (francisco.baldo@ieo.es)
#          Carlos Melián, EAWAG (Carlos.Melian@eawag.ch)
# General objective: 
# Paper: 


# 1 # R VERSION ----------------------------------------------------------------
Rversion <- R.Version()
Rversion$version.string
# "R version 4.0.2 (2020-06-22)"


# 2 # WORKING DIRECTORY --------------------------------------------------------
rm(list=ls())
getwd()
dir()
setwd("C:/Paco/GitHab/Tempo/PORCUPINE/Code/R")
dir()


# 3 # LIBRARIES ----------------------------------------------------------------
library(CampR)     # CampR 0.7.18


# 4 # DATA ---------------------------------------------------------------------
# Fish species of Porcuine 
esp <- read.csv("C:/Paco/GitHab/Tempo/PORCUPINE/Data/esp.csv") # List of EsP codes from CAMP
esp <- esp$ESP

# Abundance matrix (ind./haul)
a <- NULL
for (c in 1:length(Psh)){
  a[[c]] <- cbind(datlan.camp(camp = Psh[c], dns="Porc")[c(38,1,18,2,11,21,5,7,9)], 
                  round(datlan.camp(camp = Psh[c], dns="Porc")[32]*30),
                  data.frame(datgr.camp(gr=1, 2, camp = Psh[c], dns="Porc", cor.time=F, incl2=T)[6]))
  for (d in 2:length(esp)){
    a[[c]] <- cbind(a[[c]], data.frame(datgr.camp(gr=1, esp[d], camp = Psh[c], 
                                                  dns="Porc", cor.time=F, incl2=T)[6])) 
  }
}
abun.raw <- NULL
for (c in 1:length(Psh)){
  abun.raw <- rbind(abun.raw, a[[c]])
}
names(abun.raw) <- c("survey", "haul_no", "date", "strata", "depht strata", 
                     "rectangle", "lat", "lon", "depht", "time", esp)
str(abun.raw)
summary(abun.raw)
write.table(abun.raw,"C:/Paco/GitHab/Tempo/PORCUPINE/Data/abun-raw.csv", sep=",",dec=".",col.names=NA)

# Abundance matrix (ind./30 min)
a <- NULL
for (c in 1:length(Psh)){
  a[[c]] <- cbind(datlan.camp(camp = Psh[c], dns="Porc")[c(38,1,18,2,11,21,5,7,9)], 
                  round(datlan.camp(camp = Psh[c], dns="Porc")[32]*30), 
                  data.frame(datgr.camp(gr=1, 2, camp = Psh[c], dns="Porc", cor.time=T, incl2=T)[6]))
  for (d in 2:length(esp)){
    a[[c]] <- cbind(a[[c]], data.frame(datgr.camp(gr=1, esp[d], camp = Psh[c], 
                                                  dns="Porc", cor.time=T, incl2=T)[6])) 
  }
}
abun.std <- NULL
for (c in 1:length(Psh)){
  abun.std <- rbind(abun.std, a[[c]])
}
names(abun.std) <- c("survey", "haul_no", "date", "strata", "depht strata", 
                     "rectangle", "lat", "lon", "depht", "time", esp)
str(abun.std)
summary(abun.std)
write.table(abun.std,"C:/Paco/GitHab/Tempo/PORCUPINE/Data/abun-std.csv", sep=",",dec=".",col.names=NA)

# Biomass matrix (g/haul)
b <- NULL
for (c in 1:length(Psh)){
  b[[c]] <- cbind(datlan.camp(camp = Psh[c], dns="Porc")[c(38,1,18,2,11,21,5,7,9)], 
                  round(datlan.camp(camp = Psh[c], dns="Porc")[32]*30),
                  data.frame(datgr.camp(gr=1, 2, camp = Psh[c], dns="Porc", cor.time=F, incl2=T)[5]))
  for (d in 2:length(esp)){
    b[[c]] <- cbind(b[[c]], data.frame(datgr.camp(gr=1, esp[d], camp = Psh[c], 
                                                  dns="Porc", cor.time=F, incl2=T)[5])) 
  }
}
biom.raw <- NULL
for (c in 1:length(Psh)){
  biom.raw <- rbind(biom.raw, b[[c]])
}
names(biom.raw) <- c("survey", "haul_no", "date", "strata", "depht strata", 
                     "rectangle", "lat", "lon", "depht", "time", esp)
str(biom.raw)
summary(biom.raw)
write.table(biom.raw,"C:/Paco/GitHab/Tempo/PORCUPINE/Data/biom-raw.csv", sep=",",dec=".",col.names=NA)

# Biomass matrix (g/30 min)
b <- NULL
for (c in 1:length(Psh)){
  b[[c]] <- cbind(datlan.camp(camp = Psh[c], dns="Porc")[c(38,1,18,2,11,21,5,7,9)], 
                  round(datlan.camp(camp = Psh[c], dns="Porc")[32]*30),
                  data.frame(datgr.camp(gr=1, 2, camp = Psh[c], dns="Porc", cor.time=T, incl2=T)[5]))
  for (d in 2:length(esp)){
    b[[c]] <- cbind(b[[c]], data.frame(datgr.camp(gr=1, esp[d], camp = Psh[c], 
                                                  dns="Porc", cor.time=T, incl2=T)[5])) 
  }
}
biom.std <- NULL
for (c in 1:length(Psh)){
  biom.std <- rbind(biom.std, b[[c]])
}
names(biom.std) <- c("survey", "haul_no", "date", "strata", "depht strata", 
                     "rectangle", "lat", "lon", "depht", "time", esp)
str(biom.std)
summary(biom.std)
write.table(biom.std,"C:/Paco/GitHab/Tempo/PORCUPINE/Data/biom-std.csv", sep=",",dec=".",col.names=NA)

