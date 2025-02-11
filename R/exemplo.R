fazer_grafico <- function(tab, xlab, ylab) {
  tab |> 
    ggplot2::ggplot(ggplot2::aes(x = wt, y = mpg)) +
    ggplot2::geom_point() +
    ggplot2::labs(x = xlab, y = ylab)
}