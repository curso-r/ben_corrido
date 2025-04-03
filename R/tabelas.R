# Capítulo I -------------------------------------------------------------------

#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_producao_energia_primaria <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_producao_energia_primaria"
  
  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
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
tab_oferta_interna_energia <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_oferta_interna_energia"
  
  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
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
tab_consumo_final_fonte <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_consumo_final_fonte"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    tab_name = tab_name,
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
tab_consumo_final_setor <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_consumo_final_setor"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    tab_name = tab_name,
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
tab_consumo_final_energetico_fonte <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_consumo_final_energetico_fonte"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
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
tab_consumo_final_nao_energetico_fonte <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_consumo_final_nao_energetico_fonte"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
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
tab_dependencia_externa_energia <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_dependencia_externa_energia"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_simples(
    tab = tab,
    tab_name = tab_name,
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
tab_composicao_setorial_consumo_derivados_petroleo <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_composicao_setorial_consumo_derivados_petroleo"
  
  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
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
tab_composicao_setorial_consumo_eletricidade <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_composicao_setorial_consumo_eletricidade"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
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
tab_composicao_setorial_consumo_carvao_vapor <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_composicao_setorial_consumo_carvao_vapor"
  
  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
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
tab_composicao_setorial_consumo_final_biomassa <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_composicao_setorial_consumo_final_biomassa"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
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
tab_oferta_interna_energia_2 <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_oferta_interna_energia_2"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_simples(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fontes",
    min_width = 220
  )
}

# Capítulo II -------------------------------------------------------------------

#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_total_fontes_primarias <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_total_fontes_primarias"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_4(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fluxo",
    lab2 = "",
    lab3 = "",
    lab4 = "",
    lab5 = "",
    min_width = 220
  )
}

#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_petroleo <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_petroleo"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fluxo",
    lab2 = "",
    min_width = 220
  )
}


#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_gas_natural <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_gas_natural"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_4(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fluxo",
    lab2 = "",
    lab3 = "",
    lab4 = "",
    lab5 = "",
    min_width = 220
  )
}

#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_carvao_vapor <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_carvao_vapor"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_4(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fluxo",
    lab2 = "",
    lab3 = "",
    lab4 = "",
    lab5 = "",
    min_width = 220
  )
}

#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_carvao_metalurgico <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_carvao_metalurgico"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fluxo",
    lab2 = "",
    lab3 = "",
    min_width = 220
  )
}

#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_carvao_metalurgico <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_carvao_metalurgico"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fluxo",
    lab2 = "",
    lab3 = "",
    min_width = 220
  )
}

#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_energia_hidraulica <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_energia_hidraulica"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fluxo",
    lab2 = "",
    lab3 = "",
    min_width = 220
  )
}

#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_energia_eolica <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_energia_eolica"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_simples(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fluxo",
    min_width = 220
  )
}

#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_energia_solar_fotovoltaica <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_energia_solar_fotovoltaica"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_simples(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fluxo",
    min_width = 220
  )
}

#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_energia_solar_termica <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_energia_solar_termica"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fluxo",
    lab2 = "",
    lab3 = "",
    min_width = 220
  )
}

#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_uranio <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_uranio"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fluxo",
    lab2 = "",
    min_width = 220
  )
}