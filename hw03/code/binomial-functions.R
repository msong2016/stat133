

#' @title is_integer()
#' @description tests if a numeric value can be integer number
#' @param x single numeric value
#' @return TRUE if input can be integer, FALSE otherwise

is_integer <- function(x) { #ASKK
  if(x %% 1 == 0) {
    return (TRUE) 
  } else {
    return (FALSE)
  }
}
  
# TRUE's
is_integer(-1)
is_integer(0)
is_integer(2L)
is_integer(2)
# FALSE's
is_integer(2.1)
is_integer(pi)
is_integer(0.01)
  
#---------

#' @title is_positive()
#' @description tests if a numeric value is a positive number
#' @param x single numeric value
#' @return TRUE if input is positive, FALSE otherwise

is_positive <- function(x) {
  if(x > 0) {
    return (TRUE)
  } else {
    return (FALSE)
  }
}

#TRUE'S

is_positive(0.01)
is_positive(2)

# FALSE's

is_positive(-2)
is_positive(0)
  
#---------

#' @title is_nonnegative()
#' @description tests if a numeric value is a non-negative number
#' @param x single nueric value
#' @return TRUE if input is non-negative

is_nonnegative <- function(x) {
  if(x >= 0) {
    return (TRUE)
  } else {
    return (FALSE)
  }
}

# TRUE's

is_nonnegative(0)
is_nonnegative(2)

# FALSE's

is_nonnegative(-0.00001)
is_nonnegative(-2)

#----------

#' @title is_positive_integer()
#' @description tests if a numeric value can be considered to be a positive integer
#' @param x single numeric value
#' @return TRUE if input is positive integer, FALSE otherwise

is_positive_integer <- function(x) {
  if(is_positive(x) == TRUE & is_integer(x) == TRUE) {
    return (TRUE)
  } else {
    return (FALSE)
  }
}

# TRUE
is_positive_integer(2)
is_positive_integer(2L)
# FALSE
is_positive_integer(0)
is_positive_integer(-2)

#-----------
  
#' @title is_nonneg_integer()
#' @description tests if a numeric value can be considered to be a non-negative integer
#' @param x single numeric value
#' @return TRUE if input is non-negative integer, FALSE otherwise

  is_nonneg_integer <- function(x) {
    if(is_nonnegative(x) == TRUE & is_integer(x) == TRUE) {
      return (TRUE)
    } else {
      return (FALSE)
    }
  }

# TRUE's

is_nonneg_integer(0)
is_nonneg_integer(1)

# FALSE

is_nonneg_integer(-1)
is_nonneg_integer(-2.5)

#--------

#' @title is_probability()
#' @description tests if a given number p is a valid probability value
#' @param p single number
#' @return TRUE if input is valid probability, FALSE otherwise

is_probability <- function(p) {
  if (p >= 0 & p <= 1) {
    return (TRUE)
  } else {
    return (FALSE)
  }
}

# TRUE's

is_probability(0)
is_probability(0.5)
is_probability(1)

# FALSE's

is_probability(-1)
is_probability(1.0000001)

#---------

#' @title bin_factorial()
#' @description calculates factorial of nonnegative integer n
#' @param x single numeric value
#' @return factorial of a number

bin_factorial <- function(x) {
  if (x < 0 | is_integer(x) == FALSE) {
    return (FALSE)
  } else if (x == 0) {
    return (1)
  } else {
    term <- 1
    for(i in 1:x) {
      term <- term * i
    }
    return (term)
  }
}

#valid
bin_factorial(5)
bin_factorial(0)

#---------

#' @title bin_combinations()
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param n total number of trials
#' @param k number of success
#' @return number of combinations

bin_combinations <- function(n, k) {
  n_choose_k <- bin_factorial(n) / (bin_factorial(k) * bin_factorial(n - k)) 
  return (n_choose_k)
}

#tests
bin_combinations(n = 5, k = 2)
bin_combinations(10, 3)
bin_combinations(4, 4)
  
#---------

#' @title bin_probability()
#' @description calculates binomial probability
#' @param trials number of trials
#' @param success number of successes
#' @prob probability for binomial probability with n trials and k successes
#' @return binomial probability

bin_probability <- function(trials, success, prob) {
  if(is_nonneg_integer(trials) == FALSE | 
     is_nonneg_integer(success) == FALSE | 
     is_probability(prob) == FALSE) {
    stop('invalid numerical value for trials, success, or prob')
  } else {
    bin_p <- bin_combinations(trials, success) * (prob ^ success) * ((1-prob) ^ (trials - success))
    return(bin_p)
  }
}

# probability of getting 2 successes in 5 trials
# (assuming prob of success = 0.5)
bin_probability(trials = 5, success = 2, prob = 0.5)
bin_probability(6, 3, 0.7)

#---------

#' @title bin_distribution()
#' @description calculates binomial probability distribution
#' @param trials number of trials
#' @param prob probability for binomial probability with n trials and k successes
#' @return binomial probability distribution

bin_distribution <- function(trials, prob) {
  prob1 <- rep(0, trials + 1)
  for(i in 0:trials) {
    prob1[i + 1] <- bin_probability(trials, i, prob)
    df <- data.frame(success = 0:trials, probability = prob1)
  }
  return (df)
}

bin_distribution(5, 0.5)
