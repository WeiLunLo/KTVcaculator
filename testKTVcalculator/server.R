library(shiny)
source("global.R")

shinyServer(
  function(input, output) {
    
    output$text5 <- renderTable({
      #select price table by weekday
      if (input$weekday == 7){
        data <- boxSun
      } else if (input$weekday == 5){
        data <- boxFri
      } else if (input$weekday == 6){
        data <- boxSat
      } else {
        data <- boxMTWT
      }
      #select boxsize by numbers of people
      if (input$range == 1 | input$range == 2|input$range == 3){
        boxprice = data[,2]
        boxn <- colnames(data[2])
      } else if (input$range == 4 |input$range ==5 | input$range ==6){
        boxprice = data[,3]
        boxn <- colnames(data[3])
      } else if (input$range == 7 |input$range ==8 | input$range ==9){
        boxprice = data[,4]
        boxn <- colnames(data[4])
      } else if (input$range == 10 |input$range ==11 | input$range ==12){
        boxprice = data[,5]
        boxn <- colnames(data[5])
      } else if (input$range == 13 |input$range ==14 | input$range ==15){
        boxprice = data[,6]
        boxn <- colnames(data[6])
      } else if (input$range == 16 |input$range ==17 | input$range ==18){
        boxprice = data[,8]
        boxn <- colnames(data[8])
      } else {
        boxprice = data[,9]
        boxn <- colnames(data[9])
      }
      branchname <- as.data.frame(boxMTWT[,1])
      boxprice <- as.data.frame(boxprice)
      boxprice = cbind(boxprice, branchname)
      colnames(boxprice)[2] <- "branch"
      
      start <- as.numeric(input$start)
      start <- start + 10
      end   <- as.numeric(input$end)
      end   <- end + 10
    
      #for (i in 1:ncol(boxprice))
      #{
      #  boxprice = boxprice[ !is.na(boxprice[,i]),] 
      #  colnames(boxprice)[2] <- "branch"
      #}
        
      if (start < end){
        timeprice = data[,start:end]
        timeprice$trsum <- rowSums(timeprice)
        timeprice = cbind(boxprice,timeprice,data[,34:36])
        for (j in 1:ncol(timeprice)) {
          timeprice = timeprice [ !is.na(timeprice[,j]),]
        }
      } else if (start > end){
        temps = data[,start:33]
        tempe = data[,10:end]
        timeprice = cbind(temps,tempe)
        timeprice$trsum <- rowSums(timeprice)
        timeprice = cbind(boxprice,timeprice,data[,34:36])
        for (j in 1:ncol(timeprice)){
          timeprice = timeprice [ !is.na(timeprice[,j]),]
        }
      } else {
        timeprice = data[,10:33]
        timeprice$trsum <- rowSums(timeprice)
        timeprice = as.data.frame(timeprice)%>%
          cbind(boxprice,.)
        timeprice = cbind(timeprice,data[,34:36])
        timeprice = na.omit(timeprice)
      }
      #calculation
      
      discount <- 1
      
      temptable <- mutate(timeprice, boxtotal = boxprice*trsum) 
      temptable <- mutate(temptable, boxavg = (boxtotal/input$range)*discount)
      temptable$whichbox <- boxn
      
      
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
        finaltable <- cbind(a,b,c,d,e,f,g)%>%
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
        finaltable <- cbind(a,b,c,d)
      } else {
        finaltable = temptable
      }
      
      finaltable
      
    })
    
    
  }
)