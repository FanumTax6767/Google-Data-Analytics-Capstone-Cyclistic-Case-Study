# Google Data Analytics Capstone Project: Cyclistic Case Study



## Introduction

In this project, I will be completing data analysis tasks for the fictional company Cyclistic. I will do this by following the steps taught in the Google Data Analytics Course: Ask, Prepare, Process, Analyze, Share and Act.

### Scenario

I am a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team seeks to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve our recommendations, so they must be backed up with compelling data insights and professional data visualizations.



## Ask
### Business Task

Devise marketing strategies to convert casual riders to members.

### Analysis Questions

Three questions will guide the future marketing program:

1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

My manager has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?



## Prepare
### Data Source

I downloaded my data from [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). (The data has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement).)

### Data Organization

There are 12 files named according to the convention 'YYYYMM-divvy-tripdata', where each file represents data for one month. Each file includes the following columns: ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, and member_casual. These columns provide details such as the ride ID, bike type, start and end times, start and end stations, start and end locations, and whether the rider is a member or a casual user.

## Process
### Combining the Data

I chose to use R to combine the 12 files since the total number of rows is 5,734,381, which is too large for Excel or Spreadsheets to process.
This is how I did it: [Combining the data](https://github.com/FanumTax6767/Google-Data-Analytics-Cyclistic-Case-Study/blob/main/1.%20Combining%20the%20Data.R)

I also removed the following columns as I thought they were not relevant to the question I was trying to answer: start_lat, start_lng, end_lat, end_lng, start_station_id, end_station_name, ride_id, end_station_id and start_station_name(In retrospect I should have done this later on in the process).

### Data Exploration

First I loaded the data into SQL, then made some queries to understand the data better.

1. I checked all of the columns for NULL values and found none.
<img width="327" alt="Screenshot 2024-08-07 at 12 55 22 PM" src="https://github.com/user-attachments/assets/be3dcc45-7420-4f86-bab6-8a489a0a885e">

2. I checked for duplicates with the primary key, which is ride_id, and found 211 rows.
<img width="109" alt="Screenshot 2024-08-07 at 12 57 39 PM" src="https://github.com/user-attachments/assets/c4dfa5b3-b27d-48c4-809a-c0858a5e6ad2">

3. I checked for ride times that were over 1 day, of which there were 7,335. I also checked for ride durations under a minute, of which there were 91,369.
<img width="107" alt="Screenshot 2024-08-07 at 5 02 10 PM" src="https://github.com/user-attachments/assets/13b93179-00b3-4e58-bd85-763e4f3f9ff3">
<img width="86" alt="Screenshot 2024-08-07 at 5 02 32 PM" src="https://github.com/user-attachments/assets/fadf020b-e3ea-46df-b3dc-27ad0cc23a6e">

Here is my SQL query: [Data Exploration](https://github.com/FanumTax6767/Google-Data-Analytics-Cyclistic-Case-Study/blob/main/2.%20Data%20Exploration.sql)

### Cleaning the Data

I removed all of the rows that were duplicates and also rows where the ride time was over a day or under a minute. Total number of rows removed was 142,879, which left us with 5,591,502 rows of data to analyze.

I also added three columns:

1. Days of the week that the rides started at (MON~SUN).
2. Months that the rides took place in (JAN~DEC).
3. Duration of the trips.

Here is the SQL query: [Cleaning the Data](https://github.com/FanumTax6767/Google-Data-Analytics-Cyclistic-Case-Study/blob/main/3.%20Cleaning%20the%20Data.sql)



## Analyze

I chose to go back to R for my analysis process: [Data Analysis](https://github.com/FanumTax6767/Google-Data-Analytics-Cyclistic-Case-Study/blob/main/4.%20Data%20Analysis.R)

I basically just looked for anything that would be of relevance to the analysis question, then I visualized everything worthwhile in tableau, which I will share in the next section.



## Share

Here is the link to my vizz on Tableau: [Tableau Vizz](https://public.tableau.com/app/profile/liam.mitchell4445/viz/GoogleDataAnalyticsCapstoneProjectCyclisticCaseStudy_17230580133640/Month)

This is the question I'm aiming to answer: How do annual members and casual riders use Cyclistic bikes differently?

First of all let's take a look at the Ridable type percentages for members and casual users:

<img width="847" alt="Screenshot 2024-08-08 at 2 55 53 AM" src="https://github.com/user-attachments/assets/b4439ae5-98fd-443f-a2d7-a7014ab22519">
We can see that there is no significant difference in the use rates of the classic and electric bikes between members and casual riders. However we can see that 100% of the docked bike rides were by casual users.



Next let's examine the days of the week that the rides took place:

<img width="902" alt="Screenshot 2024-08-16 at 2 30 41 PM" src="https://github.com/user-attachments/assets/3a75f8cb-151c-4055-b329-65b7ae79dc2e">
There is an noticable difference in what day of the week the different users choose the use Cyclistic.
Casual users much more frequently ride on the weekend, while members are the exact opposite, with the weekends having the least amount of rides. 



The total rides every month are examined below:

<img width="902" alt="Screenshot 2024-08-16 at 2 30 59 PM" src="https://github.com/user-attachments/assets/66f37179-1370-4621-81ac-e3b0c9ba324a">
Both casual users and members had more rides during summer and spring, with far less in winter.



Next up is the time of day that the rides took place:

<img width="633" alt="Screenshot 2024-08-08 at 2 59 56 AM" src="https://github.com/user-attachments/assets/aa88589c-4fc0-4168-989c-fadcb3f69dd7">
The members have two spikes in the number of rides during commute hours (8 a.m. and 5 p.m.)
Casual users, however, have a steady rise in the number of rides from 8 a.m. until 5 p.m., with it dropping off after that.


Lastly, the avarage trip duration for the different users:

<img width="641" alt="Screenshot 2024-08-08 at 3 07 33 AM" src="https://github.com/user-attachments/assets/82ef3091-6dc4-4dbd-96f9-f702d1d3d7d9">

We can see that on avarage, causual users have a much longer trip duration than members.


### Summary

Casual users like to ride for **longer**, more **on the weekends** and likely **for leisure**.

Members have **shorter** rides, more **during weekdays** and likely for **commuting**.

All users have more rides in the summer.



## Act

After coming to the conclusions above, I recommend these three marketing strategies to convert casual users into members:

1. Launch an advertising campaign targeted at casual riders during the summer and also weekends.
2. Prolong the unlimited ride times for members (This is assuming that there is a cap for how long members can ride for in a day, as this info wasn't provided).
3. Create a cheaper membership option that allows the same benefits but only on weekends.
4. Allow members to use docked bikes.


