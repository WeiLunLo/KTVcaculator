library(shiny)
source("global.R")

shinyUI(
  navbarPage(theme = shinytheme("darkly"),
    "KTV",
    tabPanel("KTV Calculator",
  fluidPage(
            titlePanel("KTV Calculator"),
  
    sidebarPanel(
      h4("請輸入唱歌資訊：",style = "color:	#0072E3	"),
      
      selectInput("weekday", 
                  label = "唱歌的日子？",
                  choices = c("禮拜一"=1, "禮拜二"=2,"禮拜三"=3, "禮拜四"=4, "禮拜五"=5, "禮拜六"=6, "禮拜天"=7),
                  selected = 5),
      helpText("國定假日請選禮拜天。",style = "color:	#02F78E	"),
      
      sliderInput("range", 
                  label = "人數？",
                  min = 1, max = 20, value = 7),
      
      helpText("若人數超過20人請選20人，並建議聯絡客服人員詢問詳細收費方式",style = "color:	#02F78E	"),

      selectInput("start", 
                   label = "開始時間：", 
                   choices = c(0:23),
                  selected = 0),
      
      selectInput("end", 
                   label = "結束時間：", 
                   choices = c(0:23),
                   selected = 0),
      helpText("24小時制，若『開始時間大於等於結束時間』則跨過一天。例：0→0 = 今天半夜唱到明天半夜；
               23->2 = 今天晚上11點唱到明天凌晨2點",style = "color:	#02F78E	"),
  
      checkboxGroupInput("discount", label = "等等！我有：",
                   choices = list("一副好歌喉" = 1,"學生證" = 2, "好樂迪威力卡" = 3, "錢櫃PARTY卡" = 4),
                   selected = 1),
      helpText("↑↑↑ 請至少勾選一項喔！ ↑↑↑",style = "color:#FFB338	")
  ),

    mainPanel(
      tabsetPanel(
        tabPanel("BOX",
          h2("包廂式計費",style = "color:	#0072E3	"),
          div(tableOutput("box"), style = "background-color:#303030; border-radius:5px"),
          div("*每人平均(元)：含餐飲最低基本消費與10%總金額之服務費。若要升級其他方案請洽KTV查詢詳情。",style = "color:#00DDFF"),
          div("*建議包廂類型：請參考下對照表。",style = "color:#00DDFF"),
          br(),
          h4("建議包廂類型與人數對照表：",style = "color:	#0072E3	"),
          div(tableOutput("boxname"), style = "background-color:#303030; border-radius:5px")
        ),
        tabPanel("HEAD",
          h2("人頭式計費",style = "color:	#0072E3	"),
          div(tableOutput("head"), style = "background-color:#303030; border-radius:5px"),
          div("*每人價格：",span("『為該方案之每人價格』",style = "color:	#FF5D38	"),"，含餐飲最低基本消費與10%總金額之服務費。",style = "color:#00DDFF"),
          div("*續唱價格(每小時)：每小時的續唱價格，若欲續唱需另加10%服務費。(1)若該欄位為「0」則可歡唱至打烊，且該列之歡唱時數為入場時段開始至打烊時間。
              (2)若該欄位為「X」，則不開放續唱。詳細方案與規則請洽各KTV。",style = "color:#00DDFF")
         )
      )
  ))
  ),
  tabPanel("KTV Info",
           fluidPage(
             titlePanel("KTV Info"),
             
             sidebarPanel(
               selectInput("KTV", 
                           label = "KTV店家",
                           choices = c("全部"=1, "好樂迪"=2,"錢櫃"=3, "星聚點"=4),
                           selected = 1)
           # img(src = "https://weilunlo.github.io/KTVcaculator/testKTVcalculator/dog.png",align = "center" ,style = "border-radius:100px" )
             ),
             mainPanel(
               h2("店家基本資訊",style = "color:	#0072E3	"),
               h3("詳細地圖與資訊可參考",
                      a("本網站的地圖頁", href = "https://evanyo25.github.io/dPD_ktv/map.html")),
               div(tableOutput("info"), style = "background-color:#303030; border-radius:5px")
               )
           )
           )
  ))