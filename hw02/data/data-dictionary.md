#===========================================

## Data Dictionary

#### Author: Julie Song

#### Date: March 9th, 2018

#============================================

### 1. Description of the Data

It is composed of five data files in terms of csv file and each file was designated to each of the 5 players in Golden State Warriors: Andre Iguodala, Draymond Green, Kevin Durant, Klay Thompson, and Stephen Curry. Most variables, are self-descriptive, but this is the description for variables specific to basketball terminology that might not be so obvious to others: 

* **period:** refers to the first period (the first 12 mins of the game)
* **minutes_remaining and seconds_remaining:** amount of time in minutes and seconds, respectively, that remained to be played in a given period
* **shot_made_flag:** indicates whether a shot was made (y) or missed (n)
* **action_type:** basketball moves used by players, either to pass by defenders to gain access to the basket, or to get a clean pass to a teammate to score a two pointer or three pointer
* **shot_type:** indicates whether a shot is a 2-point field goal, or a 3-point field goal
* **shot_distance:** distance to the basket (measured in feet).
* **x and y:** refer to the court coordinates (measured in inches) where a shot occurred

### 2. Information of the Source:

* Data from NBA
    
### 3: Description of the Variables

| Variable Names | Measurements Unit | Class of Variable | Data Types | 
|----------------|-------------------|-------------------|------------|
| team_name      |         N/A       |   qualitative     |  factor    | 
| game_date      |         N/A       |    quantitative   |  factor    | 
| season         |         year      |   quantitative    |  integer   |
| period         | first 12 minutes  |   quantitative    |  integer   |
| minutes_remaining |   minutes      |   quantitative    |  integer   |
| seconds_remaining |  seconds       |   quantitative    |  integer   |
| shot_made_flag |         N/A       |   qualitative     |  factor    |
| action_type    |         N/A       |   qualitative     |  factor    |
| shot_type      |        N/A        |   qualitative     |  factor    |
| shot_distance  |       feet        |   quantitative    |  integer   |
| opponent       |       N/A         |   qualitative     |  factor    |
| x              |       inches      |   quantitative    |  integer   | 
| y              |       inches      |   quantitative    |  integer   | 


### 4. Codfication & Missing Values: 

**Some codifications:**

1. team_name: Factor w/ 1 level "Golden State Warriors": 1 1 1 1 1 1 1 1 1 2. game_date: Factor w/ 71 levels "1/16/17","1/18/17",..: 64 26 12 26 11 59 3 44 55 46 ...
3. season: int  2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 ...
4. period: int  3 2 2 2 4 3 4 4 2 2 ...
5. minutes_remaining: int  2 10 0 11 0 5 7 9 0 0 ...
6. seconds_remaining: int  35 51 6 10 32 30 57 31 23 2 ...
7. shot_made_flag: Factor w/ 2 levels "made shot","missed shot": 2 2 1 2 1 1 1 1 1 1 ...
8.action_type: Factor w/ 46 levels "Alley Oop Dunk Shot",..: 1 1 1 2 3 3 3 3 3 3 ...
9. shot_type: Factor w/ 2 levels "2PT Field Goal",..: 1 1 1 1 1 1 1 1 1 1 ...
10. shot_distance: int  0 1 0 1 0 0 0 0 0 0 ...
11. opponent: Factor w/ 28 levels "Atlanta Hawks",..: 24 19 25 19 24 20 8 12 28 4 ...
12. x: int  0 -12 0 -1 0 0 0 0 0 0 ...
13. y: int  1 13 1 11 1 1 1 1 1 1 ...

**Missing Values:**

* none
