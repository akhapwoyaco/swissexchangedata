#' Products & Services > SIX Swiss Exchange Market Data > News & Tools > Newsboard data
#'
#' Clean scrapped data from the SIX Swiss Exchange Market Data website.
#'
#' @format ## `newsboardmarketdata`
#' A data frame with 1345 rows and 16 columns:
#' \describe{
#'   \item{messageNo}{Messae No}
#'   \item{isin}{Company, Symbol, ISIN}
#'   \item{valorSymbol}{Valor Symbol}
#'   \item{title}{Title}
#'   \item{messageType}{Message Type}
#'   \item{broadcastDateTime}{Broadcast Time}
#'   \item{security}{Security}
#'   \item{tradingSegment}{Trading Segment}
#'   \item{priority}{Priority}
#'   \item{markets}{Markets}
#'   \item{products}{Product}
#'   \item{currency}{Currency}
#'   \item{newsText}{News Text}
#'   \item{newsTypeCode}{News Type Code}
#'   \item{data}{Table Data}
#'   \item{table_data}{Cleaned and nested table data on trades}
#' }
#' @source <https://www.six-group.com/en/products-services/the-swiss-stock-exchange/market-data/news-tools/newsboard.html#/>
"newsboardmarketdata"
