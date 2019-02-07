requireNamespace("ggplot2", quietly = T)
requireNamespace("FNN", quietly = T)
requireNamespace("hexbin", quietly = T)

#' Bubble grid plots (for single-cell data)
#'
#' @param x,y,color Numeric vectors. To be shown directly in the plot.
#' @param num_bins This function works by hexagonal binning. This is the number of bins on the horizontal axis.
bubblegrid <- function(x, y, color, num_bins = 25) {
  # Sanitize inputs
  assertthat::is.number(x)
  assertthat::is.number(y)
  assertthat::is.number(color)
  assertthat::are_equal(length(x), length(y))
  assertthat::are_equal(length(x), length(color))
  assertthat::is.scalar(num_bins)
  my_df = data.frame(x = x, y = y, color = color)

  # Bin cells into hexagons
  hex_data = hexbin::hexbin(my_df[1:2], xbins = num_bins )
  hex_data = data.frame( x = hex_data@xcm,
                         y = hex_data@ycm,
                         count = hex_data@count )

  # Assign cells to bins and average by bin
  my_df$nearest_bin = FNN::get.knnx( query = my_df[1:2],
                                     data = hex_data[1:2],
                                     k = 1, algorithm = "cover_tree" )$nn.index[, 1]
  bin_averages = stats::aggregate( my_df[["color"]], by = my_df["nearest_bin"], FUN = mean )
  colnames(bin_averages) = c("index", "value")
  hex_data[bin_averages[, "index"], "color"] = bin_averages[, "value"]

  # make plot
  p = ggplot2::ggplot() +
    ggplot2::geom_point( ggplot2::aes(x = x, y = y, size = count, colour = color ),
                         data = hex_data )
  print(p)
  return(p)
}

#' Bubblegrid test dataset
#'
#' A small dataset with 2D Monocle embedding and two genes.
#'
"test_data"
