#app_server

library("shiny")
library("dplyr")
library("tidyverse")
library("ggplot2")
library("plotly")
library("rsconnect")

# loading dataset
sleepdata <- read.csv("./data/sleepdata.csv", sep = ";", quote = "")
sleepdata_2 <- read.csv("./data/sleepdata_2.csv", sep = ";", quote = "")
sayopillow <- read.csv("./data/SaYoPillow.csv")

#Data Analysis



# Define server logic
server <- function(input, output){
  
  plot <- function(sl){
    data_for_plot <- sayopillow %>%
      filter(sl %in% input$sl) 
    return(data_for_plot)
  }
  output$chart <- renderPlotly({
    ggplotly(ggplot(plot(input$sl),aes(x= `sr`, y= `sr.1`)) +
               geom_line(color = "red") +
               labs(title = "How Stress Level Affects Your Sleep", x = "Snoring Rate", y = "Sleeping Time"))
  })
}
