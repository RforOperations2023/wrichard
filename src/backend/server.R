# load functions for plots and data
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
  output$distribution_plot <- renderPlot({
    # from plots.R
    make_dist_plot(
      data = data$ratings_subset(),
      input = input
    )
  })
  
  # make top ten table
  output$top_ten_tbl <- DT::renderDataTable(
    if(input$show_tbl){
      get_top_ten(data$ratings_subset(), input)
    }
  )
  
}