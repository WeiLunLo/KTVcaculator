library(dplyr)
library(shinythemes)

boxN <- "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/boxname.csv"
boxName <- read.csv(boxN,header = T, sep = ",",fileEncoding='big5')

MTWT <- "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/boxMTWT.CSV"
boxMTWT <- read.csv(MTWT,header = T, sep = ",",fileEncoding='big5')
Fri <- "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/boxFri.CSV"
boxFri <- read.csv(Fri,header = T, sep = ",",fileEncoding='big5')
Sat <- "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/boxSat.CSV"
boxSat <- read.csv(Sat,header = T, sep = ",",fileEncoding='big5')
Sun <- "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/boxSun.CSV"
boxSun <- read.csv(Sun,header = T, sep = ",",fileEncoding='big5')

hMTWT <- "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/headMTWTAll.csv"
headMTWTAll <- read.csv(hMTWT,header = T, sep = ",",fileEncoding='big5')
hMTWTs <- "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/headMTWTStud.csv"
headMTWTStud <- read.csv(hMTWTs,header = T, sep = ",",fileEncoding='big5')

hFri <- "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/headFriAll.csv"
headFriAll <- read.csv(hFri,header = T, sep = ",",fileEncoding='big5')
hFris <- "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/headFriStud.csv"
headFriStud <- read.csv(hFris,header = T, sep = ",",fileEncoding='big5')

hSat <- "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/headSatAll.csv"
headSatAll <- read.csv(hSat,header = T, sep = ",",fileEncoding='big5')
hSats <- "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/headSatStud.csv"
headSatStud <- read.csv(hSats,header = T, sep = ",",fileEncoding='big5')

hSun <- "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/headSunAll.csv"
headSunAll <- read.csv(hSun,header = T, sep = ",",fileEncoding='big5')
hSuns <- "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/headSunStud.csv"
headSunStud <- read.csv(hSuns,header = T, sep = ",",fileEncoding='big5')
