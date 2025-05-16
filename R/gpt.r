# Capítulo I -------------------------------------------------------------------

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#' @param lab2 Label 2
#'
#' @export
tab_producao_energia_primaria <- function(con, lang = "pt", .tipo_dado, lab1 = "", lab2 = "") {
  tab_name <- "tab_producao_energia_primaria"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = lab1,
    lab2 = lab2,
    min_width = 100
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#' @param lab2 Label 2
#'
#' @export
tab_oferta_interna_energia <- function(con, lang = "pt", .tipo_dado, lab1 = "", lab2 = "") {
  tab_name <- "tab_oferta_interna_energia"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = lab1,
    lab2 = lab2,
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#' @param lab2 Label 2
#' @param lab3 Label 3
#'
#' @export
tab_consumo_final_fonte <- function(con, lang = "pt", .tipo_dado, lab1 = "", lab2 = "", lab3 = "") {
  tab_name <- "tab_consumo_final_fonte"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = lab1,
    lab2 = lab2,
    lab3 = lab3,
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#' @param lab2 Label 2
#' @param lab3 Label 3
#'
#' @export
tab_consumo_final_setor <- function(con, lang = "pt", .tipo_dado, lab1 = "", lab2 = "", lab3 = "") {
  tab_name <- "tab_consumo_final_setor"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = lab1,
    lab2 = lab2,
    lab3 = lab3,
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#' @param lab2 Label 2
#'
#' @export
tab_consumo_final_energetico_fonte <- function(con, lang = "pt", .tipo_dado, lab1 = "", lab2 = "") {
  tab_name <- "tab_consumo_final_energetico_fonte"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = lab1,
    lab2 = lab2,
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#' @param lab2 Label 2
#'
#' @export
tab_consumo_final_nao_energetico_fonte <- function(con, lang = "pt", .tipo_dado, lab1 = "", lab2 = "") {
  tab_name <- "tab_consumo_final_nao_energetico_fonte"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = lab1,
    lab2 = lab2,
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#'
#' @export
tab_dependencia_externa_energia <- function(con, lang = "pt", .tipo_dado, lab1 = "") {
  tab_name <- "tab_dependencia_externa_energia"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_simples(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = lab1,
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#' @param lab2 Label 2
#'
#' @export
tab_composicao_setorial_consumo_derivados_petroleo <- function(con, lang = "pt", .tipo_dado, lab1 = "", lab2 = "") {
  tab_name <- "tab_composicao_setorial_consumo_derivados_petroleo"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = lab1,
    lab2 = lab2,
    min_width = 250
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#' @param lab2 Label 2
#'
#' @export
tab_composicao_setorial_consumo_eletricidade <- function(con, lang = "pt", .tipo_dado, lab1 = "", lab2 = "") {
  tab_name <- "tab_composicao_setorial_consumo_eletricidade"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = lab1,
    lab2 = lab2,
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#' @param lab2 Label 2
#'
#' @export
tab_composicao_setorial_consumo_carvao_vapor <- function(con, lang = "pt", .tipo_dado, lab1 = "", lab2 = "") {
  tab_name <- "tab_composicao_setorial_consumo_carvao_vapor"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = lab1,
    lab2 = lab2,
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#' @param lab2 Label 2
#'
#' @export
tab_composicao_setorial_consumo_final_biomassa <- function(con, lang = "pt", .tipo_dado, lab1 = "", lab2 = "") {
  tab_name <- "tab_composicao_setorial_consumo_final_biomassa"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = lab1,
    lab2 = lab2,
    min_width = 220
  )
}

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#'
#' @export
tab_oferta_interna_energia_2 <- function(con, lang = "pt", .tipo_dado, lab1 = "") {
  tab_name <- "tab_oferta_interna_energia_2"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_simples(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = lab1,
    min_width = 220
  )
}