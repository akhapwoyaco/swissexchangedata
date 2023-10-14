## code to cleaning and preparation `newsboardmarketdata_raw` dataset goes here

#
library(rvest)
#newsboardmarketdata_raw <- newsboard_data()
# obtain the preceding text
itemlist_newsText_clean <-function(vec){
  # obtain the preceding text
  read_html(vec) |> html_text()
}
# obtain the data table
itemlist_newsText_table_clean <-function(vec){

  # obtain the html tabke from the vector
  temp_obj = read_html(vec) |> html_table(fill=TRUE) #|>
  #  unlist() |> unlist()

  # if no data, skip, else convert to dataframe
    if (!is.null(temp_obj)){
      temp_obj = temp_obj |> as.matrix() |>
        t() |>
        as.data.frame()
    } else {
      NA
    }
  temp_obj
}

# get copy of data to newsboardmarketdata
newsboardmarketdata <- newsboardmarketdata_raw
# extract text and table from newsText through apply
newsText_column_index <- grep("newsText", colnames(newsboardmarketdata))
#
newsboardmarketdata$data <- apply(
  X = newsboardmarketdata[,newsText_column_index,drop=FALSE],
  MARGIN = 1, simplify = T,
  FUN = itemlist_newsText_clean)
#
newsboardmarketdata$table_data <- apply(
  X = newsboardmarketdata[,newsText_column_index,drop=FALSE],
  MARGIN = 1, simplify = T,
  FUN = itemlist_newsText_table_clean)
#
# newsboardmarketdata$table_data <- do.call(
#   rbind, lapply(
#     newsboardmarketdata$table_data, as.data.frame))
# save the newsboard data
usethis::use_data(newsboardmarketdata, overwrite = TRUE)
#
