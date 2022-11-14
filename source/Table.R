#Table for P2
library("stringr")
library("dplyr")
library("tidyverse")

#read the csv file into the R studio
SaYodata<- read.csv(file = "../data/SaYoPillow.csv")

#For this table, we grouped by stress level with the average time of the sleep.
Table_sl_sr.1 <- SaYodata %>%
  group_by(sl)%>%
  summarise(avg_sr = mean(sr.1))%>%
  rename("Stress Level" = "sl", "Average Sleeping Hour" = "avg_sr")

