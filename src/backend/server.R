# all below is the default server from shiny apps
# todo(bristow) update all!
library(ggplot2)

# source script to create plots
source('backend/plots.R')
# dist_plots(): function returning plot options

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
  output$distPlot <- dist_plots()
  
}