
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
#> Downloading GitHub repo dakthomps00/researchfunctions@HEAD
#>       v  checking for file 'C:\Users\Dakota\AppData\Local\Temp\Rtmp0ORHxH\remotes3fd82da944f9\dakthomps00-researchfunctions-66c6825/DESCRIPTION'
#>       -  preparing 'researchfunctions':
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   v  checking DESCRIPTION meta-information
#>       -  checking for LF line-endings in source and make files and shell scripts
#>   -  checking for empty or unneeded directories
#>       -  building 'researchfunctions_0.0.0.9000.tar.gz'
#>      
#> 
```

## Example

This is a basic example which shows you how to solve a common problem:

Say we want to get confidence intervals of effect sizes for random
normally distributed data sets we would do this

``` r
library(researchfunctions)

cohen <- replicate(10000, cohensd_OG(75,0,1,1))
mad <- replicate(10000, deltamad_OG(75,0,1,1))

confidint(cohen, 75)
#> $Low
#> [1] 0.9709648
#> 
#> $High
#> [1] 1.038174
confidint(mad,75)
#> $Low
#> [1] 0.9738608
#> 
#> $High
#> [1] 1.062205
```

This is another basic example which shows you how to solve a common
problem:

Say we want to get confidence intervals of effect sizes for random
normally distributed data sets that are contaminated with another
normally distributed data set, we would do this

``` r
library(researchfunctions)

cohen <- replicate(10000, cohensd_A(75,0.8,0.2,0,1,1.5,1,1,0.5))
mad <- replicate(10000, deltamad_A(75,0.8,0.2,0,1,1.5,1,1,0.5))

confidint(cohen, 75)
#> $Low
#> [1] 1.103487
#> 
#> $High
#> [1] 1.172777
confidint(mad,75)
#> $Low
#> [1] 1.187923
#> 
#> $High
#> [1] 1.282907
```

This is another basic example which shows you how to solve a common
problem:

Say we want to get confidence intervals of effect sizes for random
normally distributed data sets that are contaminated with a uniform data
set, we would do this

``` r
library(researchfunctions)

cohen <- replicate(10000, cohensd_B(75,0.8,0.2,0,1,1.5,1,1,2))
mad <- replicate(10000, deltamad_B(75,0.8,0.2,0,1,1.5,1,1,2))

confidint(cohen, 75)
#> $Low
#> [1] 1.155872
#> 
#> $High
#> [1] 1.225105
confidint(mad,75)
#> $Low
#> [1] 1.371196
#> 
#> $High
#> [1] 1.487798
```
