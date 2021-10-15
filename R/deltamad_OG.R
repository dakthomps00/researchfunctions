#' Generate a delta MAD for two random normally distributed data sets
#'
#' Generates a delta MAD effect size for two random normally distributed data sets with defined characteristics (number of subjects, mean, difference between means, and standard deviation)
#'
#' @param num number of subjects
#' @param bef mean
#' @param dif how much to add to the mean
#' @param stdev standard deviation
#'
#' @return Cohen's d
#' @export
#' @importFrom stats rnorm mad median
#' @examples
#' deltamad_OG(75,0,1,1)
deltamad_OG <- function(num,bef,dif,stdev) {
  # simulating before
  before <- rnorm(num, bef, stdev)
  # simulating after
  after <- rnorm(num, bef+dif, stdev)

  # denominator of the equation to get MAD pooled
  MADpool <- (((num-1)*mad(after))+((num-1)*mad(before)))/((num+num)-2)

  # calculating delta MAD
  deltaMAD <- (abs((median(after))-(median(before)))/MADpool)

  # Effect size/returning MAD
  return(deltaMAD)
}
