# summary_info.R 
# A source file that takes in a dataset and returns a list of info about it:
#rm(list = ls())

#load first data
sleepdata<- read.csv(file = "../data/sleepdata.csv", sep = ";", quote = "")

#load second data
sleepdata_2<- read.csv(file = "../data/sleepdata_2.csv", sep = ";", quote = "")

#load third data
SaYodata<- read.csv(file = "../data/SaYoPillow.csv")


#first data summary
summary_info <- list()
summary_info$num_observations <- nrow(sleepdata)
summary_info$Sleep_quality_max_value <- sleepdata %>%
  filter(Sleep.quality == max(Sleep.quality, na.rm = T)) %>%
  select(Sleep.quality)

#Second data summary

summary_info_2 <- list()
summary_info_2$num_observations <- nrow(sleepdata_2)
summary_info_2$Steps_min_value <- sleepdata_2 %>%
  filter(Steps == min(Steps, na.rm = T)) %>%
  select(Steps)


#Third data summary

summary_info_3 <- list()
summary_info_3$num_observations <- nrow(SaYodata)
summary_info_3$stress_level_max_value <- SaYodata %>%
  filter(sl == max(sl, na.rm = T)) %>%
  select(sl)

#Fourth data summary
summary_info_4 <- list()
summary_info_4$num_observations <- nrow(sleepdata)
summary_info_4$Heart_rate_max_value <- sleepdata %>%
  filter(Heart.rate == max(Heart.rate, na.rm = T)) %>%
  select(Heart.rate)

#Fifth data summary
summary_info_5 <- list()
summary_info_5$num_observations <- nrow(sleepdata_2)
summary_info_5$Regularity_min_value <- sleepdata_2 %>%
  filter(Regularity == min(Regularity, na.rm = T)) %>%
  select(Regularity)