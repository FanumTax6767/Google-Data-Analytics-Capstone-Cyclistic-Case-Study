library(readr)

list_of_files <- list.files(path = "/Users/liammitchell/Desktop/Divvy Data from 2024-06 ~ 2023-07",
                            recursive = TRUE,
                            pattern = "\\.csv$",
                            full.names = TRUE)

Divvy_Bike_Data <- readr::read_csv(list_of_files)
New_Divvy_Bike_Data2 = subset(Divvy_Bike_Data, select = -c(start_lat,start_lng,end_lat,end_lng,start_station_id,end_station_name,end_station_id,start_station_name) )
write.csv(New_Divvy_Bike_Data2,"/Users/liammitchell/Desktop/Divvy Data from 2024-06 ~ 2023-07/New_Divvy_Bike_Data2.csv", row.names = FALSE)