if (temptable$store[1]=="好樂迪"){
  temptable <- mutate(temptable, avgn = (boxavg + 100)*1.1 ) %>%
    mutate(., avgfb = (boxavg +158)*1.1 )
  a <- as.data.frame(temptable$store)
  colnames(a) <- "KTV"
  b <- as.data.frame(temptable$branch)
  colnames(b) <- "分店"
  c <- as.data.frame(temptable$whichbox)
  colnames(c) <- "建議包廂類型"
  d <- as.data.frame(temptable$avgn)
  f <- as.data.frame(temptable$phone)
  colnames(f) <- "電話"
  g <- as.data.frame(temptable$address)
  colnames(g) <- "地址"
  e <- as.data.frame(temptable$avgfb)
  colnames(e) <- "每人平均(歡樂吧)"
  finaltablea <- cbind(a,b,c,d,e,f,g)%>%
    arrange(., temptable$avgn)
  names(finaltable)[names(finaltable)=="temptable$avgn"]="每人平均(一般)"
} else if(temptable$store[1]=="錢櫃"){
  temptable <- mutate(temptable, avg = (boxavg + 99)*1.1)
  a <- as.data.frame(temptable$store)
  colnames(a) <- "KTV"
  b <- as.data.frame(temptable$branch)
  colnames(b) <- "分店"
  c <- as.data.frame(temptable$whichbox)
  colnames(c) <- "建議包廂類型"
  d <- as.data.frame(temptable$avg)
  colnames(d) <- "每人平均"
  f <- as.data.frame(temptable$phone)
  colnames(f) <- "電話"
  g <- as.data.frame(temptable$address)
  colnames(g) <- "地址"
  finaltableb <- cbind(a,b,c,d,f,g)
} else {
  temptable <- mutate(temptable, avg = boxavg + 99)
  a <- as.data.frame(temptable$store)
  colnames(a) <- "KTV"
  b <- as.data.frame(temptable$branch)
  colnames(b) <- "分店"
  c <- as.data.frame(temptable$whichbox)
  colnames(c) <- "建議包廂類型"
  d <- as.data.frame(temptable$avg)
  colnames(d) <- "每人平均"
  f <- as.data.frame(temptable$phone)
  colnames(f) <- "電話"
  g <- as.data.frame(temptable$address)
  colnames(g) <- "地址"
  finaltablec <- cbind(a,b,c,d,f,g)
}