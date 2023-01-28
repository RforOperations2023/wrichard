library(shiny)

# below is default ui!
# todo(bristow) update all
# Define UI for application that draws a histogram
ui <- fluidPage(
  
  #title
  titlePanel('Chess Ratings'),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = 'bins',
        label = 'Number of bins:',
        min = 1,
        max = 50,
        value = 30
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
        ),
        selected = 'Standard'
      )
      
      
    ),
    

    
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)