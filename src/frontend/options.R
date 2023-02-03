custom_sidebar <- function() {
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
    
    # select grouping
    radioButtons(
      inputId = 'group',
      label = 'Select grouping',
      choices = c(
        'Birth decade' = 'Bdecade',
        'Sex' = 'Sex',
        'Federation' = 'Fed',
        'None' = 'None'
      )
    ),
    
    # select country if country is selected
    conditionalPanel(
      condition = "input.group == 'Fed'",
      selectizeInput(
        inputId = 'fed_selected',
        label = 'Select Federations (max 5)',
        choices = readRDS('data/federations.Rds'),
        selected = c('USA', 'RUS', 'IND'),
        multiple = TRUE,
        options = list(maxItems = 5)
      )
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