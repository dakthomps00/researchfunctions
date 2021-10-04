#' Generate a confidence interval for a given x
#'
#' Generates a confidence interval for a given x and number of subjects in the data sets
#'
#' @param x what to generate a confidence interval of
#' @param num number of subjects
#'
#' @return confidence interval
#' @export
#' @importFrom stats sd qt
#' @examples
#' x <- replicate(100, cohensd(75,0,1,1))
#' confidint(x,75)
confidint <- function(x,num){
  xbar = mean(x)
  xsd = sd(x)
  cilo = xbar - qt(.95, df=num-1)*(xsd/sqrt(num))
  cilo
  ciup = xbar + qt(.95, df=num-1)*(xsd/sqrt(num))
  ciup

  newList <- list("Low" = cilo, "High" = ciup)
  return(newList)
}
