
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
#>          checking for file 'C:\Users\Dakota\AppData\Local\Temp\Rtmpo3nZyL\remotes765c12565ba1\dakthomps00-researchfunctions-82ae48c/DESCRIPTION' ...  v  checking for file 'C:\Users\Dakota\AppData\Local\Temp\Rtmpo3nZyL\remotes765c12565ba1\dakthomps00-researchfunctions-82ae48c/DESCRIPTION'
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
#> [1] 0.9702434
#> 
#> $High
#> [1] 1.037725
confidint(mad,75)
#> $Low
#> [1] 0.9769869
#> 
#> $High
#> [1] 1.066084
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

cohen1 <- t(cohen)
mad1 <- t(mad)

confidint(cohen1[,1], 75)
#> $Low
#> [1] 1.081323
#> 
#> $High
#> [1] 1.121612
confidint(mad1[,1],75)
#> $Low
#> [1] 1.079024
#> 
#> $High
#> [1] 1.120095
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

cohen1 <- t(cohen)
mad1 <- t(mad)

confidint(cohen1[,1], 75)
#> $Low
#> [1] 1.129039
#> 
#> $High
#> [1] 1.16921
confidint(mad1[,1],75)
#> $Low
#> [1] 1.130294
#> 
#> $High
#> [1] 1.170551
```
