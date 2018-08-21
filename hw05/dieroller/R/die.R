#' @title Die
#' @description Creates an object of class \code{"die"}
#' @param sides vector of die sides
#' @param prob vector of a die side probabilities
#' @return an object of class \code{"die"}
#' @seealso \code{\link{roll}}
#' @examples
#' # default call: creates a standard fair die
#' fair_die <- die()
#'
#' # die with non-standard sides
#' weird_die <- die(sides = c('i', 'ii', 'iii', 'iv', 'v', 'vi'))
#'
#' # create a loaded die
#' loaded_die <- die(prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))

#' @export
die <- function(sides = 1:6, prob = rep(1/6, 6)) {
  check_sides(sides)
  check_prob(prob)
  die_table <- data.frame(sides = sides, prob = prob)
  attr(die_table, "prob") <- "prob"
  class(die_table) <- "die"
  die_table
}


# private function to check vector of sides
check_sides <- function(sides) {
  if (length(sides) != 6) {
    stop("\n'sides' must be of length 6")
  }
  TRUE
}


# private function to check vector of probabilities
check_prob <- function(prob) {
  if (length(prob) != 6 | !is.numeric(prob)) {
    stop("\n'prob' must be a numeric vector of length 6")
  }
  if (any(prob < 0) | any(prob > 1)) {
    stop("\n'prob' values must be between 0 and 1")
  }
  if (sum(prob) != 1) {
    stop("\nelements in 'prob' must add up to 1")
  }
  TRUE
}


#' @export
print.die <- function(x, ...) {
  cat('object "die"\n')
  die_table <- data.frame(sides = x$sides, prob = x$prob)
  print(die_table)
  invisible(x)
}



