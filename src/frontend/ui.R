# below is default ui!
# todo(bristow) update all

# source script to create options
source('frontend/options.R')
# custom_sidebar(): function yielding sidebar options

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  #title
  titlePanel('Chess Ratings'),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    custom_sidebar(),
    
    # render plots
    mainPanel(
      plotOutput("distPlot")
    )
  )
)