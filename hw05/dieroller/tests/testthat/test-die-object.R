context("Check object 'die'")

test_that("'die' returns a list", {
  expect_type(die(), 'list')
})

test_that("'die' returns an object 'die'", {
  expect_s3_class(die(sides = 1:6), 'die')
})

test_that("'die' failes with invalid length of sides", {
  expect_error(die(sides = 1:5))
  expect_error(die(sides = 1:10, prop = rep(1/6, 6)))
  expect_error(die(sides = c('a', 'b', 'c', 'd', 'e')))
})

test_that("'die' failes with invalid prop", {
  expect_error(die(sides = 1:6, prop = rep(1/6, 6)))
  expect_error(die(sides = 1:6, prop = c(0.2, 0.1, 0.3, 0.4, 0, 0)))
  expect_error(die(sides = 1:6, prop = c(-0.1, 0.1, 0.2, 0.2, 0.6)))
})
