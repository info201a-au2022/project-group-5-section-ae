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
    img("", src = "https://woodedglen.com/wp-content/uploads/2021/06/When-Should-You-Focus-on-Sleep.jpg",
        width = "700", height = "400", align = "center"),
    
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
    and rather adds to the confusion, the original data collectors can also have a negative impact from our project."),
    
    hr(),
    
    h2(strong("Research Questions")),
    h4(strong("What is causing people to have a lack of sleep?")),
    p("People should know the main causes of lack of sleep so they can control and rebalance their sleep cycle
      to make a better quality of life and sleep. This question is one of the main questions of our project. 
      The quality of sleep is very important and it always affects our lives."),
    h4(strong("What is the average amount of sleep that lets people wake up feeling well rested?")),
    p("It is important to know the average amount of sleep that lets people wake up feeling well-rested 
    because this data will individually provide the recommended amount of sleep time for users, based on their wake-up time
    for the last week and the data of average amount of sleep that lets people wake up feel well-rested ,in order to wake up
    feeling well-rested."),
    h4(strong("How does the amount of sleep affect stress levels?")),
    p("Usually people have a difficult time sleeping when they have a stressful day. 
      At high levels of stress, falling asleep takes longer and sleep is fragmented.
      Dr. Annise Willson explained, sleep loss triggers our bodies’ stress response system, 
      resulting in an elevation of the stress hormone cortisol."),
    
    hr(),
    
    h2(strong("The Dataset")),
    p("The datasets are related to our problem domain and research questions because we are trying to figure out what
      is causing the lack of sleep and how the different amounts of sleep affects in two ways: stress levels and the 
      feeling of well rested. Each entry (row) in the dataset provides us with the number of hours that person slept, 
      as well as their stress levels from a scale of 1-4, any sleep notes (for example if they had a stressful day, 
      if they drank coffee or tea that day, or if they worked out and exercised that day), and sleep quality as a 
      percentage. Those were some of the useful columns, and that will be able to help us figure out the causes for 
      lack of sleep and how that lack of sleep affects us."),
    
    hr(),
    
    h2(strong("Provenance of Dataset")),
    p("Dana Diotte used the Sleep Cycle iOS app from Northcube to collect the data. Her first dataset (sleepdata.csv)
      was collected from 2014-2018. Her second dataset (sleepdata_2.csv) was uploaded in April 2022 and it was a 
      continuation of her first dataset from 2018. She did not have any specific purpose for collecting the data other 
      than that she wanted to see how her collection of data looked versus how others’ collections of data looked like. 
      There is no insight to how the collection of this data was funded, but there was a research project that used that 
      dataset. This project is titled “From 887 days of sleep data to personalized suggestion” and is by Xiao Yang, a PhD 
      and senior Data Scientist and Research Lead at Mindstrong. We obtained these datasets by 
      going to www.kaggle.com/datasets and searching “sleep data”. Xiao Yang, and any readers viewing this project will 
      benefit from the dataset Dana Diotte’s dataset. This data is held secure by kaggle, and it is credible and trustworthy
      because all the data is collected from data on the source of this data, the Sleep Cycle iOS app, and all the entries are
      specific entries from users."),
    
    hr(),
    
    h2(strong("Expected Implications")),
    p(strong("Technologists:"), "They can develop and release the application or website to help people’s good sleep cycle. 
      Through the application or website, they suggest the amount of sleep time to users so users can have good quality of sleep."),
    br(),
    p(strong("Designers:"), "They can design applications or websites with a user-centered design by identifying direct and indirect 
      stakeholders, researching, interviewing, and surveying people to make the app or websites more user-friendly."),
    br(),
    p(strong("Policymakers:"), "It can be company or university policymakers. Basically, the main idea is the same which is putting the limitation of work time.
      So, people are not experiencing the overwhelming and guaranteed sleep time."),
    
    hr(),
    
    h2(strong("Limitations")),
    p("Usually the most important element of data is accuracy. If the data does not store accurate data, direct and indirect stakeholders
      could not trust and use the data we collected. However, this data only contains 4 years data from 2018 through 2022. 
      It only has 4 years of data which is not that big of data. It might be good data to find detail, but with this data, 
      we can not define the average sleep cycle of people. Also, the data has lots of NULL value which is missing value. 
      On this data, the Wake up and Activity section only contains NULL data. The limitation to measure or use the data set."),
    
    hr(),
    
    h2(strong("Acknowledgements")),
    p("Thanks to the data provider, and TA"),
    
    hr(),
    
    h2(strong("References")),
    p("- Diotte, D. (2022, April 25). Sleep data. Kaggle. Retrieved October 28, 2022, from https://www.kaggle.com/datasets/danagerous/sleep-data?select=sleepdata_2.csv"),
    br(),
    p("- How stress can affect your sleep. Baylor College of Medicine. (n.d.). Retrieved October 28, 2022, from https://www.bcm.edu/news/how-stress-can-affect-your-sleep"),
    br(),
    p("- Rachakonda, L. (2022, February 15). Human stress detection in and through sleep. Kaggle. Retrieved October 28, 2022, from https://www.kaggle.com/datasets/laavanya/human-stress-detection-in-and-through-sleep?select=SaYoPillow.csv"),
    br(),
    p("- Diotte, D. (2022, April 25). Sleep data. Kaggle. Retrieved October 28, 2022, from https://www.kaggle.com/datasets/danagerous/sleep-data?select=sleepdata.csv"),
    br(),
    p("- hortonj4. (2021, October 26). How does sleep affect your health. Cleveland Clinic. Retrieved October 31, 2022, from https://health.clevelandclinic.org/sleep-and-health/"),
    br(),
    p("- Natural patterns of sleep. Natural Patterns of Sleep | Healthy Sleep. (n.d.). Retrieved October 31, 2022, from https://healthysleep.med.harvard.edu/healthy/science/what/sleep-patterns-rem-nrem"),
    br(),
    p("- U.S. Department of Health and Human Services. (2018, April 4). The benefits of slumber. National Institutes of Health. Retrieved October 31, 2022, from https://newsinhealth.nih.gov/2013/04/benefits-slumber#:~:text=%E2%80%9CSleep%20affects%20almost%20every%20tissue,obesity%2C%20heart%20disease%20and%20infections.")
  )
  )
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
      helpText("Data from 'SaYoPillow.csv'")
    ),
    mainPanel(
      plotlyOutput("chart"),
      hr(),
      h2(strong("Summary Information")),
      p("In this chart, the affect of different stress levels on the relationship between Snoring Rate and Sleep Time.
        From stress levels 0-3 there is a linear positive correlation between Snoring Rate and Sleep Time, and the maximum 
        snoring rate continues to increase while it decreases for the sleep time. Therefore, higher snoring rates correlate
        with higher sleep time, but also with higher stress levels.")
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
      plotlyOutput("sleepScatter"),
      hr(),
      h2(strong("Summary Information")),
      p("Relationships between Sleep quality and Time in Bed based on the emotion when wake up: This chart is a scatterplot that shows the 
        relationship between time in bed and sleep quality given the emotion (happy, ok, sad). For the chart that shows people that wake up happy, 
        the data points are very randomized, with people that slept for 8 hours and 41 minutes getting 81% sleep quality, people that slept for 9 hours 
        and 19 minutes getting 54% sleep quality, and people who slept 9 hours and 31 minutes getting 98% sleep quality. For the chart that shows people 
        that wake up in an ok mood, someone who slept 8 hours and 42 minutes got 88% sleep quality, someone who slept 8 hours 50 minutes got 89% sleep 
        quality, and someone who slept 9 hours and 1 minute got 77% sleep quality. There was no data for people who woke up sad, and based on the current 
        data we have, there is not enough evidence to come up with a conclusive conclusion that emotion affects the relationship between sleep quality and 
        time in bed.")
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
      plotlyOutput("sleepBar"),
      hr(),
      h2(strong("Summary Information")),
      p("Relationships between Sleep quality and Time asleep based on the Alarm mode: This chart is a bar chart that shows the relationship between
        sleep quality and time asleep given the alarm mode (normal, no alarm). For the chart that shows people with a normal alarm, the people that 
        got 100% sleep quality got 3e+05 seconds of sleep, while in the chart that shows people with no alarm, the people that got 100% sleep quality 
        got almost 5e+05 seconds of sleep. In conclusion, people that got more sleep also had a higher sleep quality, but people with a normal alarm had 
        less sleep than people without an alarm at all.")
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
  theme = shinythemes::shinytheme("cerulean"),
  intro_view,
  chart_view_1,
  chart_view_2,
  chart_view_3
)
