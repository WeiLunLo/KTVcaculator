
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(dplyr)
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
      
      start <- as.numeric(input$start)
      start <- start + 10
      end   <- as.numeric(input$end)
      end   <- end + 10

      
      if (start <= end){
        timeprice = data[,start:end]
      } else{
        temps = data[,start:33]
        tempe = data[,10:end]
        timeprice = cbind(temps,tempe)
      }
      
     # for (i in 1 : length(boxprice))
      timeprice
      
    })
    
    
    output$text1 <- renderText({ 
      paste("你選擇禮拜", input$weekday,"去唱歌~")
    })
    output$text2 <- renderText({
      a <- input$range - 1
      paste("你要跟", a,"個小夥伴去唱歌~")
    })
    output$text3 <- renderText({
      paste("你要在", input$start,"點到",input$end,"點去唱歌~")
    })
    output$text4 <- renderText({
      a <-paste("你有",input$discount,"耶！")
      paste(a,"阿不就好棒棒？")
    })
  }
)