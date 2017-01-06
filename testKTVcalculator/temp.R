discount <- 1
#if(input$discount=="威力卡"){
#  discount <- 0.9
#}
#else {
#  discount <- 1
#}

colnames(timeprice)[1] <- "branch"
#inner_join is not available
#temptable <- inner_join(boxprice, timeprice, by = "branch")

temptable <- temptable[,-3:-5] %>%
  mutate(., boxtotal = boxprice*trsum) %>%
  mutate(., boxavg = (boxtotal/input$range)*discount)
temptable$whichbox <- boxn


if (temptable$store.y[1]=="好樂迪"){
  temptable <- mutate(temptable, avgn = (boxavg + 100)*1.1 ) %>%
    mutate(., avgfb = (boxavg +158)*1.1 )
  a <- as.data.frame(temptable$store.y)
  colnames(a) <- "KTV"
  b <- as.data.frame(temptable$branch)
  colnames(b) <- "分店"
  c <- as.data.frame(temptable$whichbox)
  colnames(c) <- "建議包廂類型"
  d <- as.data.frame(temptable$avgn)
  
  e <- as.data.frame(temptable$avgfb)
  colnames(e) <- "每人平均(歡樂吧)"
  finaltable <- cbind(a,b,c,d,e)%>%
    arrange(., temptable$avgn)
  names(finaltable)[names(finaltable)=="temptable$avgn"]="每人平均(一般)"
} else {
  temptable <- mutate(temptable, avg = (boxavg + 99)*1.1)
  a <- as.data.frame(temptable$store.y)
  colnames(a) <- "KTV"
  b <- as.data.frame(temptable$branch)
  colnames(b) <- "分店"
  c <- as.data.frame(temptable$whichbox)
  colnames(c) <- "建議包廂類型"
  d <- as.data.frame(temptable$avg)
  colnames(d) <- "每人平均"
  finaltable <- cbind(a,b,c,d)
}

#finaltable

temptable <- mutate(timeprice, boxtotal = boxprice*trsum) %>%
  mutate(., boxavg = (boxtotal/input$range)*discount)
temptable$whichbox <- boxn


if (temptable$store.y[1]=="好樂迪"){
  temptable <- mutate(temptable, avgn = (boxavg + 100)*1.1 ) %>%
    mutate(., avgfb = (boxavg +158)*1.1 )
  a <- as.data.frame(temptable$store.y)
  colnames(a) <- "KTV"
  b <- as.data.frame(temptable$branch)
  colnames(b) <- "分店"
  c <- as.data.frame(temptable$whichbox)
  colnames(c) <- "建議包廂類型"
  d <- as.data.frame(temptable$avgn)
  
  e <- as.data.frame(temptable$avgfb)
  colnames(e) <- "每人平均(歡樂吧)"
  finaltable <- cbind(a,b,c,d,e)%>%
    arrange(., temptable$avgn)
  names(finaltable)[names(finaltable)=="temptable$avgn"]="每人平均(一般)"
} else {
  temptable <- mutate(temptable, avg = (boxavg + 99)*1.1)
  a <- as.data.frame(temptable$store.y)
  colnames(a) <- "KTV"
  b <- as.data.frame(temptable$branch)
  colnames(b) <- "分店"
  c <- as.data.frame(temptable$whichbox)
  colnames(c) <- "建議包廂類型"
  d <- as.data.frame(temptable$avg)
  colnames(d) <- "每人平均"
  finaltable <- cbind(a,b,c,d)
}