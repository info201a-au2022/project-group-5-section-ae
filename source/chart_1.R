# This is the first chart from our data

library("stringr")
library("dplyr")
library("tidyverse")
#install.packages("ggplot2") # once per machine
library("ggplot2")          # in each relevant script

#Load the data
sleepdata<- read.csv(file = "../data/sleepdata.csv", sep = ";", quote = "")


# Filter down to top 10 most time in bed
top_10 <- sleepdata %>%
  top_n(10, wt = Time.in.bed) 

# Render a horizontal bar chart
bar_1 <- ggplot(data=top_10, aes(x = Time.in.bed, y = Sleep.quality))+
  geom_bar(stat="identity",fill="lightblue") + 
  ggtitle("Relationship Between Sleep Quality and Sleep time") + 
  xlab("Amount of Sleep Time (Hour : Minute)") + 
  ylab("Sleep Quality")

#Filter down to bottom 10 least time in bed
less_10 <- sleepdata %>%
  top_n(-10, wt = Time.in.bed)

#Render a horizontal bar chart 
bar_2 <- ggplot(data=less_10, aes(x = Time.in.bed, y = Sleep.quality))+
  geom_bar(stat="identity",fill="lightblue") + 
  ggtitle("Relationship Between Sleep Quality and Sleep time") + 
  xlab("Amount of Sleep Time (Hour : Minute)") + 
  ylab("Sleep Quality")


