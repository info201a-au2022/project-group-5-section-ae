# This is the second chart from our data

library("stringr")
library("dplyr")
library("tidyverse")
install.packages("ggplot2") # once per machine
library("ggplot2") # in each relevant script

#Load the data
sleepdata_2<- read.csv(file = "../data/sleepdata_2.csv", sep = ";", quote = "")

# Filter down to top 20 most steps in day
top_20 <- sleepdata_2 %>%
  top_n(20, wt = Steps) 

# Render a horizontal bar chart
ggplot(data=top_20, aes(x = Steps , y = Sleep.Quality, group = 1))+
  geom_line( color="#69b3a2", size=1.5, alpha=0.9, linetype = "dashed" ) +
  geom_point() +
  xlab("Steps in Day") +
  ylab("Sleep Quality") +
  ggtitle("Relationship Between Sleep Quality and Steps in day")

