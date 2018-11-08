#' @title Get Confidence Intervals
#'
#' @description  Calculates t confidence intervals for m samples each of size n
#' contained in the R matrix mat which is a \emph{m x n} matrix. Each row is a
#' sample of size n. The function is discussed in Exercise 4.2.11 on page 245 of
#' HMC (2018).
#'
#' @param mat an m x n matrix
#' @param cc confidence coefficient, or the confidence level of the intervals
#'
#' @details This function is used to calculate t confidence intervals for m
#' samples each of size n contained in the R matrix mat, which is a \emph{m x n}
#' matrix. Each row is a sample of size n.
#'
#' @return (1 - alpha)100\% confidence intervals in a m x 2 matrix
#'
#' @references Hogg, R., McKean, J., Craig, A. (2018) Introduction to Mathematical
#'             Statistics, 8th Ed. Boston: Pearson.
#'
#' @examples
#' n <- 10
#' m <- 50
#' mat <- matrix(rnorm(m * n), ncol = n)
#' getcis(mat = mat, cc = 0.95)
#' getcis(mat = mat, cc = 0.90)
#'
#' @export getcis

getcis <- function(mat,
                   cc = 0.90) {

    # Error handling cc input range
    if (cc < 0 || cc > 1) {
        stop(gettext("input object 'cc' must be between 0 and 1"))
    }

    # Error handling format of input argument 'mat'
    else if (is.matrix(mat)) {

        numb <- nrow(mat)
        ci <- c()

        for(j in 1:numb) {
            ci <- rbind(ci, t.test(mat[j, ], conf.level=cc)$conf.int)
        }

    }
    else {
        stop(gettext("input object 'mat' must be in matrix format"))
    }

    return(ci)
}
