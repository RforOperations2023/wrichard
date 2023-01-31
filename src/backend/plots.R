library(ggplot2)

# distribution plots
dist_plots <- function() {
  renderPlot({
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
}