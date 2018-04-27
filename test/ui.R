#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Heterogeneity Bias Showcase"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput(inputId = "N",
                   label = "Total Sample Size",
                   min = 40,
                   max = 40000,
                   value = 400),
       selectInput(inputId = "k",
                   label = "Cluster Size",
                   choices = c(2, 3, 4, 5, 6, 7, 8),
                   selected = 4),
       sliderInput(inputId = "y.center.min",
                   label = "The minimum for y centers",
                   min = -15,
                   max = 0,
                   value = -15),
       sliderInput(inputId = "y.center.max",
                   label = "The maximum for x centers",
                   min = 5,
                   max = 15,
                   value = 15),
       
       sliderInput(inputId = "x.center.min",
                   label = "The minimum for x centers",
                   min = -10,
                   max = 0,
                   value = -10),
       sliderInput(inputId = "x.center.max",
                   label = "The maximum for x centers",
                   min = 5,
                   max = 15,
                   value = 5)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
