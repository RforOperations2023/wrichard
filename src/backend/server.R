# all below is the default server from shiny apps
# todo(bristow) update all!
library(ggplot2)

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
    ggplot(
      data = ratings_subset(),
      aes(x = .data[[input$time]])
    ) +
    # histogram
    if (input$plot_type == 'hist') {
      geom_histogram(
        if (input$decade_aes) {
          aes(fill = Bdecade, group = Bdecade)
        } else {
          aes()
        },
        bins = input$bins
      )
    }
    # density
    else if (input$plot_type == 'dens') {
      geom_density(
        if (input$decade_aes) {
          aes(color = Bdecade, group = Bdecade)
        }
      )
    }
    # frequency
    else if (input$plot_type == 'freq') {
      geom_freqpoly(
        if (input$decade_aes) {
          aes(color = factor(Bdecade))
        },
        bins = input$bins
      )
    }
  })
  
  # debug text
  # output$text <- renderText({
  #   paste(input$Byear_range[1], input$Byear_range[2])
  # })
}