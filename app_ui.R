#app_uilibrary("shiny")
library("dplyr")
library("tidyverse")
library("ggplot2")
library("plotly")
library("rsconnect")
library("shinyWidgets")

# loading dataset

intro_view <- tabPanel(
  "Introduction",
  h1(strong("The Importance Of Sleep")),
  img("", src = "https://www.thehealthy.com/wp-content/uploads/2020/12/sleep-quotes08.jpg?fit=680,680",
      width = "400", height = "400", align = "center"),
  p("Sleep is a necessity and a crucial part of everyday life. 
    However, a lot of us have been experiencing a lack of sleep for various reasons, such as stress, 
    or we just have busy and chaotic lives with school and work.
    It made us curious about the biggest reasons of lack of sleep and how the amount of sleep affects us. 
    In our project Sleep Well, we asked questions such as what is causing people to have a lack of sleep, 
    what is the average amount of sleep that lets people feeling well rested, and how does sleep affect stress levels.
    The stakeholders are people who experience insomnia, do not get enough sleep, have trouble sleeping, 
    and people who experience high levels of stress because of poor sleep. 
    This will benefit them because it can help them find out if there’s anything wrong with their sleep schedule, 
    and their stress levels could be reduced after fixing their sleep. The data we analyzed is from Kaggle. 
    Two of the datasets are data from an iOS app called Sleep Cycle. We used all the data to produce graphs and interactive charts shown below."),
  h2(strong("Data Analysis")),
  p("data analysis goes here")
)

chart_view_1 <- tabPanel(
  "Stress Level",
  h1(strong("How Stress Level Impacts Your Sleep Time ")),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "sl", label = "Select Stress Level:",
        min = 0, max = 4, value = 3
      ),
      h3(strong("The Pattern of Chart")),
      p("As stress level is increased, the amount of sleep time is decreased, but snoring rate is increased. It shows that high stress level could be the bad factor of your sleep"),
    ),
    mainPanel(
      plotlyOutput("chart")
    )
  )
)

page2_datas <- fluidPage(    
  
  # Give the page a title
  titlePanel(strong("Relationships between Sleep quality and Time in Bed based on the emotion when wake up")),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with a box of selections of countries, and the slider for the adjustments of year in bar plot
    sidebarPanel(
      selectInput("Wake.up", "Wake Up:", 
                  choices = unique(sleepdata$Wake.up)),
      helpText("Data from 'sleepdata.csv'")
    ),
    
    # Create a spot for the bar plot and the chart
    mainPanel(
      plotlyOutput("sleepScatter")
      
    )
    
  )
)

####Tab Panel for Page 2####

chart_view_2 <- tabPanel(
  "Interactive Visualization", 
  page2_datas
)



page3_datas <- fluidPage(    
  
  # Give the page a title
  titlePanel(strong("Relationships between Sleep quality and Time asleep based on the Alarm mode")),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with a box of selections of countries, and the slider for the adjustments of year in bar plot
    sidebarPanel(
      selectInput("Alarm.mode", "Alarm mode:", 
                  choices = unique(sleepdata_2$Alarm.mode)),
      helpText("Data from 'sleepdata_2.csv'")
    ),
    
    # Create a spot for the bar plot and the chart
    mainPanel(
      plotlyOutput("sleepBar")
      
    )
    
  )
)

####Tab Panel for Page 2####

chart_view_3 <- tabPanel(
  "Interactive Visualization_2", 
  page3_datas
)





# Define UI
ui <- navbarPage(
  "Sleep Well",
  theme = shinythemes::shinytheme("cosmo"),
  intro_view,
  chart_view_1,
  chart_view_2,
  chart_view_3
)
