context("Check die arguments")

test_that("check_sides with ok vectors", {
  expect_true(check_sides(c('i', 'ii', 'iii', 'iv', 'v', 'vi')))
  expect_true(check_sides(1:6))
  })


test_that("check_sides fails with invalid lengths", {

  expect_error(check_sides(c('a', 'b', 'c', 'd', 'e')))
  expect_error(check_sides(c('i', 'ii', 'iii')))
  expect_error(check_sides(1:5))
  expect_error(check_sides(1))
})


test_that("check_sides fails with invalid types", {

  expect_error(check_sides(c('one', 'two', 'three')))
  expect_error(check_sides(c('one')),
               "\n'sides' must be of length 6")
})


test_that("check_prob works with ok vectors", {

  expect_true(check_prob(c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35)))
  expect_true(check_prob(rep(1/6, 6)))
  expect_true(check_prob(c(0.1, 0.2, 0.3, 0.4, 0, 0)))
})


test_that("check_prob fails with invalid lengths", {

  expect_error(check_prob(1:5))
  expect_error(check_prob(1))
})


test_that("check_prob fails with invalid numbers", {

  expect_error(check_prob(0.333, 0.666, 0, 0, 0, 0))
  expect_error(check_prob(-0.5, 0.5, -0.1, 0, 0, 0))
  expect_error(check_prob(0.5, -0.5, 0.1, 2, 3, 4))
  expect_error(check_prob(0.5, NA, NA, NA, NA, NA))
})
