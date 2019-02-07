
data(test_data)
expect_is( bubblegrid(test_data[[1]], test_data[[2]], test_data[[3]])               , "ggplot")
expect_is( bubblegrid(test_data[[1]], test_data[[2]], test_data[[4]], num_bins = 15), "ggplot")
