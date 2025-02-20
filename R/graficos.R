#' @export 
grafico_geracao_energia_fontes_nr <- function(con) {
  tab <- dplyr::tbl(con, "grafico_geracao_energia_fontes_nr") |>
    dplyr::collect() |>
    dplyr::mutate(
      cor = pegar_cor(variavel)
    )

  cores <- setNames(tab$cor, tab$variavel)

  tab |>
    ggplot2::ggplot(ggplot2::aes(x = ano, y = valores, fill = variavel)) +
    ggplot2::geom_area(color = "#404040", size = 0.25) +
    ggplot2::geom_col(width = 0.5) +
    ggplot2::scale_fill_manual(values = cores) +
    ggplot2::theme_minimal() +
    ggplot2::scale_x_continuous(
      expand = c(0, 0),
      breaks = seq(min(tab$ano), max(tab$ano), by = 2)
    ) +
    ggplot2::guides(
      fill = ggplot2::guide_legend(
        byrow = TRUE,
        keywidth = 0.5,
        keyheight = 0.5
      )
    ) +
    ggplot2::theme(
      legend.title = ggplot2::element_blank(),
      legend.text = ggplot2::element_text(size = 6.5),
      legend.spacing.y = ggplot2::unit(0.15, "cm"),
      axis.title.y = ggplot2::element_text(angle = 0, hjust = 1, vjust = 1, margin = ggplot2::margin(r = 2), face = "bold", size = 6.5),
      axis.text.x = ggplot2::element_text(margin = ggplot2::margin(t = 5), size = 6.5),
      axis.text.y = ggplot2::element_text(margin = ggplot2::margin(r = 2), size = 6.5),
      axis.title.x = ggplot2::element_blank(),
      legend.position = "top",
      panel.grid = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      plot.margin = ggplot2::margin(0.1, 0.5, 0.1, 0.1, "cm")
    ) +
    ggplot2::scale_y_continuous(
      breaks = seq(0, 200000, by = 40000),
      labels = scales::number_format(decimal.mark = "."),
      limits = c(0, 200000)
    ) +
    ggplot2::geom_vline(xintercept = min(tab$ano), color = "black", linetype = "solid", size = 0.5) +
    ggplot2::geom_hline(yintercept = 0, color = "black", linetype = "solid", size = 0.35) +
    ggplot2::ylab("GWh")
}
