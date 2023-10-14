#
#
# #
# itemlist_newsText_clean <-function(vec){
#   read_html(vec) |> html_text()
# }
# itemlist_newsText_table_clean <-function(vec){
#   read_html(vec) |> html_table(fill=TRUE) |>
#     unlist() |> unlist() |>
#     t() |>
#     as.data.frame()
# }
# #
# trade_details_data_frame <- data_final
# #
# newsText_column_index <- grep("newsText", colnames(trade_details_data_frame))
# #
# trade_details_data_frame$data <- apply(
#   X = trade_details_data_frame[,newsText_column_index,drop=FALSE],
#   MARGIN = 1, simplify = T,
#   FUN = itemlist_newsText_clean)
# #
# trade_details_data_frame$table_data <- apply(
#   X = trade_details_data_frame[,newsText_column_index,drop=FALSE],
#   MARGIN = 1, simplify = T,
#   FUN = itemlist_newsText_table_clean)
# #
# #
#
#
