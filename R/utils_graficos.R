grafico_linha <- function(tab, rotulo_y, lang) {
  tab_plot <- tab |>
    dplyr::arrange(desc(ano), total) |>
    dplyr::mutate(
      grupo = forcats::fct_inorder(grupo),
      grupo_en = forcats::fct_inorder(grupo_en),
      cor = pegar_cor(grupo)
    )

  if (lang != "pt") {
    tab_plot$grupo <- tab_plot[[glue::glue("grupo_{lang}")]]
  }

  cores <- setNames(tab_plot$cor, tab_plot$grupo) |> unique()

  tab_plot |>
    ggplot2::ggplot(ggplot2::aes(x = ano, y = total, color = grupo)) +
    ggplot2::geom_line(size = 1.2) +
    ggplot2::scale_color_manual(values = cores) +
    ggplot2::labs(x = "", color = "", y = rotulo_y) +
    ggplot2::theme_minimal() +
    ggplot2::scale_x_continuous(
      expand = c(0, 0),
      breaks = seq(min(tab_plot$ano), max(tab_plot$ano), by = 5)
    ) +
    ggplot2::guides(color = ggplot2::guide_legend(byrow = TRUE)) +
    ggplot2::theme(
      axis.title.y = ggplot2::element_text(angle = 0, hjust = 1, vjust = 1, margin = ggplot2::margin(r = 10), face = "bold")
    ) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(margin = ggplot2::margin(t = 10))) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(margin = ggplot2::margin(r = 10))) +
    ggplot2::theme(legend.position = "top") +
    ggplot2::geom_vline(xintercept = min(tab_plot$ano), color = "black", linetype = "solid", size = 0.5) +
    ggplot2::geom_hline(yintercept = 0, color = "black", linetype = "solid", size = 0.35) +
    ggplot2::theme(panel.grid = ggplot2::element_blank(), panel.grid.minor = ggplot2::element_blank()) +
    ggplot2::scale_y_continuous(
      labels = scales::number_format(decimal.mark = ".")
    )
}


grafico_area <- function(tab, rotulo_y, lang) {
  tab_plot <- tab |>
    dplyr::arrange(desc(ano), total) |>
    dplyr::mutate(
      grupo = forcats::fct_inorder(grupo),
      grupo_en = forcats::fct_inorder(grupo_en),
      cor = pegar_cor(grupo)
    )

  if (lang != "pt") {
    tab_plot$grupo <- tab_plot[[glue::glue("grupo_{lang}")]]
  }

  cores <- setNames(tab_plot$cor, tab_plot$grupo) |> unique()

  tab_plot |>
    ggplot2::ggplot(ggplot2::aes(x = ano, y = total, fill = grupo)) +
    ggplot2::geom_area(color = "#404040", size = 0.5) +
    ggplot2::scale_fill_manual(values = cores) +
    ggplot2::labs(x = "", fill = "", y = rotulo_y) +
    ggplot2::theme_minimal() +
    ggplot2::scale_x_continuous(
      expand = c(0, 0),
      breaks = seq(min(tab_plot$ano), max(tab_plot$ano), by = 5)
    ) +
    ggplot2::guides(fill = ggplot2::guide_legend(byrow = TRUE)) +
    ggplot2::theme(
      axis.title.y = ggplot2::element_text(angle = 0, hjust = 1, vjust = 1, margin = ggplot2::margin(r = 10), face = "bold")
    ) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(margin = ggplot2::margin(t = 10))) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(margin = ggplot2::margin(r = 10))) +
    ggplot2::theme(legend.position = "top") +
    ggplot2::geom_vline(xintercept = min(tab_plot$ano), color = "black", linetype = "solid", size = 0.5) +
    ggplot2::geom_hline(yintercept = 0, color = "black", linetype = "solid", size = 0.35) +
    ggplot2::theme(panel.grid = ggplot2::element_blank(), panel.grid.minor = ggplot2::element_blank()) +
    ggplot2::scale_y_continuous(
      labels = scales::number_format(decimal.mark = ".")
    )
}