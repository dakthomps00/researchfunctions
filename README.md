
<!-- README.md is generated from README.Rmd. Please edit that file -->

# researchfunctions

<!-- badges: start -->
<!-- badges: end -->

The goal of researchfunctions is to allow me to keep all my functions
for my project in one place.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("dakthomps00/researchfunctions")
```

## Example

This is a basic example which shows you how to solve a common problem:

Say we want to get confidence intervals of effect sizes for random
normally distributed data sets we would do this

``` r
library(researchfunctions)

cohen <- replicate(10000, cohensd(75,0,1,1))
mad <- replicate(10000, deltamad(75,0,1,1))

confidint(cohen, 75)
#> $Low
#> [1] 0.971032
#> 
#> $High
#> [1] 1.038057
confidint(mad,75)
#> $Low
#> [1] 0.972257
#> 
#> $High
#> [1] 1.061778
```
