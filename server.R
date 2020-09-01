wordcloud2a <- function (data, size = 1, minSize = 0, gridSize = 0, fontFamily = "Segoe UI", 
                         fontWeight = "bold", color = "random-dark", backgroundColor = "white", 
                         minRotation = -pi/4, maxRotation = pi/4, shuffle = TRUE, 
                         rotateRatio = 0.4, shape = "circle", ellipticity = 0.65, 
                         widgetsize = NULL, figPath = NULL, hoverFunction = NULL) 
{
  if ("table" %in% class(data)) {
    dataOut = data.frame(name = names(data), freq = as.vector(data))
  }
  else {
    data = as.data.frame(data)
    dataOut = data[, 1:2]
    names(dataOut) = c("name", "freq")
  }
  if (!is.null(figPath)) {
    if (!file.exists(figPath)) {
      stop("cannot find fig in the figPath")
    }
    spPath = strsplit(figPath, "\\.")[[1]]
    len = length(spPath)
    figClass = spPath[len]
    if (!figClass %in% c("jpeg", "jpg", "png", "bmp", "gif")) {
      stop("file should be a jpeg, jpg, png, bmp or gif file!")
    }
    base64 = base64enc::base64encode(figPath)
    base64 = paste0("data:image/", figClass, ";base64,", 
                    base64)
  }
  else {
    base64 = NULL
  }
  weightFactor = size * 180/max(dataOut$freq)
  settings <- list(word = dataOut$name, freq = dataOut$freq, 
                   fontFamily = fontFamily, fontWeight = fontWeight, color = color, 
                   minSize = minSize, weightFactor = weightFactor, backgroundColor = backgroundColor, 
                   gridSize = gridSize, minRotation = minRotation, maxRotation = maxRotation, 
                   shuffle = shuffle, rotateRatio = rotateRatio, shape = shape, 
                   ellipticity = ellipticity, figBase64 = base64, hover = htmlwidgets::JS(hoverFunction))
  chart = htmlwidgets::createWidget("wordcloud2", settings, 
                                    width = widgetsize[1], height = widgetsize[2], sizingPolicy = htmlwidgets::sizingPolicy(viewer.padding = 0, 
                                                                                                                            browser.padding = 0, browser.fill = TRUE))
  chart
}

server <- function(input, output, session) {
  output$monthBox <- renderValueBox({
    num <- sum(df[df$year==as.numeric(input$y)&df$month==as.numeric(input$m),4])
    valueBox(
      as.character(num), "本月文章數", icon = icon("list"),
      color = "purple"
    )
  })
  
  output$newsBox <- renderValueBox({
    total <- sum(df[df$year==as.numeric(input$y)&df$month==as.numeric(input$m),4])
    num <- df[df$year==as.numeric(input$y)&df$month==as.numeric(input$m)&df$Website=='news',4]
    valueBox(
      paste0(round(num/total,3)*100,'%'), "新聞佔比", icon = icon("list"),
      color = "yellow"
    )
  })
  
  output$platformBox <- renderValueBox({
    total <- sum(df[df$year==as.numeric(input$y)&df$month==as.numeric(input$m),4])
    num <- df[df$year==as.numeric(input$y)&df$month==as.numeric(input$m)&df$Website=='platform',4]
    valueBox(
      paste0(round(num/total,3)*100,'%'), "論壇佔比", icon = icon("list"),
      color = "green"
    )
  })
  
  output$blogBox <- renderValueBox({
    total <- sum(df[df$year==as.numeric(input$y)&df$month==as.numeric(input$m),4])
    num <- df[df$year==as.numeric(input$y)&df$month==as.numeric(input$m)&df$Website=='blog',4]
    valueBox(
      paste0(round(num/total,3)*100,'%'), "部落格佔比", icon = icon("list"),
      color = "red"
    )
  })
  output$wordcloud2 <- renderWordcloud2({
    res <- stock[stock$Time==as.numeric(paste0(input$y,input$m)),1:2]
    wordcloud2a(res,color = "random-light")
  })
  output$wc2 <- renderWordcloud2({
    res2 <- words[words$Time==as.numeric(paste0(input$y,input$m)),1:2]
    wordcloud2a(res2,color = "random-light", backgroundColor = "grey")
  })
  output$bar <- renderPlotly({
    res3 <- stock[stock$Time==as.numeric(paste0(input$y,input$m)),1:2]
    df <- res3[order(res3$Counts,decreasing = T),]
    df <- df[1:10,]
    df$Name <- factor(df$Name, levels = df[["Name"]])
    plot_ly(df, y = ~Counts, x=~Name ,type = 'bar') %>%
      layout(
        xaxis = list(title='',tickfont = list(size = 15)), 
        yaxis = list(title='',tickfont = list(size = 15)))
  })
}