#' Generate a Cohen's d for two random normally distributed data sets
#'
#' Generates a Cohen's d effect size for two random normally distributed data sets with defined characteristics (number of subjects, mean, difference between means, and standard deviation)
#'
#' @param num number of subjects
#' @param bef mean
#' @param dif how much to add to the mean
#' @param stdev standard deviation
#'
#' @return Cohen's d
#' @export
#' @importFrom stats rnorm sd
#' @examples
#' cohensd_OG(75,0,1,1)
cohensd_OG <- function(num,bef,dif,stdev) {
  # simulating before
  before <- rnorm(num, bef, stdev)
  # simulating after
  after <- rnorm(num, bef+dif, stdev)

  # denominator of the equation to get SD pooled
  SDpooled <- sqrt(((sd(before)^2)+(sd(after)^2))/2)

  # calculating cohen's d
  cohend <- (mean(after)-mean(before))/SDpooled

  # Effect size/returning cohen's d
  return(cohend)

}

