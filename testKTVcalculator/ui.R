
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
source("global.R")

shinyUI(fluidPage(
  titlePanel("KTV計算機-測試版"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("請輸入唱歌資訊："),
      
      selectInput("weekday", 
                  label = "禮拜幾？",
                  choices = c("禮拜一"=1, "禮拜二"=2,"禮拜三"=3, "禮拜四"=4, "禮拜五"=5, "禮拜六"=6, "禮拜天"=7),
                  selected = 7),
      
      sliderInput("range", 
                  label = "人數？",
                  min = 1, max = 20, value = 1),
      
      helpText("若人數超過20人請選20人，並建議聯絡客服人員詢問詳細收費方式"),

      selectInput("start", 
                   label = "從", 
                   choices = c(0:23),
                  selected = 0),
      
      selectInput("end", 
                   label = "到", 
                   choices = c(0:23),
                   selected = 0),

  
      radioButtons("discount", label = h3("我有"),
                   choices = list("學生證", "威力卡"),
                   selected = 1)
    ),
    
      actionButton("action", "Go")
  ),

    mainPanel(
      textOutput("text1"),
      textOutput("text2"),
      textOutput("text3"),
      textOutput("text4"),
      tableOutput("text5")
    )
  
  ))