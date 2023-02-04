# source script to create options
source('frontend/options.R')
# blurb <- readLines('frontend/blurb.txt')

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  #title
  titlePanel('Chess Elo Ratings'),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    
    # settings bar
    custom_sidebar(),
    
    # render plots
    mainPanel(
      plotOutput("distribution_plot"),
      
      br(),
      
      div(
        DT::dataTableOutput(outputId = "top_ten_tbl"),
        style = 'font-size: 70%; width: 70%'
      )
    )
  )
)