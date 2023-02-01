# dist plots

make_dist_plot <- function(data, input) {
  # save options for easy access
  .plot_type <- input$plot_type
  .group <- input$group
  .bins <- input$bins
  .time <- input$time
  
  # settings for all
  plot_settings <- list(
    theme_classic(),
    labs(
      subtitle = 'test subtitle',
      caption = 'test caption'
    )
  )
  
  # list options
  plot_list <- list(
    # histogram
    'hist' = list(
      geom_histogram(
        # if fill is null, defaults to ggplot grey, which is fine
        aes(fill = if(.group != 'None') {.data[[.group]]}),
        bins = .bins
      ),
      labs(title = 'Chess ELO Rating Histogram Plot'),
      scale_fill_viridis_d()
    ),

    # density
    'dens' = list(
      geom_density(
        aes(color = if(.group != 'None') .data[[.group]],
            fill = if(.group != 'None') .data[[.group]]),
        alpha = 0.1
      ),
      labs(title = 'Chess ELO Rating Density Plot'),
      scale_fill_viridis_d()
    ),

    # frequency
    'freq' = list(
      geom_freqpoly(
        aes(color = if(.group != 'None') .data[[.group]]),
        bins = .bins
      ),
      labs(title = 'Chess ELO Rating Frequency Plot'),
      scale_fill_viridis_d()
    )
  )
  
  plt <- 
    ggplot(
      data = data,
      aes(x = .data[[.time]])
    ) + list(
      plot_settings,
      plot_list[.plot_type]
    )
  
  return(plt)
}
