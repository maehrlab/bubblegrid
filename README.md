    
`bubblegrid` helps you see your data when a plain scatterplot would be overplotted. To do that, it aggregates points within a hexagonal grid, then shows, via size, the point count. It also shows, via color, the intensity (e.g. gene expression) averaged within bins.
    
    devtools::install_github("maehrlab/bubblegrid")
    library("bubblegrid")
    data(test_data)
    bubblegrid(x = test_data[[1]], y = test_data[[2]], color = test_data[[3]])

<img src="doc/demo_plot_plain.png" alt="Too much. Can't see." width="300"/>
<img src="doc/demo_plot_bubble.png" alt="Bubbles make it better." width="300"/>

