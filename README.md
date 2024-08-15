# Google Data Analytics Capstone Project: Cyclistic Case Study

This is the capstone project for my Coursera Google Data Analytics course.

## Introduction

In this project, I will be completing data analysis tasks for the fictional company Cyclistic. I will do this by following the steps taught in the Google Data Analytics Course: Ask, Prepare, Process, Analyze, Share and Act.

### Scenario

I am a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the 
company’s future success depends on maximizing the number of annual memberships. Therefore, my team seeks to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve our recommendations, so they must be backed up with compelling data insights and professional data visualizations.

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

2. I checked for duplicates with pur primary key which is ride_id, and found 211 rows.
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

