grafico_linha <- function(tab, rotulo_y, lang, .cap) {
  tab_plot <- tab |>
    dplyr::arrange(desc(ano), total) |>
    dplyr::mutate(
      grupo = forcats::fct_inorder(grupo),
      grupo_en = forcats::fct_inorder(grupo_en),
      cor = pegar_cor(grupo, cap = .cap)
    )

  if (lang != "pt") {
    tab_plot$grupo <- tab_plot[[glue::glue("grupo_{lang}")]]
  }

  cores <- tab_plot |> 
    dplyr::distinct(grupo, cor) |> 
    tibble::deframe()

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
      axis.title.y = ggplot2::element_text(
        angle = 0,
        hjust = 1,
        vjust = 1,
        margin = ggplot2::margin(r = 10),
        face = "bold"
      ),
      text = ggplot2::element_text(size = 10)
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


grafico_area <- function(tab, rotulo_y, lang, .cap) {
  tab_plot <- tab |>
    dplyr::arrange(desc(ano), total) |>
    dplyr::mutate(
      grupo = forcats::fct_inorder(grupo),
      grupo_en = forcats::fct_inorder(grupo_en),
      cor = pegar_cor(grupo, cap = .cap)
    )

  if (lang != "pt") {
    tab_plot$grupo <- tab_plot[[glue::glue("grupo_{lang}")]]
  }

  cores <- tab_plot |> 
    dplyr::distinct(grupo, cor) |> 
    tibble::deframe()

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
      axis.title.y = ggplot2::element_text(
        angle = 0,
        hjust = 1,
        vjust = 1,
        margin = ggplot2::margin(r = 10),
        face = "bold"
      ),
      text = ggplot2::element_text(size = 10)
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

grafico_sunkey <- function(tab, sufixo) {
  tab_nos <- tab |>
    dplyr::select(nome = origem, ordem) |>
    dplyr::bind_rows(
      tab |>
        dplyr::select(nome = destino, ordem)
    ) |>
    dplyr::group_by(
      nome
    ) |>
    dplyr::summarise(
      ordem = min(ordem)
    ) |>
    dplyr::arrange(
      ordem
    ) |>
    dplyr::mutate(
      id_no = dplyr::row_number() - 1
    )


  tab_id <- tab |>
    dplyr::left_join(
      tab_nos |> dplyr::rename(id_origem = id_no),
      by = c("origem" = "nome")
    ) |>
    dplyr::left_join(
      tab_nos |> dplyr::rename(id_destino = id_no),
      by = c("destino" = "nome")
    ) |>
    dplyr::mutate(
      numero = scales::number(valor, accuracy = 1, big.mark = ".", decimal.mark = ","),
      legenda = stringr::str_glue("{origem} -> {destino}:<br>{numero} - {rotulo_percentual}<extra></extra>")
    )

  plotly::plot_ly(
    type = "sankey",
    orientation = "h",
    valueformat = ".0f",
    valuesuffix = sufixo,
    height = 400,
    node = list(
      label = tab_nos$nome,
      pad = 15,
      thickness = 15,
      line = list(
        color = "black",
        width = 0.5
      ),
      hovertemplate = stringr::str_glue("{tab_nos$nome}<extra></extra>")
    ),
    link = list(
      source = tab_id$id_origem,
      target = tab_id$id_destino,
      value = tab_id$valor,
      label = stringr::str_glue("{tab_id$origem} -> {tab_id$destino}<br>{tab_id$numero} - {tab_id$rotulo_percentual}"),
      hovertemplate = "%{label}<extra></extra>"
    )
  ) |>
    plotly::layout(
      title = "",
      font = list(
        size = 12
      ),
      xaxis = list(showgrid = F, zeroline = F),
      yaxis = list(showgrid = F, zeroline = F)
    )
}


grafico_comparacao_anos <- function(tab, .ano, rotulo_y, lang) {
  tab_plot <- tab |>
    dplyr::filter(ano %in% c(.ano, max(ano, na.rm = TRUE)))

  if (lang != "pt") {
    tab_plot$variavel <- tab_plot[[glue::glue("variavel_{lang}")]]
  }

  tab_plot |>
    ggplot2::ggplot(ggplot2::aes(x = variavel, y = valores, fill = ano)) +
    ggplot2::geom_col(position = "dodge", color = "#404040", size = 0.5, width = 0.75) +
    ggplot2::geom_text(
      ggplot2::aes(
      label = sprintf("%.1f", valores),
      hjust = -0.4
      ),
      size = 4.5, 
      fontface = "bold", 
      position = ggplot2::position_dodge(width = 0.8)
    ) +
    ggplot2::scale_fill_manual(values = c("#7F7F7F", "#FFD966")) +
    ggplot2::scale_y_continuous(
      expand = c(0, 0, 0, 6)
    ) +
    ggplot2::coord_flip() +
    ggplot2::theme_classic() +
    ggplot2::theme(
      legend.position = "top",
      legend.title = ggplot2::element_blank(),
      legend.text = ggplot2::element_text(size = 14),
      axis.title.y = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_text(size = 12, angle = 0),
      axis.text.y = ggplot2::element_text(size = 12),
      plot.margin = ggplot2::margin(1, 1, 1, 1)
    )
}
