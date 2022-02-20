#' Generate a delta MAD for two data sets
#'
#' Generates a delta MAD effect size for two data sets
#'
#' @param num number of subjects
#' @param before data set of the before group
#' @param after data set of the after group
#'
#' @return delta MAD
#' @export
#' @importFrom stats rnorm mad median
#' @examples
#' deltamad(numberofsubjects,beforegroup,aftergroup)
deltamadcalc <- function(num,before,after) {

  # denominator of the equation to get MAD pooled
  MADpool <- (((num-1)*mad(after))+((num-1)*mad(before)))/((num+num)-2)

  # calculating delta MAD
  deltaMAD <- (abs((median(after))-(median(before)))/MADpool)

  # Effect size/returning MAD
  return(deltaMAD)
}
