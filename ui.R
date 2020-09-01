ui <- dashboardPage(
  dashboardHeader(title = "股票網站輿情分析"),
  dashboardSidebar(sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"))
  )),
  dashboardBody(
    fluidRow(
      # A static valueBox
      valueBox(865471, "總文章數", icon = icon("list"),width=2),
      
      # Dynamic valueBoxes
      valueBoxOutput("monthBox",width=2),
      
      valueBoxOutput("newsBox",width=2),
      valueBoxOutput("platformBox",width=2),
      valueBoxOutput("blogBox",width=2)
    ),
    # Boxes need to be put in a row (or column)
    fluidRow(
      box(tags$b("股票聲量文字雲"),
          wordcloud2Output("wordcloud2",height = 340),
          tags$b("熱詞文字雲"),
          wordcloud2Output("wc2",height = 340)),
      
      box(
        selectInput("y", 
                    label = "年份",
                    choices = c("2010", "2011",'2012','2013','2014','2015','2016','2017','2018',
                                "2019", "2020"), 
                    selected = "2020"),
        selectInput("m", 
                    label = "月份",
                    choices = c("1", "2",'3','4','5','6','7','8','9','10',"11", "12"), 
                    selected = "7")
      ),
      box(tags$b("十大熱門股票聲量"),
          plotlyOutput("bar"))
    )
  )
)