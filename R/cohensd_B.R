cohensd_B <- function(num0,num1,num2,bef,aft1,aft2,stdev0,stdev1,stdev2) {
  if((num1+num2) == 1){
    # simulating before
    before <- rnorm(num0, bef, stdev0)
    # simulating after
    after1 <- rnorm(num0*num1, aft1, stdev1)
    after2 <- runif(num0*num2, aft2, stdev2)
    after <- c(after1, after2)

    # denominator of the equation to get SD pooled
    SDpooled <- sqrt(((sd(before)^2)+(sd(after)^2))/2)

    # calculating cohen's d
    cohend <- (mean(after)-mean(before))/SDpooled

    # Effect size/returning cohen's d
    return(cohend)
  } else {
    x = "Num1 and Num2 must sum to 100% or 1.00."
    print(x)
  }
}
