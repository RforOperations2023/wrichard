# all below is the default server from shiny apps
# todo(bristow) update all!

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # save data
  output$ratings <- load('data/ratings.Rds')
  
  # make plot
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- output$ratings[[input$time]]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white',
         xlab = 'ELO score',
         main = 'test lab')
  })
}