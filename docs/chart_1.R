# This is the first chart from our data

library("stringr")
library("dplyr")
library("tidyverse")
#install.packages("ggplot2") # once per machine
library("ggplot2")          # in each relevant script
sleepdata<- read.csv(file = "../data/sleepdata.csv", sep = ";", quote = "")


# Filter down to top 10 most time in bed
top_10 <- sleepdata %>%
  top_n(10, wt = Time.in.bed) 

# Render a horizontal bar chart
ggplot(top_10) +
  geom_col(mapping = aes(x = Time.in.bed, y = Sleep.quality))

#Filter down to bottom 10 least time in bed
less_10 <- sleepdata %>%
  top_n(-10, wt = Time.in.bed)

#Render a horizontal bar chart 
ggplot(less_10) +
  geom_col(mapping = aes(x = Time.in.bed, y = Sleep.quality))

