#' The Swiss Stock Exchange Market Data News via the SIX Group Newsboard
#'
#' @description Returns the Swiss Stock Exchange Market Data News via the SIX Group Newsboard
#'
#' @param firstDate a character string indicating the year-month-date of From date.
#'      The default is equivalent to firstDate = `Sys.Date() - 365*2`, the earliest date for which
#'      data is available on the Newsboard.
#' @param lastDate a character string indicating the year-month-date of To date.
#'      The default is equivalent to `lastDate = Sys.Date()``, the last date in range for which
#'      data is available, but not greater than current date on the Newsboard.
#' @param messageType a vector of character strings of the message type.
#'      This must be one or combination of either of the strings "Emergency Information",
#'      "Mistrade", "Suspension", "Trading Information".The default is
#'      equivalent to messageType = 'All'.
#' @param Market a vector of character strings of the Market type.
#'      This must be one or combination of either of the strings "Six Swiss Exchange",
#'      "Structured Products","XBTR - Bilateral Trading Plattform". The default is
#'      equivalent to Market = 'All'.
#' @param Products a vector of character strings of the products type.
#'      This must be one or combination of either of the strings "Bonds", "Derivatives",
#'      "Equities", "Exchange Traded Products", "Funds".The default is
#'      equivalent to Products = 'All'.
#'
#' @details The inputs must all be character strings, with the date format as %Y-%m-%d
#'      (as determined by `as.Date()`). The 'messageType', 'Market', 'Products', if not
#'      supplied, all character string options are used, which leads to the
#'      messageType = 'All', Market = 'All' and Products = 'All' defaults.
#'      Supplying individual parameter requires the use of complete string
#'      as opposed to the use of abbreviations.
#'
#' @returns Swiss Stock Exchange Market Data News via the SIX Group Newsboard
#'
#' @author Akhapwoya Obuchere
#'
#' @importFrom plyr mapvalues
#' @importFrom jsonlite fromJSON
#'
#' @export
#'
#' @references Newsboard: Market activity at the Swiss Stock Exchange. SIX. https://www.six-group.com/en/products-services/the-swiss-stock-exchange/market-data/news-tools/newsboard.html#/
#'
#' @examples
#' library(plyr)
#' library(jsonlite)
#'
#' data_final <- newsboard_data(firstDate = '2023-06-24')
#' head(data_final, 1)
#' data_final <- newsboard_data(firstDate = '2023-06-24', messageType = 'Mistrade')
#' head(data_final, 2)
#' data_final <- newsboard_data(firstDate = '2023-06-24', Market = 'Six Swiss Exchange')
#' head(data_final,1)
#' data_final <- newsboard_data(firstDate = '2023-06-24', Products = 'Funds')
#' head(data_final, 1)
#' \dontrun{
#' data_final <- newsboard_data(lastDate = '2021-07-01') # error when lastdate > firstdate
#' head(data_final, 1)
#' }
#'
#'
newsboard_data <- function(
    firstDate = Sys.Date() - 365*2,
    lastDate = Sys.Date(),
    messageType = c(
      "Emergency Information", "Mistrade",
      "Suspension", "Trading Information"),
    Market = c(
      "Six Swiss Exchange", "Structured Products",
      "XBTR - Bilateral Trading Plattform"),
    Products = c(
      "Bonds", "Derivatives", "Equities",
      "Exchange Traded Products", "Funds")
){
  # Check dates
  if (!(as.Date(firstDate) && as.Date(lastDate))) {
    stop("x must be a character string in the form of a valid date %Y-%m-d%.")
  }
  #
  stopifnot( #
      "SIX data ranges from firstDate to lastDate with firstDate < lastDate"=firstDate <= lastDate # Threw out the Error as it is not captured when error testing with testthat
  )
  #
  if( firstDate < (Sys.Date() - 365*2)) {
    warning("SIX only provides historical data as far as 2 years from current Sys.Date(), defaulting to firstDate=Sys.Date().")
    lastDate <- (Sys.Date() - 365*2)
  }

  #'
  firstDate = gsub(pattern = '-', replacement = '', x = firstDate)
  lastDate = gsub(pattern = '-', replacement = '', x = lastDate)
  #'
  #' match
  if (!missing(messageType)){
    messageType = match.arg(
      arg = messageType,
      choices = c(
        "Emergency Information", "Mistrade",
        "Suspension", "Trading Information"),
      several.ok = TRUE)
    messageType <- plyr::mapvalues(
      messageType,
      from = c(
        "Emergency Information", "Mistrade",
        "Suspension", "Trading Information"),
      to = c("EI", "MI", "SU", "TI"), warn_missing = FALSE)
    messageType = paste0("messageType", messageType, '=true', sep = '', collapse = '&')
  } else {

    messageType = match.arg(
      arg = messageType,
      choices = c(
        "Emergency Information", "Mistrade",
        "Suspension", "Trading Information"),
      several.ok = TRUE)
    messageType <- mapvalues(
      messageType,
      from = c(
        "Emergency Information", "Mistrade",
        "Suspension", "Trading Information"),
      to = c("EI", "MI", "SU", "TI"), warn_missing = FALSE)
    #
    if (length(messageType) == 4){
      messageType = paste('messageTypeAll', '=true', sep = '')
    }
    #
  }
  ##############################################
  if (!missing(Market)){
    Market = match.arg(
      arg = Market,
      choices =  c(
        "Six Swiss Exchange", "Structured Products",
        "XBTR - Bilateral Trading Plattform"),
      several.ok = TRUE)
    Market <- plyr::mapvalues(
      Market,
      from = c(
        "Six Swiss Exchange", "Structured Products",
        "XBTR - Bilateral Trading Plattform"),
      to = c("XSWX", "XQMH", "XBTR"), warn_missing = FALSE)
    #
    Market = paste0("market", Market, '=true', sep = '', collapse = '&')
  } else {

    Market = match.arg(
      arg = Market,
      choices =  c(
        "Six Swiss Exchange", "Structured Products",
        "XBTR - Bilateral Trading Plattform"),
      several.ok = TRUE)
    Market <- plyr::mapvalues(
      Market,
      from = c(
        "Six Swiss Exchange", "Structured Products",
        "XBTR - Bilateral Trading Plattform"),
      to = c("XSWX", "XQMH", "XBTR"), warn_missing = FALSE)
    if (length(Market) == 3){
      Market = paste("marketAll", '=true', sep = '')
    }
    #
  }
  ########################################################
  if (!missing(Products)){
    Products = match.arg(
      arg = Products,
      choices = c(
        "Bonds", "Derivatives", "Equities",
        "Exchange Traded Products", "Funds"),
      several.ok = TRUE)

    Products <- plyr::mapvalues(
      Products,
      from = c(
        "Bonds", "Derivatives", "Equities", "Exchange Traded Products", "Funds"),
      to = c("BO","DE","EQ","EP", "FU"), warn_missing = FALSE)
    Products = paste0("products", Products, '=true', sep = '', collapse = '&')
  } else {
    Products = match.arg(
      arg = Products,
      choices = c(
        "Bonds", "Derivatives", "Equities",
        "Exchange Traded Products", "Funds"),
      several.ok = TRUE)

    Products <- plyr::mapvalues(
      Products,
      from = c(
        "Bonds", "Derivatives", "Equities", "Exchange Traded Products", "Funds"),
      to = c("BO","DE","EQ","EP", "FU"), warn_missing = FALSE)
    #
    if (length(Products) == 5){
      Products = paste("productTypeAll", '=true', sep = '')
    }
  }
  #
  url_root <-
    paste(
      "https://www.six-group.com/sheldon/newsboard/v1/find.json?firstDate=",
      firstDate, '&lastDate=', lastDate, "&pageSize=10&pageNumber=", sep = '')
  #    "https://www.six-group.com/sheldon/newsboard/v1/find.json?firstDate=firstDate&lastDate=lastDate&pageSize=10&pageNumber="
  #print(url)
  #url <- paste0(url, messageType, Market, Products, sep = '', collapse = '')
  #print(url)
  #print(lastDate)
  #
  trade_data_frame <- data.frame(NULL)
  #trade_details_data_frame <- data.frame(NULL)
  for (i in c(0:300)){ #Last value in seq based on size of number of results to last page
    # print page
    print(paste('Page', i))
    url <- paste(
      url_root, i, '&',
      paste(messageType, Market, Products, sep = '&'),
      sep = "")
    # print(url)
    # get data
    data <- jsonlite::fromJSON(
      #Captures the table of data within the page
      url
    )
    print(paste("Page",i, "has", nrow(data$itemList), "observations."))
    #stopifnot('END'= dim(data$itemList) !=  NULL) #Stops if next page is empty or rather past last page
    if (is.null(dim(data$itemList))){
      break
    }

    trade_data_frame = rbind(trade_data_frame, data$itemList)
    #
    Sys.sleep(0.0005)
    #
  }
  #
  # #Subset the desired Missedtrade and remove transactions with missing message numbers
  # trade_data_frame <- trade_data_frame[complete.cases(trade_data_frame$messageNo),]
  # string_value <- paste("trade Decision in CFRUSU / CH0589945366")
  # trade_data_frame <- subset(trade_data_frame, title == string_value)
  #
  trade_data_frame
  #
}
#'
#Sys.Date()
# data_final <- newsboard_data(firstDate = '2023-06-24',
#                               messageType = 'Mistrade')
#
# #
# data_final <- newsboard_data(firstDate = '2023-06-24',
#                              Market = 'XBTR - Bilateral Trading Plattform')
# #
# data_final <- newsboard_data(firstDate = '2023-06-24', Products = 'Funds')
#
#data_final <- newsboard_data()
#'
#'
#'
#'
# saveRDS(object = data_final, file = "R/data/newsboard_data.rds")
##
