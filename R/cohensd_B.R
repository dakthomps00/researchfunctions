#' Generate the mean of the contaminated group, the standard deviation of the contaminated group, and Cohen's d for one randomly distributed data set against a normal data set contaminated with a uniform distribution data set
#'
#' Generates the mean of the contaminated group, the standard deviation of the contaminated group, and Cohen's d effect size for one randomly distributed data set against a normal data set contaminated with a uniform distribution data set with defined characteristics (number of subjects, percent of subjects with x mean and y standard deviation, percent of subjects with z mean and a standard deviation, mean of the first data set, x mean, z mean, standard deviation of the second data set, y standard deviation, and a standard deviation)
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
#' @return vector with mean of the contaminated group, standard deviation of the contaminated group, and Cohen's d
#' @importFrom stats rnorm sd runif
#' @export
#'
#' @examples
#' cohensd_B(75,0.8,0.2,0,1,0.5,1,1,2)
cohensd_B <- function(num0,num1,num2,bef,aft1,mini,stdev0,stdev1,maxi) {

  # makes sure that the contaminated group's percentages
  # add up to 100% because you can't have 2 groups adding
  # to say 70% or 135% of the total subjects
  if((num1+num2) == 1){

    # makes sure that the maximum of the uniform distribution is not more
    # than the min for the runif()
    if(maxi > mini){

      # simulating before
      # creates a normal distribution of user input number of subjects,
      # mean, and standard deviation
      before <- rnorm(num0, bef, stdev0)

      # simulating after/contaminated groups
      # creates a normal distribution of user input number of subjects,
      # mean, and standard deviation, as well as user input number of
      # subjects, minimum of the uniform distribution, and maximum of
      # the uniform distribution also takes into account percentage of contamination
      # (user input percentage of the first group, percentage of the second group adding to 100%)
      after1 <- rnorm(num0*num1, aft1, stdev1)
      after2 <- runif(num0*num2, mini, maxi)

      # combines distributions into one group
      after <- c(after1, after2)

      # finds the mean and standard deviation of the contaminated group
      meanaft <- mean(after)
      sdaft <- sd(after)

      # denominator of the equation to get SD pooled
      # takes the before group's standard deviation and squares it
      # takes the after group's standard deviation and squares it
      # adds them together and divides by two
      # finally, takes the square root
      SDpooled <- sqrt(((sd(before)^2)+(sd(after)^2))/2)

      # calculating cohen's d
      # takes the after group's mean, and takes the before group's mean
      # subtracts the before group's mean from the after group's mean
      # divides by the pooled standard deviation found above
      cohend <- (mean(after)-mean(before))/SDpooled

      # creates a vector of calculated cohen's d, mean of the after
      # group, and standard deviation of the after group
      rtrn <- c(meanaft, sdaft, cohend)

      # returns the vector
      return(rtrn)
    } else {
      x = "Minimum for the uniform distribution must be smaller than maximum for the uniform distribution."
      print(x)
    }
  } else {
    x = "Num1 and Num2 must sum to 100% aka 1.00."
    print(x)
  }
}
