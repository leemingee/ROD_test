# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # # generate bins based on input$bins from ui.R
    # x    <- faithful[, 2] 
    # bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # 
    # # draw the histogram with the specified number of bins
    # hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
    data <- simulate(N = input$N,
                     k = as.numeric(input$k),
                     x.center.max = input$x.center.max,
                     x.center.min = input$x.center.min,
                     y.center.max = input$y.center.max,
                     y.center.min = input$y.center.min)
    data
  })
  
  
  output$multi_linear_plot <- renderPlot({
    
    simulate_linear(
      N = input$N,
      k = as.numeric(input$k),
      x.center.max = input$x.center.max,
      x.center.min = input$x.center.min,
      y.center.max = input$y.center.max,
      y.center.min = input$y.center.min,
      slope = input$slope,
      interval.ratio = input$interval.ratio
    )
    
  })
})
