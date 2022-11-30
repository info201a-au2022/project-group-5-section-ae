# Final Project shiny application 

#Load libraries
library("shiny")

# Use source() to excute the "app_ui.R" and "app_server.R" files. These will
# define the UI value and server function respectively.
source("app_ui.R")
source("app_server.R")

# Create a new "shinyApp()" using the loaded "ui" and "server" variables
shinyApp(ui = ui, server = server)