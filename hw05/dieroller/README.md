# HW05 README

- Author: Min Joo (Julie) Song
- Date: April 24th, 2018
- GSI: Da Xu
- Section: 111

### Files & Descriptions: 

- dieroller.Rproj: RStudio project associated with R working directories, for package "dieroller"
- devtools-dieroll.R: Rscript file that contains devtools that simply tasks to make package development for "dieroller"
- DESCRIPTION: text file that contains information about package authors, suggested packages to use, different RScript files that were used to construct the package, "dieroller"
- NAMESPACE: text file that contains all the functions that are exported using roxygen comments
- die.R: RScript file that contains codes for die()
- roll.R: RScript file that contains codes for roll()
- plot-roll.R: RScript file that contains codes for plotting roll()
- testthat.R: auxiliary RScript file
- test-check-sides-prob.R: RScript file that uses "testthat" package to test functions for check_sides and check_prop, which are auxiliary functions used to construct die()
- test-check-times.R: RScript file that uses "testthat" package to test funtion called check_times which is an auxiliary function used to construct roll()
- test-die-object.R: RScript file that uses "testthat" package to test die() 
- test-roll-object.R: RScript file that uses "testthat" package to test roll()
- files in "man" folder: contains Rd files for all functions created for this package
- introduction.Rmd: R Markdown file that contains tutorial that show users how to utilize the functions in the package


### Overview

- "dieroller" is a minimal R package that provides functions to simulate a six-sided die roll. 
- die() creates a die object (of class "die"). 
- roll() rolls a die object, producing a "roll" object.
- plot() method for a "roll" object to plot frequencies of six sides.
- summary() method for a "roll" object.

### Motivation

- This package has been developed to illustrate some of the concepts behind the creation of an R package.

### Installation

- Install the development version from GitHub via the package "devtools":

### development version from GitHub:
install.packages("devtools") 

### install "dieroller" (without vignettes)
devtools::install_github("stat133-sp18/hw-stat133-msong2016")

### install "dieroller" (with vignettes)
devtools::install_github("stat133-sp18/hw-stat133-msong2016", build_vignettes = TRUE)  
Usage  
library(dieroller)
