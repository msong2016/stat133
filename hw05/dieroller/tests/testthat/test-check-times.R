context("Check roll arguments")

test_that("length of check_times is 1", {
  expect_true(check_times(50))
  expect_error(check_times(c(50, 50)))
})

test_that("check_times works with valid numeric value", {
  expect_true(check_times(7777777))
  expect_true(check_times(50))
})

test_that("check_times fails with non-numeric value", {
  expect_error(check_times("a"))
  expect_error(check_times(NA))
  expect_error(check_times(TRUE))
})

test_that("check_times works with valid value", {
  expect_true(check_times(100))
  expect_true(check_times(1))
  expect_true(check_times(100/10))
})

test_that("check_times fails with invalid value", {
  expect_error(check_times(-100))
  expect_error(check_times(100.5))
  expect_error(check_times(-0.7))
})
