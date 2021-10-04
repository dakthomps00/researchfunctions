deltamad <- function(num,bef,dif,stdev) {
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
