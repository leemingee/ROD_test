#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

ui<- navbarPage(
  
  ##link to css.file
  theme = "2.css", 
  
  "Toy Shiny App for Hetergeneity Bias Showcase",
  
  tabPanel("Heterogeneity Bias Showcase",
            titlePanel("Heterogeneity Bias Showcase"),
            # Sidebar with a slider input for number of bins 
            sidebarLayout(
              sidebarPanel(
                 sliderInput(inputId = "N",
                             label = "Total Sample Size",
                             min = 40,
                             max = 40000,
                             value = 1000),
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
                             min = -5,
                             max = 0,
                             value = -10),
                 sliderInput(inputId = "x.center.max",
                             label = "The maximum for x centers",
                             min = 10,
                             max = 15,
                             value = 5),
                 sliderInput(inputId = "slope",
                             label = "the slope in each group y ~ x",
                             min = -1,
                             max = 3,
                             value = 1),
                 sliderInput(inputId = "interval.ratio",
                             label = "The sd/interval ratio",
                             min = 0.1,
                             max = 0.3,
                             value = 0.2)
                 
              ),
    
              # Show a plot of the generated distribution
              mainPanel(
                 # plotOutput("distPlot")
                 plotOutput("multi_linear_plot")
              )
          )
  )
  
  # tabPanel(
  #   "Clustering Analysis",
  #   titlePanel("Clustering")
  #   
  # )
  
  
)
