context("Check object 'roll'")

test_that("'roll' returns a list", {
  expect_type(roll(die(), times = 50), 'list')
})

test_that("'roll' returns an object 'roll'", {
  expect_s3_class(roll(die(), times = 50), 'roll')
})

test_that("'roll' has 'rolls', 'sides', 'prob', 'total'", {
  expect_named(roll(die(), times = 50), c('rolls', 'sides', 'prob', 'total'))
})

test_that("subset of 'roll' returns integer/numeric values", {
  expect_type(roll(die(), times = 50)$rolls, 'integer')
  expect_type(roll(die(), times = 50)$sides, 'integer')
  expect_type(roll(die(), times = 50)$prob, 'double')
  expect_type(roll(die(), times = 50)$total, 'double')
})

test_that("subset of 'roll' returns expected length", {
  expect_length(roll(die(), times = 50)$rolls, 50)
  expect_length(roll(die(), times = 50)$sides, 6)
  expect_length(roll(die(), times = 50)$prob, 6)
  expect_length(roll(die(), times = 50)$total, 1)
})


