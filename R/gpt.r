#' Gráfico do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param laby Rótulo do eixo y
#'
#' @export
grafico_estrutura_consumo_fontes_primarias <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_fontes_primarias") |>
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
grafico_fontes_primarias <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_fontes_primarias") |>
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
grafico_petroleo <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_petroleo") |>
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
grafico_estrutura_consumo_gas_natural <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_gas_natural") |>
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
grafico_carvao_vapor <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_carvao_vapor") |>
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
grafico_transformacao_energia_hidraulica <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_transformacao_energia_hidraulica") |>
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
grafico_consumo_energia_solar_termica_setor <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_consumo_energia_solar_termica_setor") |>
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
grafico_uranio <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_uranio") |>
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
grafico_estrutura_consumo_lenha <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_lenha") |>
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
grafico_estrutura_consumo_bagaco_cana <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_bagaco_cana") |>
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
grafico_estrutura_consumo_lixivia <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_lixivia") |>
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
grafico_estrutura_consumo_outras_fontes_primarias <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_outras_fontes_primarias") |>
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
grafico_estrutura_consumo_outras_fontes_secundarias <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_estrutura_consumo_outras_fontes_secundarias") |>
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
grafico_fontes_secundarias <- function(con, lang = "pt", .tipo_dado, laby = "") {
  tab <- dplyr::tbl(con, "grafico_fontes_secundarias") |>
    dplyr::collect() |>
    dplyr::filter(tipo_dado == .tipo_dado)

  grafico_linha(
    tab = tab,
    rotulo_y = laby,
    lang = lang,
    .cap = 2
  )
}
