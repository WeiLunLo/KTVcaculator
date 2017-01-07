library(shiny)
source("global.R")

shinyUI(
  navbarPage(theme = shinytheme("darkly"),
    "KTV",
    tabPanel("KTV Calculator",
  fluidPage(
            titlePanel("KTV計算機-測試版"),
  
    sidebarPanel(
      helpText("請輸入唱歌資訊："),
      
      selectInput("weekday", 
                  label = "唱歌的日子？",
                  choices = c("禮拜一"=1, "禮拜二"=2,"禮拜三"=3, "禮拜四"=4, "禮拜五"=5, "禮拜六"=6, "禮拜天"=7),
                  selected = 7),
      
      sliderInput("range", 
                  label = "人數？",
                  min = 1, max = 20, value = 7),
      
      helpText("若人數超過20人請選20人，並建議聯絡客服人員詢問詳細收費方式"),

      selectInput("start", 
                   label = "開始時間：", 
                   choices = c(0:23),
                  selected = 0),
      
      selectInput("end", 
                   label = "結束時間：", 
                   choices = c(0:23),
                   selected = 0),
      helpText("24小時制，若『開始時間大於等於結束時間』則跨過一天。例：0→0 = 今天半夜唱到明天半夜；
               23->2 = 今天晚上11點唱到明天凌晨2點"),
  
      checkboxGroupInput("discount", label = "等等！我有：(請至少選一項喔！)",
                   choices = list("一副好歌喉" = 1,"學生證" = 2, "威力卡" = 3, "晶鑽卡" = 4),
                   selected = 1)
  ),

    mainPanel(
      h2("超級比一比"),
      tableOutput("box"),
      div("*每人平均(元)：含餐飲最低基本消費與10%總金額之服務費。若要升級其他方案請上各KTV網站查詢詳情。",style = "color:grey"),
      p("*建議包廂類型對照表：(製作中)"),
      br(),
      h2("目前資料與計價方式：三家之包廂",style = "color:red"),
      img(src="https://weilunlo.github.io/KTVcaculator/testKTVcalculator/dog.jpg")
    )
  )),
  tabPanel("1"),
  tabPanel("2")
  ))