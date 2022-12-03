#app_server

library("shiny")
library("dplyr")
library("tidyverse")
library("ggplot2")
library("plotly")
library("rsconnect")
library("stringr")

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
    
    #render plotly
    output$sleepScatter <- renderPlotly({
      #wrangle the data for the bar graph using DPLYR
      data <- sleepdata %>%
        top_n(100, wt = Time.in.bed) %>%
        filter(Wake.up == input$Wake.up) %>%
        select(Time.in.bed, Sleep.quality)
      
      # Render a barplot with ggplotly
      ggplotly(
        ggplot(data = data, aes(x = Time.in.bed, y = Sleep.quality)) + 
          geom_point() + 
          ggtitle(input$Wake.up) +
          xlab("Time in Bed") + 
          ylab("Sleep Quality(in Percentage)")
        
      )
    })
    
    #render plotly
    output$sleepBar <- renderPlotly({
      #wrangle the data for the bar graph using DPLYR
      data_2 <- sleepdata_2 %>%
        top_n(100, wt = Time.asleep..seconds.) %>%
        filter(Alarm.mode == input$Alarm.mode) %>%
        select(Time.asleep..seconds., Sleep.Quality)
      
      # Render a barplot with ggplotly
      ggplotly(
        ggplot(data = data_2, aes(x = Sleep.Quality, y = Time.asleep..seconds.)) + 
          geom_bar(stat = "identity", fill = "blue") + 
          ggtitle(input$Alarm.mode) +
          xlab("Sleep Quality(in Percentage)") + 
          ylab("Time alseep in seconds")
        
      )
    })
    
  }




