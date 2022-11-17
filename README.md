# Google-Data-Analytics-Course-Case-Study

## Overview
This case study was one of the two capstone projects required to complete the Google Data Analysis Course.
I was tasked with analysing bike riding data for a period of 12 months ( April 2020 - March 2021) in a bid to understand the riding behaviour of both members and casual riders for a hypothetical company - Cyclistic.

## Business Task
The business task was to maximize the number of annual membership by suggesting the best marketing strategy to deploy to convert casual members.

## Data Source
The [data](https://divvy-tripdata.s3.amazonaws.com/index.html) was provided by Motivate International Inc. in csv format, under this [license](https://ride.divvybikes.com/data-license-agreement)

## Tools Used
1. Excel
2. SQL (Microsoft SQL Server)

## Process
- Opened all 12 months of data on excel and tested for duplicates. Found none.
- Overall, data seemingly in good shape(clean); strings in proper case, trimmed from both ends, no misspellings, and no inappropriate punctuation. But double checked by appropriately validating data in each column to maintain data integrity.
- I got the column ***day_of_week*** for each data point across the 12-month data by using the excel function ***WEEKDAY()*** in excel
- Also got column ***ride_length*** for each data point by finding the difference between the time they started their ride and the time they ended it
- Some results came back negative in the ***ride_length*** column. Deleted these negative data points because it would have affected my calculations. Also, there was even distribution between the both member and casual in the deleted data so no one side is disproportionately affected. Same can be said for the start and end stations. Moreover, deleted data = 51, out of 84,776 in April 2020. My assumption here is that the geotracking sensor malfunctioned during this time (so malfunctioned 0.06% of the time). Can't know for sure till we ask the company for performance data. This trend continued through the 12-month period, with the geotracker tech malfunctioning 0.06% - 0.44% of the time. 
- Got the average ride length for both member and casual riders using the ***AVERAGEIF()*** function.
- Transferred the data to SQL for further analysis. Note, some of the analysis performed in SQL could be equally performed using pivot tables in excel. But I chose SQL to demonstrate prowess. Plus, SQL provided more exploratory options. 
- I noticed data inconsistency from the December 2020 data; the station IDs were corrupted and inconsistent with those of the previous 8 months i.e Apr2020 - Nov2020. Station IDs followed a different convention. Instead of the number-based system to depict station ids (i.e from 1 - 637, hence six hundred and thirty seven stations), I noticed it followed several alpha-numeric conventions e.g TA1306000013, SL-011, E011 etc. This could mean the company decided to use a diverse option of geotracker models, and they registered stations according to their unique conventions. I first used ***SELECT DISTINCT*** on SQL to return distinct station names  with their corresponding IDs in the Nov2020 dataset. Imported the result to an excel sheet and used ***VLOOKUP()*** across two sheets to ensure the station _ids remained consistent in the december 2020 dataset. Did this for subsequent months as they contained inconsistent data wrt station name and ids.
- Explore the data in SQL to discover trends and patterns. SQL script provided amongst project files.

## Findings
1. Casual riders were more active on saturdays and sundays than any other day.

![Casual rider preference wrt day of the week](https://user-images.githubusercontent.com/118135226/201784677-1363dc79-b579-4253-9ad2-b52fb7beadc4.png)

2. Since electric and classic bikes were introduced in Sept 2020 and Dec 2020 respectively, interest in these bikes grew significantly amongst casual riders. The same can be said for members too.

![bike preference for casual riders](https://user-images.githubusercontent.com/118135226/201785235-150cc6d4-06af-44de-b4ee-c15c9216b336.png)

3. Casual riders used certian bike stations the most; Streeter Dr & Grand Ave, Lake Shore Dr & Monroe St, Millenium Park, Theater on the Lake, and Michigan Ave & Oak St.

4. On average, Casual riders rode approximately 3x longer than members, even though there were more member rides than casual rides in total.

## Recommendations
1. I suggest the company roll out a weekend plan as part of their offerings, since the majority of casual rides are on saturdays and sundays.
2. The company should add more electric and classic bikes to the program to further entice casual riders and retain their members.
3. The best places to deploy marketing strategy (e.g advertising the weeked plan suggested) would be the top 5 stations casual riders frequenct - Streeter Dr & Grand Ave, Lake Shore Dr & Monroe St, Millenium Park, Theater on the Lake and Michigan Ave & Oak St.
