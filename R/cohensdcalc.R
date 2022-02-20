#' Generate a Cohen's d for two data sets
#'
#' Generates a Cohen's d effect size for two data sets
#'
#' @param before data set of the before group
#' @param after data set of the after group
#'
#' @return Cohen's d
#' @export
#' @importFrom stats rnorm sd
#' @examples
#' cohensd(beforegroup,aftergroup)
cohensdcalc <- function(before,after) {

  # denominator of the equation to get SD pooled
  SDpooled <- sqrt(((sd(before)^2)+(sd(after)^2))/2)

  # calculating cohen's d
  cohend <- (mean(after)-mean(before))/SDpooled

  # Effect size/returning cohen's d
  return(cohend)

}

