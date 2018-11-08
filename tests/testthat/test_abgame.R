# Test spike for abgame function
#
# Returns:
#    An error message and a score of 1 for each assert that fails
context("abgame outcome")

test_that("validating abgame output", {
    expect_equal(length(abgame()), 2)
    expect_equal(is.vector(abgame()), TRUE)

})



