# Google Data Analytics Capstone Cyclistic Case Study

This is the capstone project for my Coursera Google Data Analytics course.

## Introduction

In this project, I will be completing data analysis tasks for the fictional company Cyclistic. I will do this by following the steps taught in the Google Data Analytics Course: Ask, Prepare, Process, Analyze, Share and Act.

## Scenario

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
This is how I did it: [Combining the data]
I also removed the folowing columns as I thought they were not relevant to the question I was trying to answer: start_lat, start_lng, end_lat, end_lng, start_station_id, end_station_name, ride_id, end_station_id and start_station_name.

### Data Exploration

First I loaded the data into SQL




