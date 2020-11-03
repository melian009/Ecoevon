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
library(worms)

# 4 # TAXONOMIC INFORMATION ---------------------------------------------------------------------

esp <- read.csv("C:/Paco/GitHab/Tempo/PORCUPINE/Data/esp.csv") # List of EsP codes from CAMP
esp <- esp$ESP
ESPECIES <- read.csv ("C:/Paco/GitHab/Tempo/PORCUPINE/Data/ESPECIES.csv", header=T)
ESPECIES_P <- ESPECIES[(ESPECIES$GRUPO == 1 & ESPECIES$ESP %in% esp),]
write.table(ESPECIES_P,"C:/Paco/GitHab/Tempo/PORCUPINE/Data/ESPECIES_P.csv", sep=",",dec=".",col.names=NA)

ESPECIES_P_2 <- read.csv ("C:/Paco/GitHab/Tempo/PORCUPINE/Data/ESPECIES_P_2.csv", header=T) # APHIA filled
AphiaID <- as.integer(ESPECIES_P_2$APHIA)
fish_taxa <- wormsbyid(AphiaID)
write.table(fish_taxa,"C:/Paco/GitHab/Tempo/PORCUPINE/Data/fish_taxa.csv", sep=",",dec=".",col.names=NA)
str(fish_taxa)

