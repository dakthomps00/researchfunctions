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
