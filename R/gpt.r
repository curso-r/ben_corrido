#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_estrutura_consumo_derivados_petrolo_gas_natural <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_derivados_petrolo_gas_natural") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  grafico_linha(
    tab = tab,
    rotulo_y = laby,
    lang = lang,
    .cap = 2
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_oleo_diesel_total <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_oleo_diesel_total") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  grafico_linha(
    tab = tab,
    rotulo_y = laby,
    lang = lang,
    .cap = 2
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_diesel_petroleo <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_diesel_petroleo") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  grafico_linha(
    tab = tab,
    rotulo_y = laby,
    lang = lang,
    .cap = 2
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_oleo_combustivel <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_oleo_combustivel") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  grafico_linha(
    tab = tab,
    rotulo_y = laby,
    lang = lang,
    .cap = 2
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_gasolina <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_gasolina") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  grafico_linha(
    tab = tab,
    rotulo_y = laby,
    lang = lang,
    .cap = 2
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_glp <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_glp") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  grafico_linha(
    tab = tab,
    rotulo_y = laby,
    lang = lang,
    .cap = 2
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_estrutura_consumo_nafta <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_nafta") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  grafico_linha(
    tab = tab,
    rotulo_y = laby,
    lang = lang,
    .cap = 2
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_nafta <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_nafta") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  grafico_linha(
    tab = tab,
    rotulo_y = laby,
    lang = lang,
    .cap = 2
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_coque_carvao_mineral <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_coque_carvao_mineral") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  grafico_linha(
    tab = tab,
    rotulo_y = laby,
    lang = lang,
    .cap = 2
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_querosene <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_querosene") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  grafico_linha(
    tab = tab,
    rotulo_y = laby,
    lang = lang,
    .cap = 2
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_estrutura_consumo_gas_coqueria <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_gas_coqueria") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  grafico_linha(
    tab = tab,
    rotulo_y = laby,
    lang = lang,
    .cap = 2
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_consumo_final_eletricidade_setor <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_consumo_final_eletricidade_setor") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  grafico_linha(
    tab = tab,
    rotulo_y = laby,
    lang = lang,
    .cap = 2
  )
}

#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_estrutura_consumo_alcool_etilico <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_alcool_etilico") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  grafico_linha(
    tab = tab,
    rotulo_y = laby,
    lang = lang,
    .cap = 2
  )
}