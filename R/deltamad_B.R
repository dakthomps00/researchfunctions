#' Generate a delta MAD for one randomly distributed data set against a normal data set contaminated with a uniform distribution data set
#'
#' Generates a delta MAD effect size for one randomly distributed data set against a normal data set contaminated with a uniform distribution data set with defined characteristics (number of subjects, percent of subjects with x mean and y standard deviation, percent of subjects with z mean and a standard deviation, mean of the first data set, x mean, z mean, standard deviation of the second data set, y standard deviation, and a standard deviation)
#'
#' @param num0 number of subjects
#' @param num1 percent/decimal of subjects for the first group
#' @param num2 percent/decimal of subjects for the second group
#' @param bef mean of the original group
#' @param aft1 mean for the first group
#' @param mini minimum for the second group
#' @param stdev0 standard deviation of the original group
#' @param stdev1 standard deviation for the first group
#' @param maxi maximum for the second group
#'
#' @return Cohen's d
#' @importFrom stats rnorm sd runif
#' @export
#'
#' @examples
#' deltamad_B(75,0.8,0.2,0,1,0.5,1,1,2)
deltamad_B <- function(num0,num1,num2,bef,aft1,mini,stdev0,stdev1,maxi) {
  if((num1+num2) == 1){
    if(maxi > mini){
      # simulating before
      before <- rnorm(num0, bef, stdev0)
      # simulating after
      after1 <- rnorm(num0*num1, aft1, stdev1)
      after2 <- runif(num0*num2, mini, maxi)
      after <- c(after1, after2)

      # denominator of the equation to get MAD pooled
      MADpool <- (((num0-1)*mad(after))+((num0-1)*mad(before)))/((num0+num0)-2)

      # calculating delta MAD
      deltaMAD <- (abs((median(after))-(median(before)))/MADpool)

      # Effect size/returning MAD
      return(deltaMAD)
    } else {
      x = "Mini must be smaller than maxi."
      print(x)
    }
  } else {
    x = "Num1 and Num2 must sum to 100% or 1.00."
    print(x)
  }
}
