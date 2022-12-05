#app_uilibrary("shiny")
library("dplyr")
library("tidyverse")
library("ggplot2")
library("plotly")
library("rsconnect")
library("shinyWidgets")

intro_view <- tabPanel(
  "About Our Project",
  sidebarLayout(
    sidebarPanel(
      h1("Who are we"),
      hr(),
      
      h5("Ji Min Sung"),
      p("jsung1014@gmail.com"),
      br(),
      
      h5("Junhee Park"),
      p("rusu0531@uw.edu"),
      br(),
      
      h5("William Yuen"),
      p("wyuenb@uw.edu"),
      br(),
      
      h5("Rohan Simha"),
      p("rohans24@uw.edu"),
      br()
    ),
  mainPanel(
    img("", src = "https://www.thehealthy.com/wp-content/uploads/2020/12/sleep-quotes08.jpg?fit=680,680",
        width = "200", height = "200", align = "center"),
    h2(strong("Abstract")),
    p("Our main question is How to have the highest performance for the day with a good quality of sleep. 
      This question is important because approximately 70 million Americans suffer from Insomnia every year.
      To address the question, we will collect data on sleep and figure out what the main causes of sleep disorders are."),
    hr(),
    h2(strong("Key Words")),
    p("Sleep Quality",
      br(),
      "Stress Level",
      br(),
      "Average Amount of Sleep",
      br(),
      "Stress Level"),
    hr(),
    h2(strong("Introduction")),
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
    hr(),
    h2(strong("Problem Domain")),
    p("Our project framing is to analyze the three different sleep data to combine all together to create 
    an average sleep time schedule which could be helpful to stakeholders. For human values, 
    sleep enables us to repair our body condition while we are sleeping and prepares us for the coming day. 
    If we ruin our sleep cycle, it may affect our mental and physical health.
    Our project direct stakeholder might be anyone who uses our “Sleep Well” website which means it can be people who are experiencing insomnia,
    trouble with sleeping, or having a good sleep schedule. The possible benefits for direct stakeholders are that their health will be recovered because
    they will get enough sleep with good sleep schedules, and they could check whether they are having good sleep schedules or not. 
    The possible harm for direct stakeholders is that this website could create pressure on the users to sleep 
    and give anxiety when users have to stay up late for various reasons.
    Our indirect stakeholder might be the people who collected and provided the sleep data. 
    The possible benefits for indirect stakeholders are that they could spread their valuable information and data 
    to more people through our projects since we are using their data.
    The possible harm for indirect stakeholder is that If our project fails to provide proper information to direct stakeholder
    and rather adds to the confusion, the original data collectors can also have a negative impact from our project.")
  )
))

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
