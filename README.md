
<!-- README.md is generated from README.Rmd. Please edit that file -->

# swissexchangedata

<!-- badges: start -->
<!-- badges: end -->

## Overview

swisswxchangedata facilitates ease of access of the
`Swiss Stock Exchange Market Data News` Via [The SIX Group Newsboard
Website](https://www.six-group.com/en/products-services/the-swiss-stock-exchange/market-data/news-tools/newsboard.html#/)
via the function: `newsboard_data`.

## Installation

You can install the development version of `swissexchangedata` like so:

``` r
install.packages("devtools") # if you have not installed "devtools" package
devtools::install_github("akhapwoyaco/swissexchangedata")
```

## Usage

This is a basic example which shows you how to solve a common problem:

``` r
library(swissexchangedata)
## basic example code
```

Get the data for 10th October 2023 up-to-date:  

``` r
data_10thOct_2024 <- newsboard_data(firstDate = '2023-10-12', lastDate = Sys.Date())
#> [1] "Page 0"
#> [1] "Page 0 has  observations."
```

``` r
head(data_10thOct_2024)
#> data frame with 0 columns and 0 rows
```

## Getting help

If you encounter a clear bug, please file an issue with a minimal
reproducible example on GitHub.

## Code of conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
