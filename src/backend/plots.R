# this 
pretty_labels <- list(
  'Bdecade' = 'Birth decade',
  'Sex' = 'Sex',
  'Fed' = 'Federation',
  'None' = NULL,
  'SRtng' = 'Standard Time Control Elo Score',
  'RRtng' = 'Rapid Time Control Elo Score',
  'BRtng' = 'Bullet Time Control Elo Score'
)

make_dist_plot <- function(data, input) {
  # save options for easy access
  .time = input$time
  .plot_type <- input$plot_type
  .group <- input$group
  .bins <- input$bins
  .time <- input$time
  
  # save string of number of players
  player_count_string <- 
    scales::comma_format()(
      nrow(data)
    )
  
  # settings for all
  plot_settings <- list(
    theme_classic(),
    labs(
      subtitle = paste(
        'This plot shows data on',
        player_count_string,
        'players'
        ),
      caption = 'Data: FIDE, January 2023\nViz: @bristowrichards'
    ),
    xlab(pretty_labels[.time]),
    theme(plot.title = element_text(size=18))
  )
  
  # list options
  plot_list <- list(
    # histogram
    'hist' = list(
      geom_histogram(
        # if fill is null, defaults to ggplot grey, which is fine
        aes(fill = if(.group != 'None') {.data[[.group]]}),
        bins = .bins,
        color = 'black'
      ),
      labs(
        title = 'Chess ELO Rating Histogram Plot',
        fill = pretty_labels[.group]
      ),
      scale_fill_viridis_d(),
      ylab('Frequency')
    ),

    # density
    'dens' = list(
      geom_density(
        aes(color = if(.group != 'None') .data[[.group]]),
        linewidth = 1
      ),
      labs(
        title = 'Chess ELO Rating Density Plot',
        color = pretty_labels[.group]
      ),
      scale_color_viridis_d(end = 0.9),
      ylab('Density'),
      ggtitle('hello')
    ),

    # frequency
    'freq' = list(
      geom_freqpoly(
        aes(color = if(.group != 'None') .data[[.group]]),
        bins = .bins,
        linewidth = 1
      ),
      labs(
        title = 'Chess ELO Rating Frequency Plot',
        color = pretty_labels[.group]
      ),
      scale_color_viridis_d(end = 0.9),
      ylab('Frequency')
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
