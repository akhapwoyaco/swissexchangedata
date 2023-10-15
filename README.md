
<!-- README.md is generated from README.Rmd. Please edit that file -->

# swissexchangedata

<!-- badges: start -->

[![R-CMD-check](https://github.com/akhapwoyaco/swissexchangedata/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/akhapwoyaco/swissexchangedata/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Overview

The `swissexchangedata` package, built up for **educational purpose** to
learn and sharpen skills in web-scrapping of data from online sources,
data wrangling and package development processes.

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

Get the data for 9th October 2023 up-to-date:  

``` r
data_10thOct_2024 <- newsboard_data(firstDate = '2023-10-10', lastDate = Sys.Date())
#> [1] "Page 0"
#> [1] "Page 0 has 4 observations."
#> [1] "Page 1"
#> [1] "Page 1 has  observations."
```

``` r
head(data_10thOct_2024)
#>   messageNo         isin valorSymbol                                      title
#> 1    208873 CH0344958688         E18    Mistrade Decision in E18 / CH0344958688
#> 2    208872 CH1272334934      KGIHJB Mistrade Decision in KGIHJB / CH1272334934
#> 3    208871 CH1240058615      KGIMJB Mistrade Decision in KGIMJB / CH1240058615
#> 4    208870 IE00BDR5H412      GENDES Mistrade Decision in GENDES / IE00BDR5H412
#>   messageType broadcastDateTime                      security
#> 1    Mistrade      2.023101e+13               0.50 EIDG 18-32
#> 2    Mistrade      2.023101e+13             KGIHJB JB P 12/23
#> 3    Mistrade      2.023101e+13             KGIMJB JB C 12/23
#> 4    Mistrade      2.023101e+13 UBSETF GLOBAL GENDER hCHF ACC
#>                    tradingSegment priority markets products currency
#> 1 Bonds - CHF Swiss Confederation   Normal    XSWX       BO      CHF
#> 2             Structured Products   Normal    XQMH       DE      CHF
#> 3             Structured Products   Normal    XQMH       DE      CHF
#> 4                             ETF   Normal    XSWX       FU      CHF
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      newsText
#> 1                <div><p>In accordance with the rules of SIX Swiss Exchange, the following trade in <strong>'0.50 EIDG 18-32'</strong> has been declared a mistrade and has therefore been cancelled: </p><table><thead><tr><th align="center" style="width: 75px">Trade Date</th><th align="center" style="width: 75px">Time</th><th align="center" style="width: 45px">Cur</th><th align="left" style="width: 75px">Size</th><th align="left" style="width: 75px">Price</th><th align="left" style="width: 75px">Trade Type</th><th align="left" style="width: 75px">Book Type</th></tr></thead><tbody><tr><td align="center">11.10.2023</td><td align="center">11:21:55</td><td align="center">CHF</td><td align="left">10'000</td><td align="left">94.0000</td><td align="left">OnExchange</td><td align="left">Clob</td></tr></tbody></table><p>Please find further information concerning mistrades in Directive 4: Market Control on our website.</p><p>Regards,<br/>Exchange Operations, SIX Swiss Exchange</p></div>
#> 2           <div><p>In accordance with the rules of SIX Swiss Exchange, the following trade in <strong>'KGIHJB JB P 12/23'</strong> has been declared a mistrade and has therefore been cancelled: </p><table><thead><tr><th align="center" style="width: 75px">Trade Date</th><th align="center" style="width: 75px">Time</th><th align="center" style="width: 45px">Cur</th><th align="left" style="width: 75px">Size</th><th align="left" style="width: 75px">Price</th><th align="left" style="width: 75px">Trade Type</th><th align="left" style="width: 75px">Book Type</th></tr></thead><tbody><tr><td align="center">10.10.2023</td><td align="center">16:40:20</td><td align="center">CHF</td><td align="left">5'000</td><td align="left">0.7600</td><td align="left">OnExchange</td><td align="left">QuoteBook</td></tr></tbody></table><p>Please find further information concerning mistrades in Directive 4: Market Control on our website.</p><p>Regards,<br/>Exchange Operations, SIX Swiss Exchange</p></div>
#> 3           <div><p>In accordance with the rules of SIX Swiss Exchange, the following trade in <strong>'KGIMJB JB C 12/23'</strong> has been declared a mistrade and has therefore been cancelled: </p><table><thead><tr><th align="center" style="width: 75px">Trade Date</th><th align="center" style="width: 75px">Time</th><th align="center" style="width: 45px">Cur</th><th align="left" style="width: 75px">Size</th><th align="left" style="width: 75px">Price</th><th align="left" style="width: 75px">Trade Type</th><th align="left" style="width: 75px">Book Type</th></tr></thead><tbody><tr><td align="center">10.10.2023</td><td align="center">16:40:21</td><td align="center">CHF</td><td align="left">5'000</td><td align="left">0.6900</td><td align="left">OnExchange</td><td align="left">QuoteBook</td></tr></tbody></table><p>Please find further information concerning mistrades in Directive 4: Market Control on our website.</p><p>Regards,<br/>Exchange Operations, SIX Swiss Exchange</p></div>
#> 4 <div><p>In accordance with the rules of SIX Swiss Exchange, the following trade in <strong>'UBSETF GLOBAL GENDER hCHF ACC'</strong> has been declared a mistrade and has therefore been cancelled: </p><table><thead><tr><th align="center" style="width: 75px">Trade Date</th><th align="center" style="width: 75px">Time</th><th align="center" style="width: 45px">Cur</th><th align="left" style="width: 75px">Size</th><th align="left" style="width: 75px">Price</th><th align="left" style="width: 75px">Trade Type</th><th align="left" style="width: 75px">Book Type</th></tr></thead><tbody><tr><td align="center">10.10.2023</td><td align="center">11:35:19</td><td align="center">CHF</td><td align="left">41</td><td align="left">14.4180</td><td align="left">OnExchange</td><td align="left">QuoteBook</td></tr></tbody></table><p>Please find further information concerning mistrades in Directive 4: Market Control on our website.</p><p>Regards,<br/>Exchange Operations, SIX Swiss Exchange</p></div>
#>   newsTypeCode
#> 1           MI
#> 2           MI
#> 3           MI
#> 4           MI
```

## Getting help

If you encounter a clear bug, please file an issue with a minimal
reproducible example on GitHub.

## Code of conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
