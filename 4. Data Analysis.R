install.packages("dplyr")
install.packages("stringr")
library(dplyr)
library(stringr)
library(tidyverse)
SQL_bike <- read_csv("/Users/liammitchell/Desktop/Divvy Data from 2024-06 ~ 2023-07/Bike data after SQL.csv")

SQL_bike <- drop_na(SQL_bike)

SQL_bike <- SQL_bike %>%
  rename_all(~ str_replace_all(., " ", "_"))

bike_type_duration <- SQL_bike %>%
  group_by(bike_type) %>%
  summarise(
    average_duration = mean(trip_duration),
    median_duration = median(trip_duration)
  )
bike_type_duration

membership_trip_duration <- SQL_bike %>%
  group_by(membership_type) %>%
  summarise(
    average_duration = mean(trip_duration),
    median_duration = median(trip_duration)
  )
membership_trip_duration

summary_table <- SQL_bike %>%
  group_by(membership_type, bike_type) %>%
  summarise(count = n(), .groups = 'drop') %>% 
  pivot_wider(names_from = `bike_type`, values_from = count, values_fill = list(count = 0))
summary_table

percentage_table <- SQL_bike %>%
  count(`membership_type`, `bike_type`) %>%
  pivot_wider(names_from = `bike_type`, values_from = n, values_fill = list(n = 0)) %>%
  rowwise() %>%
  mutate(across(where(is.numeric), ~ . / sum(c_across(where(is.numeric)), na.rm = TRUE) * 100)) %>%
  mutate(across(where(is.numeric), round, 2)) %>%
  ungroup()
percentage_table

ride_counts <- SQL_bike %>%
  group_by(membership_type, day_of_week) %>%
  summarise(ride_count = n()) %>%
  ungroup()
ride_counts_wide <- ride_counts %>%
  pivot_wider(names_from = membership_type, values_from = ride_count, values_fill = list(ride_count = 0))
ride_counts_wide


