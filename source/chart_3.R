# This is the second chart from our data

library("stringr")
library("dplyr")
library("tidyverse")
#install.packages("ggplot2") # once per machine
library("ggplot2")  # in each relevant script

#Load the data
SaYodata<- read.csv(file = "../data/SaYoPillow.csv")

# Create the geom_point chart with color 
point_chart <- ggplot(data= SaYodata, aes(x = lm , y = sl))+
  ggtitle("Relationship Between Limb movement and Stress level") +
  xlab("Amount of Limb Movement") +
  ylab("Stress Level (1 - 4)") +
  geom_point(colour = "red")

