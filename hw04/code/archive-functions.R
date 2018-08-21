#title: archive-functions.R
#author: Julie Song
#description: write functions for: read_archive(), clean_archive(), plot_archive()
#input: CRAN R Project archives for packages
#output: 
    # ggplot2.csv
    # xml.csv
    #knitr.csv
    #dplyr.csv

#==========================

#1.1 Read Archive Data Table

#'@title read_archive('stringr')
#'@description reads HTML table with archive data for a package
#'@param x name of a package
#'@return data frame 

read_archive <- function(x) {
  library(XML)
  old <- 'http://cran.r-project.org/src/contrib/Archive/stringr'
  new <- str_replace(old, pattern = 'stringr', replacement = x)
  read <- readHTMLTable(new)
  return(read)
}

#test
raw_data <- read_archive('stringr')
raw_data

#======================

#1.2 Data Cleaning

#'@title clean_archive()
#'@description creates a table with four columns using output from read_archive()
#'@param x output of read_archive(), which is a list
#'@return data frame or tibble with four columns: name, version, date, and size

clean_archive <- function(x) {

  raw_into_table <- as.data.frame(x)
  into_table <- na.omit(raw_into_table[-2, ])
  
  raw_name <- str_replace(
    str_extract(into_table[,2], pattern = '\\w+'), 
    pattern = "\\_+[0-9]", 
    replacement = '')
  
  raw_version <- str_replace(
    str_sub(into_table[,2], end = -8), 
    pattern = '[a-z]+\\_', 
    replacement = "")
  
  raw_date <- as.Date(into_table[,3])
  
  raw_size <- rep(0)
  raw_mb <- str_detect(into_table[,4], pattern = 'M')
  kb_size <- as.numeric(str_sub(into_table[,4], end = -2))
 
  for (i in 1:length(kb_size)) {
   if(raw_mb[i] == FALSE) {
    raw_size[i] <- kb_size[i]
  } else {
    raw_size[i] <- kb_size[i] * 1000
  }
  }
  
  clean_table <- data.frame(name = raw_name, version = raw_version, 
                            date = raw_date, size = raw_size)
  return(clean_table)
}

#test
raw_data <- read_archive('stringr')
clean_data <- clean_archive(raw_data)
clean_data


#export table as csv file: 
raw_data <- read_archive('stringr')
clean_data <- clean_archive(raw_data)
write.csv(clean_data, file = '../data/stringr-archive.csv')

#======================== 

#1.3 Timeline Plot

#'@title plot_archive()
#'@description creates visual timeline with version sizes of a package
#'@param x clean archive table in form of data frame or tibble
#'@return produces a step line chart

plot_archive <- function(x) {
library(ggplot2)
ggplot(x, aes(x = date, y = size, color = '#4286f4')) +
  geom_point() + 
  geom_step() + 
  theme_minimal() + 
  labs(x = 'date', y = 'Size (Kilobytes)', title = 'stringr: timeline of version sizes') + 
  theme(legend.position="none")
}

#test
plot_archive(clean_data)






