#app_uilibrary("shiny")
# library("dplyr")
# library("tidyverse")
# library("ggplot2")
# library("plotly")
# library("rsconnect")
# library("shinyWidgets")

sleepdata <- read.csv("./data/sleepdata.csv", sep = ";", quote = "")
sleepdata_2 <- read.csv("./data/sleepdata_2.csv", sep = ";", quote = "")
sayopillow <- read.csv("./data/SaYoPillow.csv")

intro_view <- tabPanel(
  "About Our Project",
  sidebarLayout(
    sidebarPanel(
      h1(strong("Who are we")),
      hr(),
      
      h5("Ji Min Sung"),
      p("jsung22@uw.edu"),
      br(),
      
      h5("Junhee Park"),
      p("rusu0531@uw.edu"),
      br(),
      
      h5("William Yuen"),
      p("wyuenb@uw.edu"),
      br(),
      
      h5("Rohan Simha"),
      p("rohans24@uw.edu"),
      br(),
      helpText("Code Name: REM")
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
      "Average Amount of Sleep"
      ),
    
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
    Two of the datasets are data from an iOS app called Sleep Cycle. We used all the data to produce graphs and interactive charts shown below.")
)))

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
  titlePanel(strong("Relationships Between Sleep Quality And Time In Bed Based On The Emotion When Wake Up")),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with a box of selections of countries, and the slider for the adjustments of year in bar plot
    sidebarPanel(
      selectInput("Wake.up", "Wake Up:", 
                  choices = unique(new_sleepdata$Wake.up)),
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
  "Emotion", 
  page2_datas
)



page3_datas <- fluidPage(    
  
  # Give the page a title
  titlePanel(strong("Relationships Between Sleep Quality And Time Asleep Based On The Alarm Mode")),
  
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
  "Alarm", 
  page3_datas
)


report_page <- fluidPage(    
  
  # Give the page a title
  titlePanel(strong("Report Page")),
    mainPanel(
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
      img("", src = "https://github.com/info201a-au2022/project-group-5-section-ae/blob/main/source/table.jpeg?raw=true",
          width = "100%", height = "100%", align = "center"),
      hr(),
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
      
      h2(strong("Findings")),
      h4(strong("What is causing people to have a lack of sleep?")),
      br(),
      p("One reason why people get lack of sleep is that they have too much limb movement
      during sleep. In one of our graphs, titled, “Relationship Between Limb movement and Stress level”, people with little to no limb 
      movement (limb movement 0-10 on a scale from 0-20) have little to no stress (stress level 0-1 on a scale from 0-4). On the other 
      hand, people with a lot of limb movement (15-20) have a lot of stress (3-4). As we found from our research, people with more limb 
      movement have higher stress levels, which causes less sleep. Hence, people with more limb movements have less sleep."),
      br(),
      p("Another reason for lack of sleep is using an alarm. One of our interactive charts, titled, “Relationships between Sleep quality 
      and Time asleep based on the Alarm mode”, shows the relationship between alarm mode, time asleep, and sleep quality. The people 
      that do not use an alarm and get 100% quality of sleep get over 4e+05 seconds of sleep. The people that use an alarm and get 100% 
      quality of sleep, get only 3e+05 seconds of sleep. This makes sense because people who usually use an alarm are the ones that 
      usually need to wake up early for school or work, hence getting less sleep."),
      br(),
      h4(strong("What is the average amount of sleep that lets people wake up feeling well-rested?")),
      br(),
      p("In our Exploratory Analysis chart, we found a relationship between Sleep Quality and Sleep Time. 
      We observed that participants with 9 hours and 35 minutes of sleep time had on average a 99 percent sleep quality, which shows 
      that this is the optimal amount of sleep to achieve the best quality of sleep. Furthermore, when we calculated the effect of 
      wake-up emotion on the Relationship of Time in Bed and Sleep Quality for the Final Section, we found that for people who woke up 
      feeling happy the max Sleep Quality the maximum sleep time was at 9 hours and 31 minutes. This is a similar time and also had a 
      Sleep Quality of 99 percent, which demonstrates how at around 9 hours and 35 minutes people not only have very high sleep quality 
      but also experience positive emotions when they wake, so they definitely feel well rested."),
      h4(strong("How does the amount of sleep affect stress levels?")),
      br(),
      p("We were unable to find a correlation between sleep and stress levels in this given data, but we did test for how stress levels
      affect sleep time. One of our interactive charts, titled, “How Stress Level Impacts Your Sleep Time”, shows the relationship between
      stress levels, sleeping time, and snoring rate. There is a slider that controls the stress level and at the lowest stress level (0),
      people were able to sleep between 7 to 9 hours. After sliding it to a high stress level (3), people got 2 hours or less of sleep. 
      This makes sense because someone that is more stressed out will not be able to sleep as well as someone who is stress-free."),
      
      hr(),
      
      h2(strong("Discussion")),
      br(),
      p("From our research, we found that the two main reasons people have a lack of sleep are stress-induced limb movement and the use 
      of an alarm. Because of the stress that people face in their day-to-day lives, limb movement obviously increases, which thus causes
      people to have lower sleep times. This can be especially detrimental to one's health, as these lower sleep times can not only 
      continue to increase stress but also affect sleep quality. Alarms cause people to have less sleep is also a concerning issue,
      as they are integrated into many people's lives so they can go about their daily lives. Though by using alarms many people may 
      actually be limiting their sleep, and thus could achieve more if they were not forced to wake up at certain times."),
      br(),
      p("From our findings, it is evident that the 9-hour and the 35-minute benchmark is the optimal amount of sleep time one should achieve to feel well-rested. 
      Because people felt 99 percent Sleep Quality during this time, it shows that not only did the participant sleep for a longer time, 
      but the sleep they had was quality and beneficial to their overall health. Furthermore, this amount of sleep also yielded a positive
      wake-up emotion, which shows how achieving this high amount of sleep time can maximize your sleep quality which leaves you feeling 
      well-rested and positive during the day. Lastly, achieving this high amount of sleep, it may signify how sleeping for longer periods
      of time causes this higher sleep quality, with lower levels not letting one achieve this high-quality sleep which is necessary to feel
      well-rested."),
      br(),
      p("While we were unable to find a reliable correlation between sleep influencing stress levels, with further research we were
      able to identify how higher stress levels negatively affected the amount of sleep that participants were able to get. From the lowest
      levels of stress, the amount of total sleep in hours that people achieved was much higher at 7 to 9 hours, but when it moved to a higher
      amount of stress declined to a mere 2 hours or less. This demonstrates how influential stress can be on sleep times, and how daily 
      activities and important events that cause this stress can impact the number of people who are able to sleep. Moreover, when people
      have such low levels of sleep induced from their stress, this can compound and cause them to have even more stress."),
      
      hr(),
      
      h2(strong("Conclusion")),
      p("Sleep is part of everyday life, we all need it. If we miss sleep, there would be various health problems that would be created. 
      If sleep is so important, how come so many people still have a lack of sleep and have problems sleeping such as insomnia? Sometimes
      we feel stressed and cannot sleep well and sometimes it’s the other way around, where waking up from bad sleep increases our stress 
      levels. We all just want to have optimal sleep that leaves us well rested, energized for the coming day, and sleep that will provide
      us with good health. All these questions and wonderings are what the Sleep Well project aims to answer. This affects everyone since
      sleep is a significant part of everybody’s life and we can all benefit from better quality sleep."),
      br(),
      p("After analyzing sleep data from Kaggle, we concluded that the best number of hours of sleep was 9 hours. 9 hours of sleep everyday was the optimal number of hours 
      that left us feeling well rested and happy, fueled a productive day, and a good amount of sleep that helps our bodies maintain good
      health. This conclusion was based on one of our three interactive charts, titled, “Relationships Between Sleep Quality And Time In Bed
      Based On The Emotion When Wake Up”."),
      br(),
      p("We collected data and examined many different factors that go into sleep, such as how the alarm mode affects sleep, how limb movement affects sleep, how the number of steps in a day affects sleep, and how snoring rate affects sleep. 
      Here are some quick sentences that summarize what we concluded. We get more high quality sleep when there is no alarm. More limb movement
      correlates with higher stress levels, which means that we get less high quality sleep. The more exercise we get, the better sleep we get,
      up to a certain limit. A higher snoring rate correlates with higher stress levels, which means we get less sleep."),
      br(),
      p("Sometimes we just need to let go of our chaotic and busy lives in order to get better sleep. We need to learn how to balance work and school with our stress levels
      and exercise. We concluded that 9 hours of sleep is optimal so make sure to try to reach that number on a daily basis. We advise you to 
      search the internet or ask a doctor about what more you can do to optimize your sleep."),
      
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

takeaway <- fluidPage(
  titlePanel(strong("Summary Takeaway")),
  mainPanel(
    p("The first significant takeaway can be found when observing the relationship between snoring level and sleep time at different
    variables of stress, which can be found on the first chart. For lower stress levels of zero to three, the relationship between 
    snoring level and sleep time is positively linear, however, at a stress level of four, the line becomes linear and horizontal. 
    Furthermore, the maximum sleep time decreases as the stress level increases, but the snoring rate increases with an increase in 
    stress level. Evidently, not only does a higher stress level cause lower sleep times, but also a higher snoring rate. This 
    demonstrates how harmful higher stress levels can be, as not only do they lower sleep times which are imperative to your health,
    but also increase snoring rates which causes a further disturbance in your sleep quality.  Also, at a stress level of four the sleep
    time is at zero, showing how such high levels of stress can even cause an inability to sleep."),
    br(),
    p("Another takeaway can be found in the second chart, which examines the relationship between Time in Bed and Sleep Quality, 
      and how wake-up emotion affects this relationship. While most participants reported their emotions to be happy, it can be observed
      that all of these participants had sleep times around 9 hours, and interestingly those who had slightly more or less than 9 hours 
      had the highest sleep quality. Also, for both the “happy” and “neutral” emotion, the max ranked Sleep Quality was at a sleep time of
      8 hours and 50 minutes. This data shows that not only can Sleeping around 9 hours give optimal Sleep Quality, but it can also 
      increase the positive emotion one feels when achieving adequate sleep. Therefore, it is important for people to achieve this 9 hour
      benchmark to improve their general mood and emotions in their daily lives."),
    br(),
    p("A final set of takeaways are from chart 3 which observes the effects of alarm versus no alarm and how it affects the relationship
      between sleep quality and sleep time in seconds. With both the presence and lack of an alarm, a 100 percent sleep quality saw a 
      dramatic increase in sleep time per second, with maxes of 3e + 05 and 4.7e + 05 seconds respectively. This shows just how important
      optimal sleep quality is for higher sleep times, as achieving this 100 percent sleep quality has a large increase in sleep time
      regardless of the presence of the alarm. However, interestingly when viewing the other sleep quality percentages, the majority of
      sleep times also were higher when there was no alarm compared to an alarm. This conclusion may be due to the fact that alarms “cut
      off” the participant's sleep times and limit them to a certain amount. As a result, while alarms are necessary for people to go 
      through day-to-day activities, they can limit the amount of sleep people get, and sometimes make it so they do not achieve optimal 
      sleep levels, but there does not seem to be a sacrifice in terms of sleep quality")
))

takeaway_view <- tabPanel(
  "Summary Takeaway",
  takeaway
)


report_view <- tabPanel(
  "Report",
  report_page
)



# Define UI
ui <- navbarPage(
  "Sleep Well",
  theme = shinythemes::shinytheme("darkly"),
  intro_view,
  chart_view_1,
  chart_view_2,
  chart_view_3,
  takeaway_view,
  report_view
)
