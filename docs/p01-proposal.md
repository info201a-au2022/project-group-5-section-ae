# **SLEEP WELL**
<br> **Authors:** Junhee Park(rusu0531@uw.edu), Ji min Sung(jsung22@uw.edu), William Yuen (wyuenb@uw.edu)

**Affiliation:** INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

**Date:** Autumn 2022

## **Abstract**
> Our _main question_ is **How to have the highest performance for the day with a good quality of sleep.** This question is important because approximately 70 million Americans suffer from Insomnia every year.  To address the question, we will collect data on sleep and figure out what the main causes of sleep disorders are.

## **Key Words**
- Sleep Quality
- Stress Level
- Average Amount of Sleep
- Stress Level

## **Introduction**
> A lot of college students, workers, and high school seniors have been experiencing stressful days recently. One of the biggest causes that let people experience stressful days is they have a lack of sleep. There might be a lot of reasons why people do not sleep. It can be staying up to work on assignments for school, working late for their job, or preparing for college with anxiety. But one of the biggest reasons why people stay up late and have stressful days is that they do not know how to control their sleep schedule. The _Sleep Well_ projects will help users to have a good amount of sleep with an organized sleep schedule that is built based on sleep data collected from Google Data Search.

## **Problem Domain**
> work on later

## **Research Questions**

- **What is causing people to have a lack of sleep?**
  - People should know the main causes of lack of sleep so they can control and rebalance their sleep cycle to make a better quality of life and sleep. This question is one of the main questions of our project. The quality of sleep is very important and it always affects our lives.

- **What is the average amount of sleep that lets people wake up feeling well rested?**
  - It is important to know the average amount of sleep that lets people wake up feeling well-rested because this data will individually provide the recommended amount of sleep time for users, based on their wake-up time for the last week and the data of average amount of sleep that lets people wake up feel well-rested ,in order to wake up feeling well-rested.

- **How does the amount of sleep affect stress levels?**
  - Usually people have a difficult time sleeping when they have a stressful day. At high levels of stress, falling asleep takes longer and sleep is fragmented. [Dr. Annise Willson](https://www.bcm.edu/news/how-stress-can-affect-your-sleep ) explained, _"sleep loss triggers our bodies’ stress response system, resulting in an elevation of the stress hormone cortisol."_

## **The Dataset**

> The datasets are related to our problem domain and research questions because we are trying to figure out what is causing the lack of sleep and how the different amounts of sleep affects in two ways: stress levels and the feeling of well rested. Each entry (row) in the dataset provides us with the number of hours that person slept, as well as their stress levels from a scale of 1-4, any sleep notes (for example if they had a stressful day, if they drank coffee or tea that day, or if they worked out and exercised that day), and sleep quality as a percentage. Those were some of the useful columns, and that will be able to help us figure out the causes for lack of sleep and how that lack of sleep affects us.

| Name of data file | Number of observation(rows) | Number of variables(columns) |
|---------------| -------------- | --------------
sleepdata.csv | 887 | 8
sleepdata_2.csv | 921 | 21
SleepStudyData.csv | 104 | 6

### **Provenance of Dataset**
> Dana Diotte used the Sleep Cycle iOS app from Northcube to collect the data. Her first dataset (sleepdata.csv) was collected from 2014-2018. Her second dataset (sleepdata_2.csv) was uploaded in April 2022 and it was a continuation of her first dataset from 2018. She did not have any specific purpose for collecting the data other than that she wanted to see how her collection of data looked versus how others’ collections of data looked like. There is no insight to how the collection of this data was funded, but there was a research project that used that dataset. This project is titled “From 887 days of sleep data to personalized suggestion” and is by Xiao Yang, a PhD and senior Data Scientist and Research Lead at Mindstrong. We obtained these datasets by going to www.kaggle.com/datasets and searching “sleep data”. Xiao Yang, and any readers viewing this project will benefit from the dataset Dana Diotte’s dataset. This data is held secure by kaggle, and it is credible and trustworthy because all the data is collected from data on the source of this data, the Sleep Cycle iOS app, and all the entries are specific entries from users.


## **Expected Implications**

**Technologists:** They can develop and release the application or website to help people’s good sleep cycle. Through the application or website, they suggest the amount of sleep time to users so users can have good quality of sleep.

**Designers:** They can design applications or websites with a user-centered design by identifying direct and indirect stakeholders, researching, interviewing, and surveying people to make the app or websites more user-friendly.

**Policymakers:** It can be company or university policymakers. Basically, the main idea is the same which is putting the limitation of work time. So, people are not experiencing the overwhelming and guaranteed sleep time.

## **Limitations**

> Usually the most important element of data is _accuracy_. If the data does not store accurate data, direct and indirect stakeholders could not trust and use the data we collected. However, this data only contains 4 years data from 2018 through 2022. It only has 4 years of data which is not that big of data. It might be good data to find detail, but with this data, we can not define the average sleep cycle of people. Also, the data has lots of _NULL_ value which is missing value. On this data, the _Wake up_ and _Activity_ section only contains _NULL_ data. The limitation to measure or use the data set.

## **Acknowledgements**

> :handshake: Thanks to our group members, The data provider, and TA

## **References**

- Diotte, D. (2022, April 25). _Sleep data._ Kaggle. Retrieved October 28, 2022, from https://www.kaggle.com/datasets/danagerous/sleep-data?select=sleepdata_2.csv
- _How stress can affect your sleep._ Baylor College of Medicine. (n.d.). Retrieved October 28, 2022, from https://www.bcm.edu/news/how-stress-can-affect-your-sleep
- Rachakonda, L. (2022, February 15). _Human stress detection in and through sleep._ Kaggle. Retrieved October 28, 2022, from https://www.kaggle.com/datasets/laavanya/human-stress-detection-in-and-through-sleep?select=SaYoPillow.csv
- Diotte, D. (2022, April 25). _Sleep data._ Kaggle. Retrieved October 28, 2022, from https://www.kaggle.com/datasets/danagerous/sleep-data?select=sleepdata.csv
