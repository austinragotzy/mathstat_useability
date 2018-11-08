#' @title Probability of Battery Lifetime
#'
#' @description Let X & Y be the survival times of two batteries. This functions
#' calculates the probability that (\emph{X, Y}) falls within the rectangle which
#' represents the distribution of battery lifetime.The modes of the survival time
#' are (x, y) = (sqrt(2)/2, sqrt(2)/2). X and Y denote the lifetimes of the batteries
#' of the component in standard units.
#'
#' @param a a continuous vertical line which intersects with lines 'c' and 'd'
#' @param b a continuous vertical line which intersects with lines 'c' and 'd'
#' @param c a continuous horizontal line which intersects with lines 'a' and 'b'
#' @param d a continuous horizontal line which intersects with lines 'a' and 'b'
#'
#' @details Below is the function's pdf:
#' ```
#' pdf(x,y) = \{ 4xye^-(x^2 + y^2), when x > 0, y > 0
#'            \{ 0                  otherwise
#' ```
#' This function is used to solve Exercise 2.1.6 on page 98 of the book.
#'
#' @return The probability that (\emph{X, Y}) falls within the rectangle, which is
#' created at the intersections of the the lines 'a', 'b', 'c', and 'd'.
#'
#' @references Hogg, R., McKean, J., Craig, A. (2018) Introduction to Mathematical
#'             Statistics, 8th Ed. Boston: Pearson.
#'
#' @examples
#' a <- 2
#' b <- 3
#' c <- 2
#' d <- 3
#'
#' plifetime(a, b, c, d)
#'
#' # Probability of (X, Y) surviving beyond the mode lifetime of the batteries
#' a <- 1
#' b <- 2
#' c <- Inf
#' d <- Inf
#'
#' plifetime(a, b, c, d)
#'
#' @export plifetime

plifetime <- function(a, b, c, d) {

    # Storing input parameters in a tempory object for validation
    quickcheck <- as.list(c(a = a, b = b, c = c, d = d))

    for (i in 1:length(quickcheck)) {

        # Error handling non-numeric input
        if (!is.numeric(quickcheck[[i]])) {
            stop(gettext("input objects must be numeric"))
        }
        # Error handling inputted NA values
        else if (is.na(quickcheck[[i]])) {
            stop(gettext(paste("input object", names(quickcheck[i]), "cannot be an NA")))
        }
        else {
            next
        }
    }

    (exp(-a^2) - exp(-b^2)) * (exp(-c^2) - exp(-d^2))
}

