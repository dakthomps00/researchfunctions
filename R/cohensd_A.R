#' Generate a Cohen's d for one randomly distributed data set against a normal data set contaminated with another normal data set
#'
#' Generates a Cohen's d effect size for one randomly distributed data set against a normal data set contaminated with another normal data set with defined characteristics (number of subjects, percent of subjects with x mean and y standard deviation, percent of subjects with z mean and a standard deviation, mean of the first data set, x mean, z mean, standard deviation of the second data set, y standard deviation, and a standard deviation)
#'
#' @param num0 number of subjects
#' @param num1 percent/decimal of subjects for the first group
#' @param num2 percent/decimal of subjects for the second group
#' @param bef mean of the original group
#' @param aft1 mean for the first group
#' @param aft2 mean for the second group
#' @param stdev0 standard deviation of the original group
#' @param stdev1 standard deviation for the first group
#' @param stdev2 standard deviation mean for the second group
#'
#' @return Cohen's d
#' @importFrom stats rnorm sd
#' @export
#'
#' @examples
#' cohensd_A(75,0.8,0.2,0,1,0.5,1,1,2)
cohensd_A <- function(num0,num1,num2,bef,aft1,aft2,stdev0,stdev1,stdev2) {
  if((num1+num2) == 1){
    # simulating before
    before <- rnorm(num0, bef, stdev0)
    # simulating after
    after1 <- rnorm(num0*num1, aft1, stdev1)
    after2 <- rnorm(num0*num2, aft2, stdev2)
    after <- c(after1, after2)

    meanaft <- mean(after)
    sdaft <- sd(after)

    # denominator of the equation to get SD pooled
    SDpooled <- sqrt(((sd(before)^2)+(sd(after)^2))/2)

    # calculating cohen's d
    cohend <- (mean(after)-mean(before))/SDpooled

    rtrn <- c(meanaft, sdaft, cohend)

    # Effect size/returning cohen's d
    return(rtrn)
  } else {
    x = "Num1 and Num2 must sum to 100% or 1.00."
    print(x)
  }
}
