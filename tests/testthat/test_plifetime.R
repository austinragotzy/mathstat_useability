# Test for plifetime function
#
# Returns:
#    An error message if any tests fail
context("plifetime")

test_that("edge cases", {
    expect_equal(plifetime(1e45, 1e55, 1e45, 1e55), 0)
})

test_that("input", {
    expect_error(plifetime("test", 2, 1, 2),
                 "input objects must be numeric")
    expect_error(plifetime(1, "test", 1, 2),
                 "input objects must be numeric")
    expect_error(plifetime(1, 2, "test", 2),
                 "input objects must be numeric")
    expect_error(plifetime(1, 2, 1, "test"),
                 "input objects must be numeric")
    expect_error(plifetime(NaN, 2, 1, 2),
                 "input object a cannot be an NA")
    expect_error(plifetime(1, NA, 1, 2),
                 "input object b cannot be an NA")
    expect_error(plifetime(1, 2, NaN, 3),
                 "input object c cannot be an NA")
    expect_error(plifetime(1, 2, 1, NA),
                 "input object d cannot be an NA")

})

test_that("output", {
    expect_equal(round(plifetime(1, 2, 1, 2), 5), 0.12219)
    expect_equal(plifetime(sqrt(2)/2, sqrt(2)/2, Inf, Inf), 0)
    expect_equal(length(plifetime(1, 2, 1, 2)), 1)
    expect_equal(is.numeric(plifetime(1, 2, 1, 2)), TRUE)
    expect_equal(is.vector(plifetime(1, 2, 1, 2)), TRUE)
})


