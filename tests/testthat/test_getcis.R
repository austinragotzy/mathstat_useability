# Test for getcis function
#
# Returns:
#    An error message if any tests fail
context("getcis functionality")

n <- 10
m <- 50

set.seed(111)

mat <- matrix(rnorm(m * n), ncol = n)

# Insert test_that for edge cases

test_that("validating getcis input", {
    expect_equal(dim(getcis(mat)), c(50, 2))
    expect_error(getcis(c(2, 3, 3), cc = 0.975),
                 "input object 'mat' must be in matrix format")
    expect_error(getcis(mat, cc = 90),
                 "input object 'cc' must be between 0 and 1")
    expect_error(getcis(mat, cc = -1),
                 "input object 'cc' must be between 0 and 1")

})

test_that("validating getcis output", {
    expect_equal(getcis(mat)[1, ], c(-0.58602443, 0.07780930))
    expect_equal(length(getcis(mat, cc = 0.95)[1, ]), 2)
})


