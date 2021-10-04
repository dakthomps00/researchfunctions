cohensd <- function(num,bef,dif,stdev) {
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
