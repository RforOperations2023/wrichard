# all below is the default server from shiny apps
# todo(bristow) update all!
library(ggplot2)
source('backend/plots.R')

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # save data
  ratings <- readRDS('data/ratings.Rds')
  
  # data reactive
  ratings_subset <- reactive({
    req(input$Byear_range) # make sure selected
    ratings |> 
      filter(
        Byear >= input$Byear_range[[1]],
        Byear <= input$Byear_range[[2]]
      ) %>%
      return()
  })
  
  # make plot
  output$distPlot <- renderPlot({
    make_dist_plot(
      data = ratings_subset(),
      input = input
    )
  })
  
}