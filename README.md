    
`bubblegrid` helps you see your data when a plain scatterplot would be overplotted. To do that, it aggregates points within a hexagonal grid, then shows, via size, the point count. It also shows, via color, the intensity (e.g. gene expression) averaged within bins.
    
    devtools::install_github("maehrlab/bubblegrid")
    library("bubblegrid")
    data(test_data)
    bubblegrid(x = test_data[[1]], y = test_data[[2]], color = test_data[[3]])

![A demonstration of the results](doc/demo_plot_plain.png | width=100)
![A demonstration of the results](doc/demo_plot_bubble.png | width=100)
