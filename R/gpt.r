#' Gráfico do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_total_geracao_centrais_eletr_renov_nao_renov <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, laby = "") {
  tab <- dplyr::tbl(con, "grafico_total_geracao_centrais_eletr_renov_nao_renov") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = laby,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = laby,
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
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_total_geracao_centrais_eletr_por_fonte <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, laby = "") {
  tab <- dplyr::tbl(con, "grafico_total_geracao_centrais_eletr_por_fonte") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = laby,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = laby,
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
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_total_geracao_centrais_eletr_servico_pub_renov_nao_renov <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, laby = "") {
  tab <- dplyr::tbl(con, "grafico_total_geracao_centrais_eletr_servico_pub_renov_nao_renov") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = laby,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = laby,
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
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_total_geracao_centrais_eletr_servico_pub_por_fonte <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, laby = "") {
  tab <- dplyr::tbl(con, "grafico_total_geracao_centrais_eletr_servico_pub_por_fonte") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = laby,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = laby,
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
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_total_geracao_centrais_eletr_autoprod_renov_nao_renov <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, laby = "") {
  tab <- dplyr::tbl(con, "grafico_total_geracao_centrais_eletr_autoprod_renov_nao_renov") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = laby,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = laby,
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
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_total_geracao_centrais_eletr_autoprod_por_fonte <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, laby = "") {
  tab <- dplyr::tbl(con, "grafico_total_geracao_centrais_eletr_autoprod_por_fonte") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = laby,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = laby,
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
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_autoprod_nao_injetada_renov_nao_renov <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, laby = "") {
  tab <- dplyr::tbl(con, "grafico_autoprod_nao_injetada_renov_nao_renov") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = laby,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = laby,
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
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_autoprod_nao_injetada_por_fonte <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, laby = "") {
  tab <- dplyr::tbl(con, "grafico_autoprod_nao_injetada_por_fonte") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = laby,
      lang = lang
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = laby,
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