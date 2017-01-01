
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
source("global.R")

shinyServer(
  function(input, output) {
    
    output$text5 <- renderText({
      if (input$weekday == 7){
        data <- boxSun
      }  else if (input$weekday == 5){
        data <- boxFri
      } else if (input$weekday == 6){
        data <- boxSat
      } else {
        data <- boxMTWT
      }
      data[1,21]
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