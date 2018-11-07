#' @title Probability of Log Distribution
#' @description Computes CDF of X given the following:
#' X is a continuous random variable with PDF f(x) = e^x / (1+5e^x)^1.2 for -inf < x < inf.
#' X has the support space (-inf, inf).
#' The PDF of X is a member of the logF-family of diustributions which is often used in the
#' modeling of the log of lifetime data.
#' See Example 1.7.3 on page 52 of the book.
#' @param x Real number where -inf < x < inf.
#' CDF of X is F(x) = 1 - (1+5e^(-x))^(-0.1), -inf < x < inf.
#<<<<<<< HEAD
#' In R, these limits determined by data limitations. Thus we
#' get the following piecewise function,
#' ```
#' plogF(x) = (1 - (1 + 5 * exp(x))^(-0.2))
#' ```
#=======
#>>>>>>> 7bd5e239a5f7b73a8afcd756862419e3e69601d1
#' @return CDF of X.
#' @references Hogg, R. McKean, J. Craig, A (2018) Introduction to Mathematical Statistics, 8th Ed. Boston: Pearson
#' @examples
#' cdf <- plogF(1)
#' cdf <- plogF(-1)
#' cdf <- plogF(3.14159)
#' # cdf <- plogF(real_number_variable_within_specified_limits)

#' @export plogF
#'
# EXAMPLE PROBLEM FOR USABILITY TEST
# Suppose X is a random variable with PDF (1.7.9).
# Find the prob that X is less than `1.5.
# Find the prob that x is between 1.5 and 2.0.

plogF <- function(x){
#<<<<<<< HEAD
	# McKean is looking into this change mentioned below. WAIT FOR CORRECTION
	cdf <- (1 - (1 + 5 * exp(x))^(-0.2)) # changed from exp(x) to exp(-x) to follow book. CONFIRM CHANGE
#=======
	cdf <- (1 - (1 + 5 * exp(x))^(-0.2))
#>>>>>>> 7bd5e239a5f7b73a8afcd756862419e3e69601d1
	return(cdf)
}

