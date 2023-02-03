# all below is the default server from shiny apps
# todo(bristow) update all!
source('backend/plots.R')
source('backend/data_handling.R')

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # create data object
  data = list()
  
  # add ratings base dataframe
  data$ratings <- readRDS('data/ratings.Rds')
  
  # reactive subset data
  data$ratings_subset <- reactive(
    # from data_handling.R
    make_data_subset(
      data = data$ratings,
      input = input
    )
  )
  
  # make plot
  output$distPlot <- renderPlot({
    # from plots.R
    make_dist_plot(
      data = data$ratings_subset(),
      input = input
    )
  })
  
}