library(shiny)
require(dplyr)
source("global.R")

shinyServer(
  function(input, output) {
    
    output$text5 <- renderTable({
      if (input$weekday == 7){
        data <- boxSun
      } else if (input$weekday == 5){
        data <- boxFri
      } else if (input$weekday == 6){
        data <- boxSat
      } else {
        data <- boxMTWT
      }
      
      if (input$range == 1 | input$range == 2|input$range == 3){
        boxprice = data[,2]
      } else if (input$range == 4 |input$range ==5 | input$range ==6){
        boxprice = data[,3]
      } else if (input$range == 7 |input$range ==8 | input$range ==9){
        boxprice = data[,4]
      } else if (input$range == 10 |input$range ==11 | input$range ==12){
        boxprice = data[,5]
      } else if (input$range == 13 |input$range ==14 | input$range ==15){
        boxprice = data[,6]
      } else if (input$range == 16 |input$range ==17 | input$range ==18){
        boxprice = data[,8]
      } else {
        boxprice = data[,9]
      }
      
      
      boxprice = cbind(boxprice, boxMTWT[,1],boxMTWT[,34:36])
      
      start <- as.numeric(input$start)
      start <- start + 10
      end   <- as.numeric(input$end)
      end   <- end + 10
    
      for (i in 1:ncol(boxprice))
      {
        boxprice = boxprice[ !is.na(boxprice[,i]),] 
        colnames(boxprice)[2] <- "branch"
      }
      
      if (start < end){
        timeprice = data[,start:end]
        timeprice = cbind(data[,1],timeprice,data[,34:36])
        for (j in 1:ncol(timeprice)) {
          timeprice = timeprice [ !is.na(timeprice[,j]),]
        }
      } else if (start > end){
        temps = data[,start:33]
        tempe = data[,10:end]
        timeprice = cbind(temps,tempe)
        timeprice = cbind(data[,1],timeprice,data[,34:36])
        for (j in 1:ncol(timeprice)){
          timeprice = timeprice [ !is.na(timeprice[,j]),]
        }
      } else {
        timeprice = data[,start]
        timeprice = cbind(data[,1],timeprice,data[,34:36])
        timeprice = na.omit(timeprice)
          }
        
      colnames(timeprice)[1] <- "branch"
      a <- inner_join(boxprice, timeprice, by = "branch")
      a <- a[,-3:-5]
      a
      
      
    })
    
    
  }
)