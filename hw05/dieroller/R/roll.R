#' @title Roll a die
#' @description Creates an object of class \code{"roll"}
#' @param die object of class \code{"die"}
#' @param times number of rolls
#' @return an object of class \code{"roll"} with the following elements:
#' @return \item{roll}{vector of a die roll}
#' @return \item{sides}{vector of coin \code{"sides"}}
#' @return \item{prob}{vector of coin \code{"prob"}}
#' @return \item{total}{total number of tosses}
#' @export
#' @examples
#' fair_die <- die()
#'
#' #roll fair die 50 times
#' fair50 <- roll(fair_die, times = 50)
#'
#' str_die <- die(sides = c('a', 'b', 'c', 'd', 'e', 'f'), prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))
#'
#' #roll 20 times
#' str_rolls <- roll(str_die, times = 20)


roll <- function(die = die(), times = 1) {
  check_times(times)
  die_rolls <- sample(die$sides, size = times, replace = TRUE, prob = die$prob)

  in_list <- list(rolls = die_rolls,
                  sides = die$sides,
                  prob = die$prob,
                  total = times)
  attr(in_list, "sides") <- "sides"
  attr(in_list, "prob") <- "prob"
  attr(in_list, "total") <- "total"
  class(in_list) <- 'roll'
  in_list
}

# private function to check vector of 'times'
check_times <- function(times) {
  if (length(times) != 1 | !is.numeric(times)) {
    stop("\n'times' must be a numeric vector of length 1")
  }
  if (times < 0 | times %% 1 != 0) {
    stop("\n'prob' values must be between 0 and 1")
  }
  TRUE
}


#' @title Make Roll Object
#' @description Constructor function for object "roll"
#' @param coin object of class die
#' @param flips object of class roll
#' @keywords internal
make_roll <- function(die, roll) {
  res <- list(
    sides = die,
    rolls = roll,
    total = length(roll),
    prob = as.vector(table(roll)) / sum(as.vector(table(roll))))
  class(res) <- "roll"
  res
}

#' @export
print.roll <- function(x, ...) {
  cat('object "roll"\n')
  in_list <- list(rolls = x$rolls,
                  sides = x$sides,
                  prob = x$prob,
                  total = x$total)
  print(in_list[1])
  invisible(x)
}


#' @export
summary.roll <- function(x, ...) {
  sides <- x$sides
  count <- as.vector(table(x$rolls))
  prob <- count / sum(count)
  freq <- list(freqs = data.frame(sides, count, prob))
  class(freq) <- 'summary.roll'
  freq
}


#' @export
print.summary.roll <- function(x, ...) {
  cat('summary "roll"\n\n')
  print(data.frame(side = x$freq$sides, count = x$freq$count, prob = x$freq$prob))
  invisible(x)
}


#' @export
"[<-.roll" <- function(x, i, value) {
  if (value != x$sides[1] &
      value != x$sides[2] &
      value != x$sides[3] &
      value != x$sides[4] &
      value != x$sides[5] &
      value != x$sides[6]) {
    stop('replacing value must be within appropriate die sides')
  }
  if (i > x$total) {
    stop("\nindex out of bounds")
  }
  x$rolls[i] <- value
  make_roll(x$sides, x$rolls)
}


#' @export
"[.roll" <- function(x, i) {
  x$roll[i]
}


#' @export
"+.roll" <- function(obj, incr) {
  if (length(incr) != 1 | incr <= 0) {
    stop("\ninvalid increament (must be positive)")
  }
  more_roll <- roll(obj, times = incr)
  make_roll(obj$sides, c(obj$rolls, more_roll$rolls))
}

