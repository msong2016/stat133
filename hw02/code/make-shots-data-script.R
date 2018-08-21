---
title: HW02: make-shots-data-script
author: Julie Song
description: To create a csv data file containing required variables to be used in visualiation phase
input: 
      - csv files: "andre-iguodala.csv" , "draymond-green.csv", 
                   "kevin-durant.csv" , "klay-thompson.csv", "stephen-curry.csv"
output: 
      - txt files: "andre-iguodala-summary.txt", "kevin-durant-summary.txt",
                     "draymond-green-summary.txt", "klay-thompson-summary.txt", 
                     "stephen-curry-summary.txt"
---
  
##3) Data Preparation (20pts)
  
library(readr)

### Read in the five data sets, using relative file paths

andre = read.csv("../hw02/data/andre-iguodala.csv", stringsAsFactors = FALSE)
draymond = read.csv("../hw02/data/draymond-green.csv", stringsAsFactors = FALSE)
kevin = read.csv("../hw02/data/kevin-durant.csv", stringsAsFactors = FALSE)
klay = read.csv("../hw02/data/klay-thompson.csv", stringsAsFactors = FALSE)
stephen = read.csv("../hw02/data/stephen-curry.csv", stringsAsFactors = FALSE)

### Add a column name to each imported data frame

andre$name = rep('Andre Iguodala')
draymond$name = rep('Draymond Green')
kevin$name = rep('Kevin Durant')
klay$name = rep('Klay Thompson')
stephen$name = rep('Stephen Curry')

### Change the original values of shot_made_flag to more descriptive values ASKK

andre$shot_made_flag[andre$shot_made_flag == 'n'] <- "missed shot"
andre$shot_made_flag[andre$shot_made_flag == 'y'] <- "made shot"

draymond$shot_made_flag[draymond$shot_made_flag == 'n'] <- "missed shot"
draymond$shot_made_flag[draymond$shot_made_flag == 'y'] <- "made shot"

kevin$shot_made_flag[kevin$shot_made_flag == 'n'] <- "missed shot"
kevin$shot_made_flag[kevin$shot_made_flag == 'y'] <- "made shot"

klay$shot_made_flag[klay$shot_made_flag == 'n'] <- "missed shot"
klay$shot_made_flag[klay$shot_made_flag == 'y'] <- "made shot"

stephen$shot_made_flag[stephen$shot_made_flag == 'n'] <- "missed shot"
stephen$shot_made_flag[stephen$shot_made_flag == 'y'] <- "made shot"

### Add a column "minute" that contains minute number where a shot occured
  ### period = 12 minutes

andre$minute = (andre$period * 12) - andre$minutes_remaining
draymond$minute = (draymond$period * 12) - draymond$minutes_remaining
kevin$minute = (kevin$period * 12) - kevin$minutes_remaining
klay$minute = (klay$period * 12) - klay$minutes_remaining
stephen$minute = (stephen$period * 12) - stephen$minutes_remaining

### Use sink() to send summary() output of each imported data frame into dinviduals text files
sink(file = "../hw02/output/andre-iguodala-summary.txt")
summary(andre)
sink()

sink(file = "../hw02/output/kevin-durant-summary.txt")
summary(kevin)
sink()

sink(file = "../hw02/output/draymond-green-summary.txt")
summary(draymond)
sink()

sink(file = "../hw02/output/klay-thompson-summary.txt")
summary(klay)
sink()

sink(file = "../hw02/output/stephen-curry-summary.txt")
summary(stephen)
sink()

### Using row binding function rbind() to stack tables:

shots_data = rbind(andre, draymond, kevin, klay, stephen)

### Export assembled table as CSV file: 

write_csv(shots_data, "../hw02/data/shots-data.csv")

### Use sink() to send summary() output of table: 

sink(file = "../hw02/output/shots-data-summary.txt")
summary(shots_data)
sink()
