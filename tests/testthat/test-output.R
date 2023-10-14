# This file is part of the standard setup for testthat.
# It is recommended that you do not modify it.
#
# Where should you do additional test configuration?
# Learn more about the roles of various files in:
# * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
# * https://testthat.r-lib.org/articles/special-files.html

# library(plyr)
# library(jsonlite)
# library(testthat)
# library(swissexchangedata)

# test that the output from newsboard_data() returns a dataframe class object
test_that("Expected Class is data.frame and type is list", {
  # Example 1 ---------------------------------------------------------------
  # skip if offline
  skip_if_offline()
  #
  expect_s3_class(
    newsboard_data(firstDate = '2023-06-24'), "data.frame")
  # A data frame is built from a list:
  expect_type(
    newsboard_data(firstDate = '2023-06-24'), "list")

  # Example 2 ---------------------------------------------------------------

  expect_s3_class(
    newsboard_data(firstDate = '2023-06-24', messageType = 'Mistrade'),
    "data.frame")
  # A data frame is built from a list:
  expect_type(
    newsboard_data(firstDate = '2023-06-24', messageType = 'Mistrade'),
    "list")


  # Example 3 ---------------------------------------------------------------
  expect_s3_class(
    newsboard_data(firstDate = '2023-06-24', Market = 'Six Swiss Exchange'),
    "data.frame")
  # A data frame is built from a list:
  expect_type(
    newsboard_data(firstDate = '2023-06-24', Market = 'Six Swiss Exchange'),
    "list")

  expect_s3_class(
    newsboard_data(firstDate = '2023-06-24', Products = 'Funds'),
    "data.frame")
  # A data frame is built from a list:
  expect_type(
    newsboard_data(firstDate = '2023-06-24', Products = 'Funds'),
    "list")

})
#> Test passed
#>

# test that the output from newsboard_data() returns a dataframe class object
test_that("Expected Error when firstDate < lastDate", {
  # Example 4 ---------------------------------------------------------------

  # skip if offline
  skip_if_offline()
  #
  # \dontrun{
  #data_final <- newsboard_data(lastDate = '2021-07-01') # error when lastdate > firstdate
  expect_error(
    newsboard_data(lastDate = '2021-07-01'),#data_final,
    fixed = TRUE,
    regexp = "SIX data ranges from firstDate to lastDate with firstDate < lastDate"
    #"SIX data ranges from firstDate to lastDate with firstDate < lastDate"
    )
  # }
  #
})
#> Test passed
#>
#>

