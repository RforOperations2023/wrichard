library(shiny)
library(ggplot2)
library(dplyr)
library(rlang)
library(DT)
library(scales)

# source backend
source('backend/server.R')

# source frontend
source('frontend/ui.R')

# Run the application 
shinyApp(ui = ui, server = server)
