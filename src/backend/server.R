# all below is the default server from shiny apps
# todo(bristow) update all!

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # save data
  ratings <- readRDS('data/ratings.Rds')
  
  # data reactive
  # ratings_subset <- reactive({
  #   req(input$time) # make sure selected
  #   select(ratings, )
  # })
  
  # make plot
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    ggplot(
      data = ratings, 
      aes(x = .data[[input$time]])
    ) +
      geom_histogram(
        aes(group = factor(Bdecade), fill = factor(Bdecade)),
        bins = input$bins
      ) +
      xlab('ELO Score') +
      ggtitle('test lab')
  })
}