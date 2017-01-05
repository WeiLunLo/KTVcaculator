library(shiny)
source("global.R")

shinyUI(fluidPage(titlePanel("KTV計算機-測試版"),
  
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

  
      radioButtons("discount", label = "我有",
                   choices = list("學生證", "威力卡"),
                   selected = 1)
  ),

    mainPanel(
      tableOutput("text5"),
      div("*每人平均(一般)：含餐飲基本消費100元與10%總金額之服務費",style = "color:grey"),
      div("*每人平均(歡樂吧)：含歡樂吧158元與10%總金額之服務費",style = "color:grey"),
      br(),
      h2("目前資料與計價方式：僅好樂迪之包廂",style = "color:red"),
      img(src="https://weilunlo.github.io/KTVcaculator/testKTVcalculator/dog.jpg")
    )
  
  ))