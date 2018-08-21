#title: regex-functions.R
#author: Julie Song
#description: write functions for: split_chars(), num_vowels(), count_vowels(), reverse_chars(), and reverse_words()
#inputs: none
#outputs: functions listed above that will be imported in hw04-julie-song.Rmd

#======================

#2 Regex functions

#2.1 Splitting Characters

#'@title split_chars()
#'@description takes character string and splits the content into one single character elements
#'@param x character string
#'@return splitted single character elements

split_chars <- function(x) {
  splitted <- rep(0)
  for (i in 1:nchar(x)) {
    splitted[i] <- str_sub(x, start = i, end = i)
  }
  return(splitted)
}

#tests 
split_chars('Go Bears!')
split_chars('Expecto Patronum')

#======================

#2.2 Number of Vowels 
#ASKKKK HOW DO I TURN IT INTO A CHARACTER VECTOR?

#'@title num_vowels()
#'@description returns number of vowels in a character vector
#'@input vector in which each element is a single integer
#'@return number of vowels in a character vector

num_vowels <- function(x) {
    a <- sum(grepl('a', x, ignore.case = TRUE))
    e <- sum(grepl('e', x, ignore.case = TRUE))
    i <- sum(grepl('i', x, ignore.case = TRUE))
    o <- sum(grepl('o', x, ignore.case = TRUE))
    u <- sum(grepl('u', x, ignore.case = TRUE))
    vowels <- cbind(a, e, i, o, u)
    return(vowels)
  }

#tests
vec<- c('G', 'o', ' ', 'B', 'e', 'a', 'r', 's', '!')
num_vowels(vec)

#======================

#2.3 Counting Vowels

#'@title count_vowels()
#'@description computes number of vowels of a character string
#'@param x character string
#'@output frequency table that counts voewls in both lower and upper case letters

count_vowels <- function(x) {
  splitted <- split_chars(x)
  vowels <- num_vowels(splitted)
  return(vowels)
}

#tests
count_vowels("The quick brown fox jumps over the lazy dog")

count_vowels("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG")

#======================

#2.4 Reversing Characters

#'@title reverse_chars()
#'@description reverses a string by characters
#'@param x character vector
#'@return character vector with reversed characters
reverse_chars <- function(x) {
  reversed <- rev(split_chars(x))
  return(paste(reversed, collapse = ""))
}

#tests
reverse_chars("gattaca")
reverse_chars("Lumox Maxima")

#======================

#2.5 Reversing Sentences by Wordds
#'@title reverse_words()
#'@description reverses a string by words
#'@param x character string
#'@return character vector with reversed words

reverse_words <- function(x) {
  reversed <- rev(unlist(str_split(x, ' ')))
  return(paste(reversed, collapse = " "))
}

#tests
reverse_words('sentence! this reverse')
reverse_words('string')


