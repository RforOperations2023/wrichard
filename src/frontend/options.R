custom_sidebar = function() {
  # I wanted these options to exist separately from the ui script
  
  sidebarPanel(
    
    # number of bins
    sliderInput(
      inputId = 'bins',
      label = 'Number of bins:',
      min = 5,
      max = 50,
      value = 30
    ),
    
    # birth year range
    sliderInput(
      inputId = 'Byear_range',
      label = 'Birth year:',
      min = 1910,
      max = 2020,
      value = c(1930, 2020),
      sep = ''
    ),
    
    # symbolize by decade
    checkboxInput(
      inputId = 'decade_aes',
      label = 'Group by birth decade',
      value = TRUE
    ),
    
    # graph type
    radioButtons(
      inputId = 'plot_type',
      label = 'Select graph type',
      choices = c(
        'Histogram' = 'hist',
        'Density Curve' = 'dens',
        'Frequency Curve' = 'freq'
      )
    ),
    
    # put here preference for type of ratings
    # make it input
    radioButtons(
      inputId = 'time',
      label = 'Time control:',
      choices = c(
        'Standard' = 'SRtng',
        'Rapid' = 'RRtng',
        'Bullet' = 'BRtng'
      )
    )
  )
}