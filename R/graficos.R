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
