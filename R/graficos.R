#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_geracao_energia_fontes_nr <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_geracao_energia_fontes_nr") |>
    dplyr::collect() |>
    dplyr::mutate(
      cor = pegar_cor(variavel)
    )

  if (lang != "pt") {
    tab$variavel <- tab[[glue::glue("variavel_{lang}")]]
  }

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

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_oferta_interna_el_fonte <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_oferta_interna_el_fonte") |>
    dplyr::collect() |>
    dplyr::mutate(
      cor = pegar_cor(variavel)
    )

  if (lang != "pt") {
    tab$variavel <- tab[[glue::glue("variavel_{lang}")]]
  }

  cores <- setNames(tab$cor, tab$variavel)

  tab |>
    ggplot2::ggplot(ggplot2::aes(x = variavel, y = valores, fill = variavel)) +
    ggplot2::geom_bar(stat = "identity", color = "#404040", size = 0.25, width = 1) +
    ggplot2::geom_text(ggplot2::aes(label = scales::percent(valores, accuracy = 0.1)),
      vjust = 0.5, hjust = -0.25, size = 2.5, fontface = "bold"
    ) +
    ggplot2::geom_segment(ggplot2::aes(x = as.numeric(variavel) - 0.5, xend = as.numeric(variavel) + 0.5, y = 0, yend = 0), size = 0.6) +
    ggplot2::coord_flip() +
    ggplot2::scale_fill_manual(values = cores) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      legend.position = "none",
      axis.title.y = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_text(size = 6.5)
    ) +
    ggplot2::scale_y_continuous(limits = c(0, 0.75))
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_variacao_consumo_setorial_el <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_variacao_consumo_setorial_el") |>
    dplyr::collect()

  if (lang != "pt") {
    tab$variavel <- tab[[glue::glue("variavel_{lang}")]]
  }

  tab |>
    ggplot2::ggplot(ggplot2::aes(x = variavel, y = valores, fill = variavel)) +
    ggplot2::geom_bar(stat = "identity", color = "#404040", size = 0.25, width = 0.8) +
    ggplot2::scale_fill_manual(values = ifelse(tab$valores > 0, "#00678e", "#953735")) +
    ggplot2::geom_text(ggplot2::aes(label = scales::percent(valores, accuracy = 0.1)),
      vjust = ifelse(tab$valores >= 0, 0.25, 0.25),
      hjust = ifelse(tab$valores >= 0, -0.25, 1.2), size = 2.5, fontface = "bold"
    ) +
    ggplot2::geom_segment(ggplot2::aes(x = as.numeric(variavel) - 0.5, xend = as.numeric(variavel) + 0.5, y = 0, yend = 0), size = 0.6) +
    ggplot2::coord_flip() +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      legend.position = "none",
      axis.text.x = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_text(size = 6.5)
    ) +
    ggplot2::scale_y_continuous(limits = c(-0.10, 0.10))
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_crescimento_consumo_eletricidade_industria <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_crescimento_consumo_eletricidade_industria") |>
    dplyr::collect()

  if (lang != "pt") {
    tab$variavel <- tab[[glue::glue("variavel_{lang}")]]
  }

  tab |>
    ggplot2::ggplot(ggplot2::aes(x = variavel, y = valores, fill = variavel)) +
    ggplot2::geom_bar(stat = "identity", color = "#404040", size = 0.25, width = 0.9) +
    ggplot2::scale_fill_manual(values = ifelse(tab$valores > 0, "#00678e", "#953735")) +
    ggplot2::geom_text(ggplot2::aes(label = scales::percent(valores, accuracy = 0.1)),
      vjust = ifelse(tab$valores >= 0, 0.25, 0.25),
      hjust = ifelse(tab$valores >= 0, -0.25, 1.2), size = 2.5, fontface = "bold"
    ) +
    ggplot2::geom_segment(ggplot2::aes(x = as.numeric(variavel) - 0.5, xend = as.numeric(variavel) + 0.5, y = 0, yend = 0), size = 0.6) +
    ggplot2::coord_flip() +
    ggplot2::theme_minimal() +
    ggplot2::theme(legend.position = "none") +
    ggplot2::theme(
      axis.text.x = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_text(size = 6.5),
      axis.title.y = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank()
    ) +
    ggplot2::scale_y_continuous(limits = c(-0.10, 0.15))
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_participacao_setorial_consumo_el <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_participacao_setorial_consumo_el") |>
    dplyr::collect() |>
    dplyr::mutate(
      cor = pegar_cor(variavel)
    )

  if (lang != "pt") {
    tab$variavel <- tab[[glue::glue("variavel_{lang}")]]
  }

  cores <- setNames(tab$cor, tab$variavel)

  tab |>
    ggplot2::ggplot(ggplot2::aes(x = variavel, y = valores, fill = variavel)) +
    ggplot2::geom_bar(stat = "identity", color = "#404040", size = 0.25, width = 1) +
    ggplot2::geom_text(ggplot2::aes(label = scales::percent(valores, accuracy = 0.1)),
      vjust = 0.5, hjust = -0.25, size = 2.5, fontface = "bold"
    ) +
    ggplot2::geom_segment(ggplot2::aes(x = as.numeric(variavel) - 0.5, xend = as.numeric(variavel) + 0.5, y = 0, yend = 0), size = 0.6) +
    ggplot2::coord_flip() +
    ggplot2::scale_fill_manual(values = cores) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      legend.position = "none",
      axis.title.y = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_text(size = 6.5)
    ) +
    ggplot2::scale_y_continuous(limits = c(0, 0.45))
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_participacao_fontes_capacidade_instalada <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_participacao_fontes_capacidade_instalada") |>
    dplyr::collect() |>
    dplyr::mutate(
      cor = pegar_cor(variavel)
    )

  if (lang != "pt") {
    tab$variavel <- tab[[glue::glue("variavel_{lang}")]]
  }

  cores <- setNames(tab$cor, tab$variavel)

  tab |>
    ggplot2::ggplot(ggplot2::aes(x = variavel, y = valores, fill = variavel)) +
    ggplot2::geom_bar(stat = "identity", color = "#404040", size = 0.25, width = 1) +
    ggplot2::geom_text(ggplot2::aes(label = scales::percent(valores, accuracy = 0.1)),
      vjust = 0.5, hjust = -0.25, size = 2.5, fontface = "bold"
    ) +
    ggplot2::geom_segment(ggplot2::aes(x = as.numeric(variavel) - 0.5, xend = as.numeric(variavel) + 0.5, y = 0, yend = 0), size = 0.6) +
    ggplot2::coord_flip() +
    ggplot2::scale_fill_manual(values = cores) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      legend.position = "none",
      axis.title.y = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_text(size = 6.5)
    ) +
    ggplot2::scale_y_continuous(limits = c(0, 0.65))
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#'
#' @export
grafico_consumo_gas_natural <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_consumo_gas_natural") |>
    dplyr::collect()

  if (lang != "pt") {
    tab$variavel <- tab[[glue::glue("variavel_{lang}")]]
  }

  tab |>
    ggplot2::ggplot(ggplot2::aes(x = variavel, y = valores, fill = ano)) +
    ggplot2::geom_col(position = "dodge", color = "#404040", size = 0.25, width = 0.7) +
    ggplot2::geom_text(ggplot2::aes(label = scales::percent(valores, accuracy = 0.1)),
      position = ggplot2::position_dodge(width = 0.7),
      vjust = ifelse(tab$ano == tab$ano_max,
        0.25,
        0.5
      ),
      hjust = -0.2,
      size = 2.5,
      fontface = "bold"
    ) +
    ggplot2::geom_segment(ggplot2::aes(x = as.numeric(ano) - 0.5, xend = as.numeric(ano) + 4.5, y = 0, yend = 0), size = 0.6) +
    ggplot2::scale_fill_manual(values = c("#7F7F7F", "#FFD966")) +
    ggplot2::coord_flip() +
    ggplot2::theme_minimal() +
    ggplot2::guides(fill = ggplot2::guide_legend(reverse = TRUE, byrow = TRUE, keywidth = 0.5, keyheight = 0.5)) +
    ggplot2::theme(
      legend.position = "top",
      legend.title = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_text(size = 6.5)
    ) +
    ggplot2::scale_y_continuous(limits = c(0, 0.7))
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_producao_energia_primaria <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_producao_energia_primaria") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_oferta_interna_energia <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_oferta_interna_energia") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_consumo_final_fonte <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_consumo_final_fonte") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_consumo_final_setor <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_consumo_final_setor") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}


#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_dependencia_externa_energia <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_dependencia_externa_energia") |>
    dplyr::collect()

  rotulo_y <- "%"

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
      labels = scales::number_format(decimal.mark = "."),
      breaks = seq(-60, 100, by = 20)
    ) +
    ggplot2::coord_cartesian(ylim = c(-60, 100))
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_composicao_setorial_consumo_derivados_petroleo <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_composicao_setorial_consumo_derivados_petroleo") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_composicao_setorial_consumo_eletricidade <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_composicao_setorial_consumo_eletricidade") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_composicao_setorial_consumo_carvao_vapor <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_composicao_setorial_consumo_carvao_vapor") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_composicao_setorial_consumo_biomassa <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_composicao_setorial_consumo_biomassa") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}


#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_oferta_interna_energia <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_oferta_interna_energia") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}


#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_sankey_fluxo_energetico <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_sankey_fluxo_energetico") |>
    dplyr::collect()

  sufixo <- "10⁶ tep"

  grafico_sunkey(
    tab,
    sufixo = sufixo
  )
}


#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_sankey_fluxo_eletrico <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_sankey_fluxo_eletrico") |>
    dplyr::collect()

  sufixo <- "TWh"

  grafico_sunkey(
    tab,
    sufixo = sufixo
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_estrutura_consumo_fontes_primarias <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_fontes_primarias") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_fontes_primarias <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_fontes_primarias") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_petroleo <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_petroleo") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_estrutura_consumo_gas_natural <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_gas_natural") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}


#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_carvao_vapor <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_carvao_vapor") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_transformacao_energia_hidraulica <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_transformacao_energia_hidraulica") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_consumo_energia_solar_termica_setor <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_consumo_energia_solar_termica_setor") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_uranio <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_uranio") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_estrutura_consumo_lenha <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_lenha") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_estrutura_consumo_bagaco_cana <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_bagaco_cana") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_estrutura_consumo_lixivia <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_lixivia") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_estrutura_consumo_outras_fontes_primarias <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_outras_fontes_primarias") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_estrutura_consumo_outras_fontes_secundarias <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_outras_fontes_secundarias") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_fontes_secundarias <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_fontes_secundarias") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_estrutura_consumo_derivados_petrolo_gas_natural <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_derivados_petrolo_gas_natural") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_oleo_diesel_total <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_oleo_diesel_total") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_diesel_petroleo <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_diesel_petroleo") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_oleo_combustivel <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_oleo_combustivel") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_gasolina <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_gasolina") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_glp <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_glp") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_estrutura_consumo_nafta <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_nafta") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_nafta <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_nafta") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_coque_carvao_mineral <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_coque_carvao_mineral") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_querosene <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_querosene") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_estrutura_consumo_gas_coqueria <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_gas_coqueria") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_consumo_final_eletricidade_setor <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_consumo_final_eletricidade_setor") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
grafico_estrutura_consumo_alcool_etilico <- function(con, lang = "pt", .tipo_dado) {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_alcool_etilico") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_setor_energetico <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_setor_energetico") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_setor_comercial <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_setor_comercial") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_setor_publico <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_setor_publico") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_setor_residencial <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_setor_residencial") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_setor_agropecuario <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_setor_agropecuario") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_setor_transportes_geral <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_setor_transportes_geral") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}


#' Gráfico do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#' @param .segmento Segmento
#'
#' @export
grafico_setor_transportes_segmento <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, .segmento) {
  tab <- dplyr::tbl(con, "tab_setor_transportes_segmento") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado, dado == .segmento)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_setor_industrial_geral <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_setor_industrial_geral") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#' @param .segmento Segmento
#'
#' @export
grafico_setor_industrial_segmento <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, .segmento) {
  tab <- dplyr::tbl(con, "grafico_setor_industrial_segmento") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado, dado == .segmento)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo IV
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_dependencia_externa_energia_2 <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_dependencia_externa_energia_2") |>
    dplyr::collect()

  rotulo_y <- "10³ tep"

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  ) +
    ggplot2::guides(color = ggplot2::guide_legend(nrow = 2))
}

#' Gráfico do Capítulo IV
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_dependencia_externa_petroleo <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_dependencia_externa_petroleo") |>
    dplyr::collect()

  rotulo_y <- "10³ tep"

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  ) +
    ggplot2::guides(color = ggplot2::guide_legend(nrow = 2))
}

#' Gráfico do Capítulo IV
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_importacoes_energia <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_importacoes_energia") |>
    dplyr::collect()

  rotulo_y <- "10³ tep"

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo IV
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_exportacoes_energia <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_exportacoes_energia") |>
    dplyr::collect()

  rotulo_y <- "10³ tep"

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo IV
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_exportacoes_importacoes_liquidas <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_exportacoes_importacoes_liquidas") |>
    dplyr::collect()

  rotulo_y <- "10³ tep"

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}

#' Gráfico do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_total_geracao_centrais_eletr_renov_nao_renov <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_total_geracao_centrais_eletr_renov_nao_renov") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_total_geracao_centrais_eletr_por_fonte <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_total_geracao_centrais_eletr_por_fonte") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_total_geracao_centrais_eletr_servico_pub_renov_nao_renov <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_total_geracao_centrais_eletr_servico_pub_renov_nao_renov") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_total_geracao_centrais_eletr_servico_pub_por_fonte <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_total_geracao_centrais_eletr_servico_pub_por_fonte") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_total_geracao_centrais_eletr_autoprod_renov_nao_renov <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_total_geracao_centrais_eletr_autoprod_renov_nao_renov") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_total_geracao_centrais_eletr_autoprod_por_fonte <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_total_geracao_centrais_eletr_autoprod_por_fonte") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_autoprod_nao_injetada_renov_nao_renov <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_autoprod_nao_injetada_renov_nao_renov") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#'
#' @export
grafico_autoprod_nao_injetada_por_fonte <- function(con, lang = "pt", .tipo_dado, .tipo_grafico) {
  tab <- dplyr::tbl(con, "grafico_autoprod_nao_injetada_por_fonte") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  rotulo_y <- ifelse(.tipo_dado == "Absoluto", "10³ tep", "%")

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = rotulo_y,
      lang = lang
    )
  }
}

#' Gráfico do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_micro_mini_geracao_dist <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_micro_mini_geracao_dist") |>
    dplyr::collect() |>
    dplyr::mutate(
      ano = as.factor(ano),
      grupo = forcats::fct_inorder(grupo),
      grupo_en = forcats::fct_inorder(grupo_en),
      cor = pegar_cor(grupo)
    )

  cores <- setNames(tab$cor, tab$grupo) |> unique()

  tab |>
    ggplot2::ggplot(ggplot2::aes(x = ano, y = total, fill = grupo)) +
    ggplot2::geom_bar(stat = "identity", color = "#404040", size = 0.25, width = 0.8, position = ggplot2::position_dodge(width = 0.8)) +
    ggplot2::geom_text(ggplot2::aes(label = scales::number_format(accuracy = 1)(total)),
      vjust = -0.5,
      size = 2,
      fontface = "bold",
      position = ggplot2::position_dodge(width = 0.8)
    ) +
    ggplot2::geom_segment(ggplot2::aes(x = 1, xend = 9, y = 0, yend = 0), size = 0.25, position = ggplot2::position_dodge(width = 1)) +
    ggplot2::guides(fill = ggplot2::guide_legend(byrow = TRUE, keywidth = 0.5, keyheight = 0.5)) +
    ggplot2::theme_minimal() +
    ggplot2::scale_fill_manual(values = cores) +
    ggplot2::theme(
      legend.position = "top",
      legend.title = ggplot2::element_blank(),
      legend.text = ggplot2::element_text(size = 7.5),
      axis.text.x = ggplot2::element_text(size = 7.5),
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_blank()
    )
}


#' Gráfico do Capítulo VI
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_reservas_provadas_petroleo <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_reservas_provadas_petroleo") |>
    dplyr::collect()

  tab |>
    ggplot2::ggplot(ggplot2::aes(x = ano, y = y)) +
    ggplot2::geom_area(color = "#404040", size = 0.25, fill = "#0D223F") +
    ggplot2::labs(x = "", y = "10³ m³") +
    ggplot2::theme_minimal() +
    ggplot2::scale_x_continuous(expand = c(0, 0), breaks = seq(min(tab$ano), max(tab$ano), by = 5)) +
    ggplot2::scale_y_continuous(
      breaks = seq(0, 3000000, by = 500000),
      labels = scales::number_format(decimal.mark = "."),
      limits = c(0, 3000000)
    ) +
    ggplot2::theme(
      legend.text = ggplot2::element_blank(),
      legend.title = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_text(
        angle = 0, hjust = 1, vjust = 1, margin = ggplot2::margin(r = 2),
        face = "bold", size = 6.5
      ),
      axis.text.x = ggplot2::element_text(margin = ggplot2::margin(t = 5), size = 6.5),
      axis.text.y = ggplot2::element_text(margin = ggplot2::margin(r = 2), size = 6.5)
    ) +
    ggplot2::theme(legend.position = "none") +
    ggplot2::geom_vline(xintercept = min(tab$ano), color = "black", linetype = "solid", size = 0.35) +
    ggplot2::geom_hline(yintercept = 0, color = "black", linetype = "solid", size = 0.35) +
    ggplot2::theme(panel.grid = ggplot2::element_blank(), panel.grid.minor = ggplot2::element_blank())
}

#' Gráfico do Capítulo VI
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_reservas_provadas_gas <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_reservas_provadas_gas") |>
    dplyr::collect()

  tab |>
    ggplot2::ggplot(ggplot2::aes(x = ano, y = y)) +
    ggplot2::geom_area(color = "#404040", size = 0.25, fill = "#ADB8CA") +
    ggplot2::labs(x = "", y = expression(10^6*m^3)) +
    ggplot2::theme_minimal() +
    ggplot2::scale_x_continuous(
      expand = c(0, 0),
      breaks = seq(min(tab$ano),
        max(tab$ano),
        by = 5
      )
    ) +
    ggplot2::scale_y_continuous(
      breaks = seq(0, 500000, by = 50000),
      labels = scales::number_format(decimal.mark = "."),
      limits = c(0, 500000)
    ) +
    ggplot2::theme(
      legend.text = ggplot2::element_blank(),
      legend.title = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_text(
        angle = 0, hjust = 1, vjust = 1, margin = ggplot2::margin(r = 2),
        face = "bold", size = 6.5
      ),
      axis.text.x = ggplot2::element_text(margin = ggplot2::margin(t = 5), size = 6.5),
      axis.text.y = ggplot2::element_text(margin = ggplot2::margin(r = 2), size = 6.5)
    ) +
    ggplot2::theme(legend.position = "none") +
    ggplot2::geom_vline(xintercept = min(tab$ano), color = "black", linetype = "solid", size = 0.35) +
    ggplot2::geom_hline(yintercept = 0, color = "black", linetype = "solid", size = 0.35) +
    ggplot2::theme(panel.grid = ggplot2::element_blank(), panel.grid.minor = ggplot2::element_blank())
}


#' Gráfico do Capítulo VI
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_potencial_hidreletrico <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_potencial_hidreletrico") |>
    dplyr::collect()

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
  }

  tab |>
    ggplot2::ggplot() +
    ggplot2::geom_line(ggplot2::aes(x = ano, y = y, color = grupo), size = 0.75) +
    ggplot2::labs(x = "", y = "MW") +
    ggplot2::theme_minimal() +
    ggplot2::scale_x_continuous(
      expand = c(0, 0),
      breaks = seq(min(tab$ano),
        max(tab$ano),
        by = 5
      )
    ) +
    ggplot2::scale_y_continuous(
      breaks = seq(0, 150000, by = 30000),
      labels = scales::number_format(decimal.mark = "."),
      limits = c(0, 150000)
    ) +
    ggplot2::theme(
      legend.title = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_text(
        angle = 0, hjust = 1, vjust = 1, margin = ggplot2::margin(r = 2),
        face = "bold", size = 6.5
      ),
      axis.text.x = ggplot2::element_text(margin = ggplot2::margin(t = 5), size = 6.5),
      axis.text.y = ggplot2::element_text(margin = ggplot2::margin(r = 2), size = 6.5)
    ) +
    ggplot2::theme(legend.position = "top") +
    ggplot2::geom_vline(
      xintercept = min(tab$ano),
      color = "black", linetype = "solid", size = 0.35
    ) +
    ggplot2::geom_hline(yintercept = 0, color = "black", linetype = "solid", size = 0.35) +
    ggplot2::theme(panel.grid = ggplot2::element_blank(), panel.grid.minor = ggplot2::element_blank())
}


#' Gráfico do Capítulo VI
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_reservas_carvao_mineral <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_reservas_carvao_mineral") |>
    dplyr::collect()

  tab |>
    ggplot2::ggplot(ggplot2::aes(x = ano, y = y)) +
    ggplot2::geom_area(color = "#404040", size = 0.25, fill = "#a5a5a5") +
    ggplot2::labs(x = "", y = expression(10^6*" t")) +
    ggplot2::theme_minimal() +
    ggplot2::scale_x_continuous(
      expand = c(0, 0),
      breaks = seq(min(tab$ano),
        max(tab$ano),
        by = 5
      )
    ) +
    ggplot2::scale_y_continuous(
      breaks = seq(0, 35000, by = 5000),
      labels = scales::number_format(decimal.mark = "."),
      limits = c(0, 35000)
    ) +
    ggplot2::theme(
      legend.text = ggplot2::element_blank(),
      legend.title = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_text(
        angle = 0, hjust = 1, vjust = 1, margin = ggplot2::margin(r = 2),
        face = "bold", size = 6.5
      ),
      axis.text.x = ggplot2::element_text(margin = ggplot2::margin(t = 5), size = 6.5),
      axis.text.y = ggplot2::element_text(margin = ggplot2::margin(r = 2), size = 6.5)
    ) +
    ggplot2::theme(legend.position = "none") +
    ggplot2::geom_vline(xintercept = min(tab$ano), color = "black", linetype = "solid", size = 0.35) +
    ggplot2::geom_hline(yintercept = 0, color = "black", linetype = "solid", size = 0.35) +
    ggplot2::theme(panel.grid = ggplot2::element_blank(), panel.grid.minor = ggplot2::element_blank())
}

#' Gráfico do Capítulo VI
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_reservas_uranio <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_reservas_uranio") |>
    dplyr::collect()

  tab |>
    ggplot2::ggplot(ggplot2::aes(x = ano, y = y)) +
    ggplot2::geom_area(color = "#404040", size = 0.25, fill = "#FFCC00") +
    ggplot2::labs(x = "", y = expression(U[3]*O[8]*"(t)")) +
    ggplot2::theme_minimal() +
    ggplot2::scale_x_continuous(
      expand = c(0, 0),
      breaks = seq(min(tab$ano),
        max(tab$ano),
        by = 5
      )
    ) +
    ggplot2::scale_y_continuous(
      breaks = seq(0,350000, by = 50000),
      labels = scales::number_format(decimal.mark = "."),
      limits = c(0, 350000)
    ) +
    ggplot2::theme(
      legend.text = ggplot2::element_blank(),
      legend.title = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_text(
        angle = 0, hjust = 1, vjust = 1, margin = ggplot2::margin(r = 2),
        face = "bold", size = 6.5
      ),
      axis.text.x = ggplot2::element_text(margin = ggplot2::margin(t = 5), size = 6.5),
      axis.text.y = ggplot2::element_text(margin = ggplot2::margin(r = 2), size = 6.5)
    ) +
    ggplot2::theme(legend.position = "none") +
    ggplot2::geom_vline(xintercept = min(tab$ano), color = "black", linetype = "solid", size = 0.35) +
    ggplot2::geom_hline(yintercept = 0, color = "black", linetype = "solid", size = 0.35) +
    ggplot2::theme(panel.grid = ggplot2::element_blank(), panel.grid.minor = ggplot2::element_blank())
}


#' Gráfico do Anexo 1
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
grafico_capacidade_instalada_geracao_eletrica <- function(con, lang = "pt") {
  tab <- dplyr::tbl(con, "grafico_capacidade_instalada_geracao_eletrica") |>
    dplyr::collect()

  rotulo_y <- "MW"

  grafico_linha(
    tab = tab,
    rotulo_y = rotulo_y,
    lang = lang
  )
}