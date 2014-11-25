library(shiny)
library(ggplot2)

dataset <- diamonds

shinyUI(fluidPage(
  titlePanel("Diamond Pricer"),
  "An app giving you the expected price of a diamond.",
  br(),br(),
  
  sidebarLayout(
    sidebarPanel(
      
      checkboxGroupInput("variable", "What do you know about the diamond? Select at least one:",
                         c("Carat" = "carat",
                           "Cut" = "cut",
                           "Color" = "color"#,
                           #"Clarity" = "clarity",
                           #"Total depth percentage" = "depth",
                           #"Table" = "table",
                           #"Length in mm" = "x",
                           #"Width in mm" = "y",
                           #"Depth in mm" = "z"
                           ),
                         selected = "Carat"),
      
      conditionalPanel(
        condition = "input.variable.indexOf('carat') > -1",
        sliderInput("carat",
                    "Carat:",
                    min = 0,
                    max = 6,
                    value = 3)
        ),
      
      conditionalPanel(
        condition = "input.variable.indexOf('cut') > -1",
        selectInput("cut",
                    "Cut:",
                    c("Fair" = "Fair",
                      "Good" = "Good",
                      "Very Good" = "Very Good",
                      "Premium" = "Premium",
                      "Ideal" = "Ideal"))
      ),
      
      conditionalPanel(
        condition = "input.variable.indexOf('color') > -1",
        selectInput("color",
                    "Color (from D, best color to J, worst color):",
                    c("D" = "D",
                      "E" = "E",
                      "F" = "F",
                      "G" = "G",
                      "H" = "H",
                      "I" = "I",
                      "J" = "J"))
      )
      
    ),
    
    mainPanel(
      uiOutput("fit"),
      
      )
    
    )
  
  ))