---
title: Shot Charts
author: Julie Song
description: creating shot charts using ggplot and exporting using ggsave
inputs: 
    - jpg file: "nba-court.jpg"
    - csv file: "shots-data.csv"
outputs: 
    - pdf file: "andre-iguodala-shot-chart.pdf", "draymond-green-shot-chart.pdf", 
                "kevin-durant-shot-chart.pdf", "klay-thompson-shot-chart.pdf", 
                "stephen-curry-shot-chart.pdf", "gsw-shot-charts.pdf"
---

##4. Shot Charts (20pts)
  
###4.1 Shot charts of each player (10pts)

#court image: 
library(ggplot2)
library(jpeg)
library(grid)
court_file = "../hw02/images/nba-court.jpg"
court_image = rasterGrob(
  readJPEG(court_file), 
  width = unit(1, "npc"), 
  height = unit(1, "npc")
)

# codes from make-shots-data-script needed for charts: 
andre = read.csv("../hw02/data/andre-iguodala.csv", stringsAsFactors = FALSE)
draymond = read.csv("../hw02/data/draymond-green.csv", stringsAsFactors = FALSE)
kevin = read.csv("../hw02/data/kevin-durant.csv", stringsAsFactors = FALSE)
klay = read.csv("../hw02/data/klay-thompson.csv", stringsAsFactors = FALSE)
stephen = read.csv("../hw02/data/stephen-curry.csv", stringsAsFactors = FALSE)

# shot charts for Andre Iguodala: 

ggplot(data = andre) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') + 
  theme_minimal()

ggsave(filename = "../hw02/images/andre-iguodala-shot-chart.pdf", 
       width = 6.5, height = 5, units = "in")


# shot charts for Draymond Green: 

ggplot(data = draymond) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Draymond Green (2016 season)') + 
  theme_minimal()

ggsave(filename = "../hw02/images/draymond-green-shot-chart.pdf", 
       width = 6.5, height = 5, units = "in")


# shot charts for Kevin Durant: 

ggplot(data = kevin) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Kevin Durant (2016 season)') + 
  theme_minimal()

ggsave(filename = "../hw02/images/kevin-durant-shot-chart.pdf", 
       width = 6.5, height = 5, units = "in")


# shot charts for Klay Thompson: 

ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

ggsave(filename = "../hw02/images/klay-thompson-shot-chart.pdf", 
       width = 6.5, height = 5, units = "in")

# shot charts for Stephen Curry: 

ggplot(data = stephen) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Stephen Curry (2016 season)') + 
  theme_minimal()

ggsave(filename = "../hw02/images/stephen-curry-shot-chart.pdf", 
       width = 6.5, height = 5, units = "in")

---------
  
### 4.2 Facetted Shot Chart (10pts)
shots_data = read.csv("../hw02/data/shots-data.csv")

ggplot(data = shots_data) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Charts: GSW (2016 season)') + 
  theme_minimal() + 
  theme(legend.position="none") +
  facet_wrap(~ name)

ggsave(filename = "../hw02/images/gsw-shot-charts.pdf", 
       width = 8, height = 7, units = "in")
