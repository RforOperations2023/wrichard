
# source backend
source('backend/server.R')

# source frontend
source('frontend/ui.R')

# Run the application 
shinyApp(ui = ui, server = server)
