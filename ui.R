library(shiny)
library(ggplot2)

dataset <- diamonds

shinyUI(fluidPage(
  titlePanel("Diamond Pricer"),
  "An app giving you the expected price of a diamond.",
  "",
  
  sidebarLayout(
    sidebarPanel(
      
      checkboxGroupInput("variable", "What do you know about the diamond? Select at least one.",
                         c("Carat" = "carat",
                           "Cut" = "cut",
                           "Color" = "color",
                           "Clarity" = "clarity",
                           "Total depth percentage" = "depth",
                           "Table" = "table",
                           "Length in mm" = "x",
                           "Width in mm" = "y",
                           "Depth in mm" = "z")),
      
      sliderInput("carat",
                  "Carat:",
                  min = 0,
                  max = 6,
                  value = 3)
      ),
    
    mainPanel(
      "Main panel"
      )
    
    )
  
  ))