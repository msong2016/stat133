
#' @title Plot of object roll
#' @description Plots the relative frequencies of a series of roll
#' @param x an object of class \code{"roll"}
#' @param times a nuemeric value that specifies number of rolls
#' @export
#' @examples
#'  \dontrun{
#'  # create a fair_die and toss it 50 times
#'  fair_die <- die()
#'  fair_50rolls <- roll(fair_die, times = 50)

#'  plot(fair_50rolls)
#'
#'  # plot method
#'  plot(fair500, 500)
#'  }

plot.roll <- function(x, times = 50) {
  count <- table(x[[1]]) / sum(table(x[[1]]))
  library(stringr)
  title <- str_replace('Frequencies in a series of 50 die rolls',
                       pattern = "50",
                       replacement = as.character(times))
  barplot(count,
          main = title,
          xlab = 'sides of die',
          ylab = 'relative frequencies',
          border = NA)
  invisible(x)
}




