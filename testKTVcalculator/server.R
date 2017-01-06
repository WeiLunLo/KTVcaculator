library(shiny)
source("global.R")

shinyServer(
  function(input, output) {
    
    output$box <- renderTable({
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
    
      temptable <- mutate(timeprice, boxtotal = boxprice*trsum) 
      temptable <- mutate(temptable, boxavg = boxtotal/input$range)
      temptable$whichbox <- boxn
      ktv <- as.data.frame(temptable$store)
        colnames(ktv) <- "KTV"
      branch <- as.data.frame(temptable$branch)
        colnames(branch) <- "分店"
      whichb <- as.data.frame(temptable$whichbox)
        colnames(whichb) <- "建議包廂類型"
      boxa <- as.data.frame(temptable$boxavg)
        colnames(boxa) <- "boxavg"
      phone <- as.data.frame(temptable$phone)
        colnames(phone) <- "電話"
      address <- as.data.frame(temptable$address)
        colnames(address) <- "地址"
      temptable2 <- cbind(ktv, branch,whichb,boxa,phone, address)%>%
        mutate(.,avgn = boxavg/input$range)
      
      
      #discount
      dd <- paste(input$discount,sep="",collapse="")
      if (grepl(3,dd)==T & grepl(4,dd)==F){
        discounthld = 0.9
        discountcg = 1
      } else if (grepl(3,dd)==F & grepl(4,dd)==T){
        discounthld = 1
        discountcg = 0.95
      } else if(grepl(3,dd)==T & grepl(4,dd)==T){
        discounthld = 0.9
        discountcg = 0.95
      } else{
        discounthld = 1
        discountcg = 1
      }
      
        
      for(i in 1:length(temptable2$boxavg)){
        if (temptable2$KTV[i] == "好樂迪"){
          temptable2$avgn[i] = (temptable2$avgn[i]*discounthld + 100)*1.1
        } else if (temptable2$KTV[i] == "錢櫃"){
          temptable2$avgn[i] = (temptable2$avgn[i]*discountcg + 99)*1.1
        } else {
          if (input$weekday == 1 | 2 | 3 | 4 ){
            dc <- 0.8
          } else{
            dc <- 1
          }
          temptable2$avgn[i] = (temptable2$avgn[i]*dc + 99)*1.1
        }
      }
      a <- temptable2[,1:3]
      b <- as.data.frame(temptable2[,7])
      colnames(b) <- "每人平均"
      c <- temptable2[,5:6]
      finaltable <- cbind(a,b,c) %>%
        arrange(., 每人平均)
      #colnames(finaltable[4]) <- "每人平均(元)"
      finaltable
      
    })
      
  }
)