library(shiny)
library(ggplot2)
dataset <- diamonds

shinyServer(function(input, output) {
  observe({

    f <- formula(paste("price", "~",paste(input$variable, collapse = " + ")))
    model = lm(f, data = dataset)
    
    n <- data.frame(carat = NA, 
                    cut = NA, 
                    color = NA)
    
    if('carat' %in% input$variable){n$carat <- input$carat}
    if('cut' %in% input$variable){n$cut <- input$cut}
    if('color' %in% input$variable){n$color <- input$color}
    
    p <- predict(model, newdata=n, interval="predict")
    
    output$fit <- renderUI(HTML(
      paste("Your diamond is expected to sell for <strong>$",round(p[1]), 
            "</strong> and has a 95% chance of selling between $", round(p[2]), "and $", round(p[3]), 
            collapse = "")
      )
    )
    
  })
  

})