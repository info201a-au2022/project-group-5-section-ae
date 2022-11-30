#app_uilibrary("shiny")
library("dplyr")
library("tidyverse")
library("ggplot2")
library("plotly")
library("rsconnect")

# loading dataset

intro_view <- tabPanel(
  "Introduction",
  h1(strong("The Importance Of Sleep")),
  img("", src = "https://www.thehealthy.com/wp-content/uploads/2020/12/sleep-quotes08.jpg?fit=680,680",
      width = "400", height = "400", align = "center"),
  p("Introduction goes here"),
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

# Define UI
ui <- navbarPage(
  "Sleep Well",
  theme = shinythemes::shinytheme("cosmo"),
  intro_view,
  chart_view_1
)

