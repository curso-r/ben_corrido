#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_producao_energia_primaria <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, laby = "") {
  tab <- dplyr::tbl(con, "grafico_producao_energia_primaria") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
    )
  }
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_oferta_interna_energia <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, laby = "") {
  tab <- dplyr::tbl(con, "grafico_oferta_interna_energia") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
    )
  }
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_consumo_final_fonte <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, laby = "") {
  tab <- dplyr::tbl(con, "grafico_consumo_final_fonte") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
    )
  }
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_consumo_final_setor <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, laby = "") {
  tab <- dplyr::tbl(con, "grafico_consumo_final_setor") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
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
      cor = pegar_cor(grupo, cap = 1)
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
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_composicao_setorial_consumo_derivados_petroleo <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, laby = "") {
  tab <- dplyr::tbl(con, "grafico_composicao_setorial_consumo_derivados_petroleo") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
    )
  }
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_composicao_setorial_consumo_eletricidade <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, laby = "") {
  tab <- dplyr::tbl(con, "grafico_composicao_setorial_consumo_eletricidade") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
    )
  }
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_composicao_setorial_consumo_carvao_vapor <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, laby = "") {
  tab <- dplyr::tbl(con, "grafico_composicao_setorial_consumo_carvao_vapor") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
    )
  }
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_composicao_setorial_consumo_biomassa <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, laby = "") {
  tab <- dplyr::tbl(con, "grafico_composicao_setorial_consumo_biomassa") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
    )
  }
}

#' Gráfico do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .tipo_grafico Tipo de gráfico
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_oferta_interna_energia_2 <- function(con, lang = "pt", .tipo_dado, .tipo_grafico, laby = "") {
  tab <- dplyr::tbl(con, "grafico_oferta_interna_energia_2") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  if (.tipo_grafico == "area") {
    grafico_area(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
    )
  } else if (.tipo_grafico == "linha") {
    grafico_linha(
      tab = tab,
      rotulo_y = laby,
      lang = lang,
      .cap = 1
    )
  }
}
