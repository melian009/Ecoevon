##### RAREFACTION IN FISH COMMUNITY OF THE PORCUPINE BANK #####

# Start date:   19-06-2020 
# Last update:  21-08-2020
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
library(BiodiversityR)
library(iNEXT)
library(vegan)

# 4 # DATA ---------------------------------------------------------------------
abun.raw <- read.csv ("C:/Paco/GitHab/Tempo/PORCUPINE/Data/abun-raw.csv", header=T, row.names=1)
d <- c("survey", "haul_no", "date",	"strata",	"depht.strata",	"rectangle",	"lat", "lon", "depht", "time")
a <- abun.raw[ , !(names(abun.raw) %in% d)]

# 5 # SPECIES ACCUMULATION CURVE -----------------------------------------------
fish1 <- accumresult(a, method="collector")
plot(fish1, ylim=c(0,200), xlim=c(1,1600), 
     lwd=2,last=1, frame.plot=F, 
     pch = 16, cex.lab = 1, cex.axis = 1, col="black", las=1,
     main = "Species accumulation curve", xlab = "No. hauls", ylab = "No. fish species")
fish.accum <- data.frame(fish1[[3]],fish1[[4]])
names(fish.accum) <- c("haul", "Cumulative number of fish species")
write.table(fish.accum,"C:/Paco/GitHab/Tempo/PORCUPINE/Data/fish-accum.csv", sep=",",dec=".",col.names=NA)
rare <- read.csv("C:/Paco/GitHab/Tempo/PORCUPINE/Data/rare.csv", header=T)
points(x= rare$haul, y=rare$accum_rare, pch =20, col = 2, cex =1.5)

fish2 <- accumresult(a, method="exact")
par(mfcol=c(1,1), mar=c(5,5,5,5))
plot(fish2, ci.type="polygon", ylim=c(0,200), xlim=c(1,1600), 
     lwd=2, ci.lty=0, ci.col="gray80", last=1, frame.plot=F, 
     pch = 16, cex.lab = 1, cex.axis = 1, col="black", las=1,
     main = "Species accumulation curve", xlab = "No. hauls", ylab = "No. fish species")


# 6 # SAMPLE COVERAGE -----------------------------------------------
abun.raw$no_ind <- rowSums(a)
abun.raw$no_spp <- apply(a, 1, function (a) {sum(a != 0)})
abun.raw$no_singletons <- apply(a, 1, function (a) {sum(a == 1)})
abun.raw$no_doubletons <- apply(a, 1, function (a) {sum(a == 2)})

n <- abun.raw$no_ind
f1 <- abun.raw$no_singletons
f2 <- abun.raw$no_doubletons
 
for (c in 1:nrow(abun.raw)){
        abun.raw$coverage[c] <- if (f1[c] == 0){1} else
        {1 - (f1[c]/n[c])*(((n[c]-1)*f1[c])/(((n[c]-1)*f1[c])+2*f2[c]))}
}       

summary(abun.raw$coverage)


abun.raw2 <- abun.raw[abun.raw$time != 0,] # Data without 0-min tows
summary(abun.raw2)

abun.raw3 <- abun.raw[abun.raw$time == 0,] # 0-min tows data
summary(abun.raw3)


plot(abun.raw2$no_ind,abun.raw2$no_spp)
bp1 <- boxplot(abun.raw2$no_ind)
bp2 <- boxplot(abun.raw2$no_spp)

plot(abun.raw2$time,abun.raw2$no_spp)
r <- lm(abun.raw2$no_spp~abun.raw2$time)
abline(r)
summary(r)
plot(r)

plot(abun.raw$time,abun.raw$no_spp)
r <- lm(abun.raw$no_spp~abun.raw$time)
abline(r)
summary(r)
plot(r)

