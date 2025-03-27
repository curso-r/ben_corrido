# Capítulo I -------------------------------------------------------------------

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_producao_energia_primaria <- function(con, lang = "pt", .tipo_dado = "Absoluto") {
  tab <- dplyr::tbl(con, "tab_producao_energia_primaria") |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Renovabilidade",
    lab2 = "Fonte",
    min_width = 100
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_oferta_interna_energia <- function(con, lang = "pt", .tipo_dado = "Absoluto") {
  tab <- dplyr::tbl(con, "tab_oferta_interna_energia") |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Renovabilidade",
    lab2 = "Fonte",
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_consumo_final_fonte <- function(con, lang = "pt", .tipo_dado = "Absoluto") {
  tab <- dplyr::tbl(con, "tab_consumo_final_fonte") |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fontes",
    lab2 = "Derivados",
    lab3 = "",
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_consumo_final_setor <- function(con, lang = "pt", .tipo_dado = "Absoluto") {
  tab <- dplyr::tbl(con, "tab_consumo_final_setor") |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Identificação",
    lab2 = "Setor",
    lab3 = "",
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_consumo_final_energetico_fonte <- function(con, lang = "pt", .tipo_dado = "Absoluto") {
  tab <- dplyr::tbl(con, "tab_consumo_final_energetico_fonte") |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fonte",
    lab2 = "Derivados",
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_consumo_final_nao_energetico_fonte <- function(con, lang = "pt", .tipo_dado = "Absoluto") {
  tab <- dplyr::tbl(con, "tab_consumo_final_nao_energetico_fonte") |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fonte",
    lab2 = "Derivados",
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_dependencia_externa_energia <- function(con, lang = "pt", .tipo_dado = "Absoluto") {
  tab <- dplyr::tbl(con, "tab_dependencia_externa_energia") |>
    dplyr::collect()

  reactable_painel_simples(
    tab = tab,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Identificação",
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_composicao_setorial_consumo_derivados_petroleo <- function(con, lang = "pt", .tipo_dado = "Absoluto") {
  tab <- dplyr::tbl(con, "tab_composicao_setorial_consumo_derivados_petroleo") |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Identificação",
    lab2 = "",
    min_width = 250
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_composicao_setorial_consumo_eletricidade <- function(con, lang = "pt", .tipo_dado = "Absoluto") {
  tab <- dplyr::tbl(con, "tab_composicao_setorial_consumo_eletricidade") |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Setores",
    lab2 = "",
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_composicao_setorial_consumo_carvao_vapor <- function(con, lang = "pt", .tipo_dado = "Absoluto") {
  tab <- dplyr::tbl(con, "tab_composicao_setorial_consumo_carvao_vapor") |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Setores",
    lab2 = "",
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_composicao_setorial_consumo_final_biomassa <- function(con, lang = "pt", .tipo_dado = "Absoluto") {
  tab <- dplyr::tbl(con, "tab_composicao_setorial_consumo_final_biomassa") |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Setores",
    lab2 = "",
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_oferta_interna_energia_2 <- function(con, lang = "pt", .tipo_dado = "Absoluto") {
  tab <- dplyr::tbl(con, "tab_oferta_interna_energia_2") |>
    dplyr::collect()

  reactable_painel_simples(
    tab = tab,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fontes",
    min_width = 220
  )
}

# Capítulo II -------------------------------------------------------------------