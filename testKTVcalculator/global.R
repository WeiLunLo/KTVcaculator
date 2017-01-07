library(dplyr)
library(shinythemes)
MTWT <- "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/boxMTWT.CSV"
boxMTWT <- read.csv(MTWT,header = T, sep = ",",fileEncoding='big5')
Fri <- "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/boxFri.CSV"
boxFri <- read.csv(Fri,header = T, sep = ",",fileEncoding='big5')
Sat <- "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/boxSat.CSV"
boxSat <- read.csv(Sat,header = T, sep = ",",fileEncoding='big5')
Sun <- "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/boxSun.CSV"
boxSun <- read.csv(Sun,header = T, sep = ",",fileEncoding='big5')
