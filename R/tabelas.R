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

#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_lenha <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_lenha"

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
tab_caldo_cana <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_caldo_cana"

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
tab_melaco <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_melaco"

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
tab_bagaco_cana <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_bagaco_cana"

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
tab_lixivia <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_lixivia"

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
tab_outras_fontes_primarias <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_outras_fontes_primarias"

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
tab_total_fontes_secundarias <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_total_fontes_secundarias"

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
tab_derivados_petroleo_e_gas_natural <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_derivados_petroleo_e_gas_natural"

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
tab_oleo_diesel_total <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_oleo_diesel_total"

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
tab_diesel_petroleo <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_diesel_petroleo"

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
tab_biodiesel <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_biodiesel"

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
tab_oleo_combustivel <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_oleo_combustivel"

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
tab_gasolina <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_gasolina"

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
tab_gas_liquefeito_de_petroleo <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_gas_liquefeito_de_petroleo"

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
tab_nafta <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_nafta"

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
tab_coque_carvao_mineral <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_coque_carvao_mineral"

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
tab_querosene <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_querosene"

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
tab_gas_cidade <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_gas_cidade"

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
tab_gas_coqueira <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_gas_coqueira"

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
tab_eletricidade <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_eletricidade"

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
tab_carvao_vegetal <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_carvao_vegetal"

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
tab_alcool_etilico_total <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_alcool_etilico_total"

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
tab_alcool_anidro <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_alcool_anidro"

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
tab_alcool_hidratado <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_alcool_hidratado"

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
tab_outras_secundarias_petroleo <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_outras_secundarias_petroleo"

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
tab_alcatrao <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_alcatrao"

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
tab_produtos_nao_energeticos_petroleo <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_produtos_nao_energeticos_petroleo"

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

#' Tabela do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_setor_energetico <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_setor_energetico"

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

#' Tabela do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_setor_comercial <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_setor_comercial"

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

#' Tabela do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_setor_publico <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_setor_publico"

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

#' Tabela do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_setor_residencial <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_setor_residencial"

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

#' Tabela do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_setor_agropecuario <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_setor_agropecuario"

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


#' Tabela do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_setor_transportes_geral <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_setor_transportes_geral"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fontes",
    lab2 = "",
    min_width = 100
  )
}


#' Tabela do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .segmento Segmento do setor de transportes
#'
#' @export
tab_setor_transportes_segmento <- function(con, lang = "pt", .tipo_dado, .segmento) {
  tab_name <- "tab_setor_transportes_segmento"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::filter(dado == .segmento) |>
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

#' Tabela do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_setor_industrial_geral <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_setor_industrial_geral"

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

#' Tabela do Capítulo III
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param .segmento Segmento do setor de transportes
#'
#' @export
tab_setor_industrial_segmento <- function(con, lang = "pt", .tipo_dado, .segmento) {
  tab_name <- "tab_setor_industrial_segmento"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::filter(dado == .segmento) |>
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

#' Tabela do Capítulo IV
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_dependencia_externa_energia_2 <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_dependencia_externa_energia_2"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Identificação",
    lab2 = "",
    min_width = 260
  )
}

#' Tabela do Capítulo IV
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_dependencia_externa_petroleo <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_dependencia_externa_petroleo"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Identificação",
    lab2 = "",
    min_width = 280
  )
}

#' Tabela do Capítulo IV
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_importacoes_energia <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_importacoes_energia"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fonte",
    lab2 = "",
    lab3 = "",
    min_width = 250
  )
}

#' Tabela do Capítulo IV
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_exportacoes_energia <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_exportacoes_energia"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fonte",
    lab2 = "",
    lab3 = "",
    min_width = 250
  )
}

#' Tabela do Capítulo IV
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_exportacoes_importacoes_liquidas <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_exportacoes_importacoes_liquidas"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fonte",
    lab2 = "",
    min_width = 250
  )
}

#' Tabela do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_refinarias_petroleo <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_refinarias_petroleo"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fonte",
    lab2 = "",
    min_width = 260
  )
}

#' Tabela do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_unidades_processamento_gas_natural <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_unidades_processamento_gas_natural"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_simples(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fonte",
    min_width = 250
  )
}

#' Tabela do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_centrais_eletricas_total <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_centrais_eletricas_total"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Identificação",
    lab2 = "",
    lab3 = "",
    min_width = 250
  )
}

#' Tabela do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_centrais_eletricas_servico_publico <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_centrais_eletricas_servico_publico"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Identificação",
    lab2 = "",
    lab3 = "",
    min_width = 250
  )
}

#' Tabela do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_centrais_eletricas_autoprodutoras <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_centrais_eletricas_autoprodutoras"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Identificação",
    lab2 = "",
    lab3 = "",
    min_width = 250
  )
}

#' Tabela do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_autoproducao_nao_injetada_rede <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_autoproducao_nao_injetada_rede"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Identificação",
    lab2 = "",
    lab3 = "",
    min_width = 250
  )
}

#' Tabela do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_micro_mini_geracao_distribuida <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_micro_mini_geracao_distribuida"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Identificação",
    lab2 = "",
    lab3 = "",
    min_width = 250
  )
}

#' Tabela do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_coqueiras <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_coqueiras"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fonte",
    lab2 = "",
    min_width = 250
  )
}

#' Tabela do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_destilarias <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_destilarias"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fonte",
    lab2 = "",
    min_width = 250
  )
}

#' Tabela do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_plantas_biodiesel <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_plantas_biodiesel"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fonte",
    lab2 = "",
    min_width = 250
  )
}

#' Tabela do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_ciclo_combustivel_nuclear <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_ciclo_combustivel_nuclear"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fonte",
    lab2 = "",
    min_width = 250
  )
}

#' Tabela do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_carvoarias <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_carvoarias"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fonte",
    lab2 = "",
    min_width = 250
  )
}

#' Tabela do Capítulo V
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_usinas_gaseificacao <- function(con, lang = "pt", .tipo_dado) {
  tab_name <- "tab_usinas_gaseificacao"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_1(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = "Fonte",
    lab2 = "",
    min_width = 250
  )
}

#' Tabela do Capítulo VI
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_recursos_reservas_energeticas_brasileiras_1 <- function(con, lang = "pt") {
  tab_name <- glue::glue("tab_recursos_reservas_energeticas_brasileiras_1_{lang}")

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_tabela_simples(
    tab = tab,
    tab_name = tab_name,
    lang = lang,
    columns = list(
      grupo = reactable::colDef(
        name = ""
      )
    )
  )
}

#' Tabela do Capítulo VI
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_recursos_reservas_energeticas_brasileiras_2 <- function(con, lang = "pt") {
  tab_name <- glue::glue("tab_recursos_reservas_energeticas_brasileiras_2_{lang}")

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_tabela_simples(
    tab = tab,
    tab_name = tab_name,
    lang = lang,
    columns = list(
      grupo = reactable::colDef(
        name = ""
      )
    )
  )
}

#' Tabela do Capítulo VI
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_reservas_provadas_petroleo_gas <- function(con, lang = "pt") {
  tab_name <- glue::glue("tab_reservas_provadas_petroleo_gas_{lang}")

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_tabela_simples(
    tab = tab,
    tab_name = tab_name,
    lang = lang,
    fullWidth = FALSE,
    width = "500px"
  )
}

#' Tabela do Capítulo VI
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_recursos_hidraulicos <- function(con, lang = "pt") {
  tab_name <- glue::glue("tab_recursos_hidraulicos_{lang}")

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_tabela_simples(
    tab = tab,
    tab_name = tab_name,
    lang = lang,
  )
}

#' Tabela do Capítulo VI
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_reservas_carvao_mineral_turfa <- function(con, lang = "pt") {
  tab_name <- glue::glue("tab_reservas_carvao_mineral_turfa_{lang}")

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  nome_colunas <- names(tab)

  if (lang == "pt") {
    column_groups <- list(
      reactable::colGroup("Carvão Mineral", columns = nome_colunas[2:4])
    )
  } else {
    column_groups <- list(
      reactable::colGroup("Mineral Coal", columns = nome_colunas[2:4])
    )
  }

  reactable_tabela_simples(
    tab = tab,
    tab_name = tab_name,
    lang = lang,
    width = "600px",
    columnGroups = column_groups,
    columns = list(
      ano = reactable::colDef(
        name = "",
        align = "left"
      )
    )
  )
}

#' Tabela do Capítulo VI
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_reservas_uranio <- function(con, lang = "pt") {
  tab_name <- glue::glue("tab_reservas_uranio_{lang}")

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_tabela_simples(
    tab = tab,
    tab_name = tab_name,
    lang = lang,
    width = "300px"
  )
}

# Capítulo VII -------------------------------------------------------------------

#' Tabela do Capítulo VII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_oferta_interna_energia_pib_populacao <- function(con, lang = "pt") {
  tab_name <- "tab_oferta_interna_energia_pib_populacao"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
  }

  locale <- pegar_locale(lang)

  menor_ano <- determinar_menor_ano(tab$ano)

  tab_long <- tab |>
    dplyr::filter(
      ano > menor_ano
    ) |>
    dplyr::select(grupo, Unidade, ano, total)

  tab_wide <- tab_long |>
    tidyr::pivot_wider(
      names_from = ano,
      values_from = total
    )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      sortable = FALSE,
      resizable = TRUE,
      theme = tema_reactable(),
      defaultColDef = reactable::colDef(
        minWidth = 90,
        align = "center",
        format = reactable::colFormat(
          separators = TRUE,
          locales = locale
        )
      ),
      columns = list(
        Unidade = reactable::colDef(
          width = 130
        ),
        grupo = reactable::colDef(
          name = "",
          align = "left",
          minWidth = 220,
          width = 220,
          sticky = "left"
        )
      )
    )
}

#' Tabela do Capítulo VII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_oferta_interna_energeticos_pib <- function(con, lang = "pt") {
  tab_name <- "tab_oferta_interna_energeticos_pib"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_simples(
    tab = tab,
    tab_name = tab_name,
    lang = lang,
    lab1 = "",
    min_width = 220,
    casas_dec = 3
  )
}

#' Tabela do Capítulo VII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_consumo_final_energetico <- function(con, lang = "pt") {
  tab_name <- "tab_consumo_final_energetico"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    tab_name = tab_name,
    lang = lang,
    lab1 = "",
    lab2 = "",
    lab3 = "",
    min_width = 220,
    casas_dec = 0
  )
}

#' Tabela do Capítulo VII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_produto_interno_bruto_setorial <- function(con, lang = "pt") {
  tab_name <- "tab_produto_interno_bruto_setorial"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_2(
    tab = tab,
    tab_name = tab_name,
    lang = lang,
    lab1 = "",
    lab2 = "",
    lab3 = "",
    min_width = 220,
    casas_dec = 0
  )
}

#' Tabela do Capítulo VII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_consumo_final_energia_setor_pib_setor <- function(con, lang = "pt") {
  tab_name <- "tab_consumo_final_energia_setor_pib_setor"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
  }

  tab_padding <- tab |>
    dplyr::distinct(grupo) |>
    dplyr::mutate(
      paddingLeft = dplyr::case_when(
        grupo %in% c("Consumo Final Energético Com Residencial", "Consumo Final Energético Sem Residencial") ~ "5px",
        grupo %in% c("Serviços", "Agropecuário", "Indústria", "Setor Energético") ~ "20px",
        grupo %in% c("Comércio e Outros", "Transportes", "Extrativa Mineral", "Transformação") ~ "40px",
        TRUE ~ "80px"
      )
    )

  tab_wide <- tab |>
    dplyr::select(-dplyr::matches("grupo_"))

  tab_long <- tab_wide |>
    tidyr::pivot_longer(
      cols = -grupo,
      names_to = "ano",
      values_to = "total"
    )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  reactable::reactable(
    tab_wide,
    defaultPageSize = 20,
    striped = TRUE,
    theme = reactable::reactableTheme(
      borderColor = "black",
      style = list(
        fontSize = "85%"
      )
    ),
    defaultColDef = reactable::colDef(
      align = "center",
      format = reactable::colFormat(
        digits = 1,
        separators = TRUE,
        locales = locale
      )
    ),
    columns = list(
      grupo = reactable::colDef(
        name = "Identificação",
        align = "left",
        minWidth = 100,
        width = 500,
        style = function(value, index) {
          paddingLeft <- tab_padding$paddingLeft[tab_padding$grupo == value]
          list(paddingLeft = paddingLeft)
        }
      )
    )
  )
}

#' Tabela do Capítulo VII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_setor_residencial_energia_populacao <- function(con, lang = "pt") {
  tab_name <- "tab_setor_residencial_energia_populacao"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
  }

  locale <- pegar_locale(lang)

  menor_ano <- determinar_menor_ano(tab$ano)

  tab_long <- tab |>
    dplyr::filter(
      ano > menor_ano
    ) |>
    dplyr::select(grupo, Unidade, ano, total)

  tab_wide <- tab_long |>
    dplyr::mutate(
      total = dplyr::case_when(
        grupo %in% c(
          "Consumo Final de Energia (1)",
          "Consumo Final de Energia Para Cocção (2)",
          "Consumo de Eletricidade (3)",
          "População Residente (4)"
        ) ~ scales::number(total, accuracy = 1, decimal.mark = ",", big.mark = "."),
        TRUE ~ scales::number(total, accuracy = 0.001, decimal.mark = ",", big.mark = ".")
      )
    ) |>
    tidyr::pivot_wider(
      names_from = ano,
      values_from = total
    )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      sortable = FALSE,
      resizable = TRUE,
      theme = tema_reactable(),
      defaultColDef = reactable::colDef(
        minWidth = 90,
        align = "center",
        format = reactable::colFormat(
          separators = TRUE,
          locales = locale
        )
      ),
      columns = list(
        Unidade = reactable::colDef(
          width = 110
        ),
        grupo = reactable::colDef(
          name = "",
          align = "left",
          minWidth = 260,
          sticky = "left"
        )
      )
    )
}

#' Tabela do Capítulo VII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_setor_transportes_energia_pib_setor <- function(con, lang = "pt") {
  tab_name <- "tab_setor_transportes_energia_pib_setor"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
  }

  locale <- pegar_locale(lang)

  menor_ano <- determinar_menor_ano(tab$ano)

  tab_long <- tab |>
    dplyr::filter(
      ano > menor_ano
    ) |>
    dplyr::select(grupo, Unidade, ano, total)

  tab_wide <- tab_long |>
    dplyr::mutate(
      total = dplyr::case_when(
        grupo %in% c(
          "Consumo Final de Energia (1)",
          "Consumo Exclusive Gasolina, Etanol e Gás Natural (2)"
        ) ~ scales::number(total, accuracy = 1, decimal.mark = ",", big.mark = "."),
        grupo %in% c(
          "PIB Do Setor (3)",
          "PIB Total (4)"
        ) ~ scales::number(total, accuracy = 0.1, decimal.mark = ",", big.mark = "."),
        grupo %in% c(
          "(1)/(3)",
          "(2)/(3)"
        ) ~ scales::number(total, accuracy = 0.01, decimal.mark = ",", big.mark = "."),
        grupo %in% c(
          "(1)/(4)"
        ) ~ scales::number(total, accuracy = 0.001, decimal.mark = ",", big.mark = ".")
      )
    ) |>
    tidyr::pivot_wider(
      names_from = ano,
      values_from = total
    )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      sortable = FALSE,
      resizable = TRUE,
      theme = tema_reactable(),
      defaultColDef = reactable::colDef(
        minWidth = 90,
        align = "center",
        format = reactable::colFormat(
          separators = TRUE,
          locales = locale
        )
      ),
      columns = list(
        Unidade = reactable::colDef(
          width = 250,
          align = "left"
        ),
        grupo = reactable::colDef(
          name = "",
          align = "left",
          minWidth = 400,
          sticky = "left"
        )
      )
    )
}

#' Tabela do Capítulo VII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_consumo_especifico_energia_setores_selecionados <- function(con, lang = "pt", .setor, .segmento) {
  tab_name <- "tab_consumo_especifico_energia_setores_selecionados"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::filter(
      consumo_nivel_1 == .setor,
      consumo_nivel_2 == .segmento
    ) |>
    dplyr::collect()

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
  }

  locale <- pegar_locale(lang)

  menor_ano <- determinar_menor_ano(tab$ano)

  tab_long <- tab |>
    dplyr::filter(
      ano > menor_ano
    ) |>
    dplyr::select(grupo, consumo_nivel_1, consumo_nivel_2, Unidade, ano, total)

  tab_wide <- tab_long |>
    dplyr::mutate(
      total = dplyr::case_when(
        grupo %in% c(
          "Relação Clinquer/Cimento",
          "Consumo Total/Produção",
          "Consumo de Eletricidade/Produção"
        ) ~ scales::number(total, accuracy = 0.001, decimal.mark = ",", big.mark = "."),
        TRUE ~ scales::number(total, accuracy = 1, decimal.mark = ",", big.mark = ".")
      )
    ) |>
    tidyr::pivot_wider(
      names_from = ano,
      values_from = total
    )

  tab_name_download <- glue::glue("{tab_name}_{.setor}_{.segmento}")

  gerar_tabela_download(tab_long, tab_name = tab_name_download, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name_download, .tipo_dado = NULL)

  tab_wide |>
    dplyr::select(-consumo_nivel_1, -consumo_nivel_2) |>
    reactable::reactable(
      striped = TRUE,
      sortable = FALSE,
      resizable = TRUE,
      theme = tema_reactable(),
      defaultColDef = reactable::colDef(
        minWidth = 90,
        align = "center",
        format = reactable::colFormat(
          separators = TRUE,
          locales = locale
        )
      ),
      columns = list(
        Unidade = reactable::colDef(
          width = 110
        ),
        grupo = reactable::colDef(
          name = "",
          align = "left",
          minWidth = 260,
          sticky = "left"
        )
      )
    )
}

#' Tabela do Capítulo VII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_precos_medios_correntes_fontes_energia_1 <- function(con, lang = "pt") {
  tab_name <- "tab_precos_medios_correntes_fontes_energia_1"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
  }

  locale <- pegar_locale(lang)

  menor_ano <- determinar_menor_ano(tab$ano)

  tab_long <- tab |>
    dplyr::filter(
      ano > menor_ano
    ) |>
    dplyr::select(grupo, Unidade, ano, total)

  tab_wide <- tab_long |>
    dplyr::mutate(total = scales::number(total, accuracy = 1, decimal.mark = ",", big.mark = ".")) |>
    tidyr::pivot_wider(
      names_from = ano,
      values_from = total
    )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      sortable = FALSE,
      resizable = TRUE,
      theme = tema_reactable(),
      defaultPageSize = 20,
      defaultColDef = reactable::colDef(
        minWidth = 90,
        align = "center",
        format = reactable::colFormat(
          separators = TRUE,
          locales = locale
        )
      ),
      columns = list(
        Unidade = reactable::colDef(
          width = 110
        ),
        grupo = reactable::colDef(
          name = "",
          align = "left",
          minWidth = 260,
          sticky = "left"
        )
      )
    )
}

#' Tabela do Capítulo VII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_precos_medios_correntes_fontes_energia_2 <- function(con, lang = "pt") {
  tab_name <- "tab_precos_medios_correntes_fontes_energia_2"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_simples(
    tab = tab,
    tab_name = tab_name,
    lang = lang,
    lab1 = "",
    min_width = 260,
    casas_dec = 1
  )
}

#' Tabela do Capítulo VII
#'
#' @param conConexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_relacoes_precos_fontes_energia <- function(con, lang = "pt") {
  tab_name <- "tab_relacoes_precos_fontes_energia"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_simples(
    tab = tab,
    tab_name = tab_name,
    lang = lang,
    lab1 = "",
    min_width = 220
  )
}

#' Tabela do Capítulo VII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#'
#' @export
tab_gastos_divisas_importacao_petroleo <- function(con, lang = "pt") {
  tab_name <- "tab_gastos_divisas_importacao_petroleo"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_simples(
    tab = tab,
    tab_name = tab_name,
    lang = lang,
    lab1 = "",
    min_width = 220
  )
}

# Capítulo VIII ------------------------------------------------------------------

#' Tabela do Capítulo VIII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#' @param lab2 Nome da segunda coluna
#'
#' @export
tab_producao_energia_fosseis_1 <- function(con, lang = "pt", lab1, lab2) {
  tab_name <- "tab_producao_energia_fosseis_1"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$macro_grupo <- tab[[glue::glue("macro_grupo_{lang}")]]
    tab$setor <- tab[[glue::glue("setor_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(macro_grupo, grupo, setor, ano, valor)

  tab_wide <- tab_long |>
    dplyr::mutate(setor_ano = glue::glue("{setor}_{ano}")) |>
    dplyr::select(-setor, -ano) |>
    tidyr::pivot_wider(
      names_from = setor_ano,
      values_from = valor
    )

  colunas <- tab_wide |>
    dplyr::select(-macro_grupo, -grupo) |>
    names()

  setores <- unique(tab$setor)

  col_defs <- purrr::map(
    colunas,
    \(x) {
      nome <- stringr::str_remove(x, ".*_")
      reactable::colDef(
        name = nome,
        aggregate = if (stringr::str_detect(x, "%")) {
          setor <- stringr::str_remove(x, "_.*")
          anos <- nome |>
            stringr::str_extract_all("\\d+", simplify = TRUE) |>
            as.character()

          htmlwidgets::JS(glue::glue(
            "function(values, rows) {
              let totalUltimoAno = 0
              let totalPenultimoAno = 0
              rows.forEach(function(row) {
                totalUltimoAno += row['{{setor}}_20{{anos[1]}}']
                totalPenultimoAno += row['{{setor}}_20{{anos[2]}}']
              })
              if(totalPenultimoAno !== 0) {
                return totalUltimoAno / totalPenultimoAno - 1;
              }
              if (totalPenultimoAno ==0 & totalUltimoAno == 0) {
                return 0;
              }
              if (totalPenultimoAno == 0 & totalUltimoAno > 0) {
              return null;
              }
            }",
            .open = "{{",
            .close = "}}"
          ))
        },
        format = if (stringr::str_detect(x, "%")) {
          reactable::colFormat(
            percent = TRUE,
            digits = 1
          )
        }
      )
    }
  ) |> purrr::set_names(colunas)

  col_groups <- purrr::map(
    setores,
    \(x) {
      reactable::colGroup(
        name = x,
        columns = colunas[stringr::str_detect(colunas, stringr::fixed(x))]
      )
    }
  )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      groupBy = "macro_grupo",
      striped = TRUE,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        aggregate = "sum",
        format = reactable::colFormat(digits = 0, separators = TRUE, locales = locale)
      ),
      columnGroups = col_groups,
      columns = c(
        list(
          macro_grupo = reactable::colDef(
            name = lab1,
            align = "left",
            minWidth = 100,
            width = 160
          ),
          grupo = reactable::colDef(
            name = lab2,
            align = "left",
            minWidth = 100,
            width = 180
          )
        ),
        col_defs
      )
    )
}

#' Tabela do Capítulo VIII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#' @param lab2 Nome da segunda coluna
#'
#' @export
tab_producao_energia_fosseis_2 <- function(con, lang = "pt", lab1) {
  tab_name <- "tab_producao_energia_fosseis_2"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$setor <- tab[[glue::glue("setor_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(grupo, setor, ano, total)

  tab_wide <- tab_long |>
    dplyr::mutate(setor_ano = glue::glue("{setor}_{ano}")) |>
    dplyr::select(-setor, -ano) |>
    tidyr::pivot_wider(
      names_from = setor_ano,
      values_from = total
    )

  colunas <- tab_wide |>
    dplyr::select(-grupo) |>
    names()

  setores <- unique(tab$setor)

  col_defs <- purrr::map(
    colunas,
    \(x) {
      nome <- stringr::str_remove(x, ".*_")
      reactable::colDef(
        name = nome
      )
    }
  ) |> purrr::set_names(colunas)

  col_groups <- purrr::map(
    setores,
    \(x) {
      reactable::colGroup(
        name = x,
        columns = colunas[stringr::str_detect(colunas, stringr::fixed(x))]
      )
    }
  )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        format = reactable::colFormat(digits = 2, separators = TRUE, locales = locale)
      ),
      columnGroups = col_groups,
      columns = c(
        list(
          grupo = reactable::colDef(
            name = lab1,
            align = "left",
            minWidth = 100,
            width = 160
          )
        ),
        col_defs
      )
    )
}


#' Tabela do Capítulo VIII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#' @param lab2 Nome da segunda coluna
#'
#' @export
tab_producao_energia_eletricidade_alcool_1 <- function(con, lang = "pt", lab1, lab2) {
  tab_name <- "tab_producao_energia_eletricidade_alcool_1"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$macro_grupo <- tab[[glue::glue("macro_grupo_{lang}")]]
    tab$setor <- tab[[glue::glue("setor_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(macro_grupo, grupo, setor, ano, valor)

  tab_wide <- tab_long |>
    dplyr::mutate(setor_ano = glue::glue("{setor}_{ano}")) |>
    dplyr::select(-setor, -ano) |>
    tidyr::pivot_wider(
      names_from = setor_ano,
      values_from = valor
    )

  colunas <- tab_wide |>
    dplyr::select(-macro_grupo, -grupo) |>
    names()

  setores <- unique(tab$setor)

  col_defs <- purrr::map(
    colunas,
    \(x) {
      nome <- stringr::str_remove(x, ".*_")
      reactable::colDef(
        name = nome,
        aggregate = if (stringr::str_detect(x, "%")) {
          setor <- stringr::str_remove(x, "_.*")
          anos <- nome |>
            stringr::str_extract_all("\\d+", simplify = TRUE) |>
            as.character()

          htmlwidgets::JS(glue::glue(
            "function(values, rows) {
              let totalUltimoAno = 0
              let totalPenultimoAno = 0
              rows.forEach(function(row) {
                totalUltimoAno += row['{{setor}}_20{{anos[1]}}']
                totalPenultimoAno += row['{{setor}}_20{{anos[2]}}']
              })
              if(totalPenultimoAno !== 0) {
                return totalUltimoAno / totalPenultimoAno - 1;
              }
              if (totalPenultimoAno ==0 & totalUltimoAno == 0) {
                return 0;
              }
              if (totalPenultimoAno == 0 & totalUltimoAno > 0) {
              return null;
              }
            }",
            .open = "{{",
            .close = "}}"
          ))
        },
        format = if (stringr::str_detect(x, "%")) {
          reactable::colFormat(
            percent = TRUE,
            digits = 1
          )
        }
      )
    }
  ) |> purrr::set_names(colunas)

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  col_groups <- purrr::map(
    setores,
    \(x) {
      reactable::colGroup(
        name = x,
        columns = colunas[stringr::str_detect(colunas, stringr::fixed(x))]
      )
    }
  )

  tab_wide |>
    reactable::reactable(
      groupBy = "macro_grupo",
      striped = TRUE,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        aggregate = "sum",
        format = reactable::colFormat(digits = 0, separators = TRUE, locales = locale)
      ),
      columnGroups = col_groups,
      columns = c(
        list(
          macro_grupo = reactable::colDef(
            name = lab1,
            align = "left",
            minWidth = 100,
            width = 160
          ),
          grupo = reactable::colDef(
            name = lab2,
            align = "left",
            minWidth = 100,
            width = 180
          )
        ),
        col_defs
      )
    )
}

#' Tabela do Capítulo VIII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#' @param lab2 Nome da segunda coluna
#'
#' @export
tab_producao_energia_eletricidade_alcool_2 <- function(con, lang = "pt", lab1) {
  tab_name <- "tab_producao_energia_eletricidade_alcool_2"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$setor <- tab[[glue::glue("setor_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(grupo, setor, ano, total)

  tab_wide <- tab_long |>
    dplyr::mutate(setor_ano = glue::glue("{setor}_{ano}")) |>
    dplyr::select(-setor, -ano) |>
    tidyr::pivot_wider(
      names_from = setor_ano,
      values_from = total
    )

  colunas <- tab_wide |>
    dplyr::select(-grupo) |>
    names()

  setores <- unique(tab$setor)

  col_defs <- purrr::map(
    colunas,
    \(x) {
      nome <- stringr::str_remove(x, ".*_")
      reactable::colDef(
        name = nome
      )
    }
  ) |> purrr::set_names(colunas)

  col_groups <- purrr::map(
    setores,
    \(x) {
      reactable::colGroup(
        name = x,
        columns = colunas[stringr::str_detect(colunas, stringr::fixed(x))]
      )
    }
  )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        format = reactable::colFormat(digits = 2, separators = TRUE, locales = locale)
      ),
      columnGroups = col_groups,
      columns = c(
        list(
          grupo = reactable::colDef(
            name = lab1,
            align = "left",
            minWidth = 100,
            width = 160
          )
        ),
        col_defs
      )
    )
}

#' Tabela do Capítulo VIII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#' @param lab2 Nome da segunda coluna
#'
#' @export
tab_geracao_eletricidade_por_fonte <- function(con, lang = "pt", .ano, .coluna_total, lab1, lab2) {
  tab_name <- "tab_geracao_eletricidade_por_fonte"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$macro_grupo <- tab[[glue::glue("macro_grupo_{lang}")]]
    tab$fonte <- tab[[glue::glue("fonte_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(macro_grupo, grupo, fonte, ano, valor)

  tab_wide <- tab_long |>
    dplyr::filter(
      ano == .ano
    ) |>
    dplyr::select(-ano) |>
    tidyr::pivot_wider(
      names_from = fonte,
      values_from = valor
    ) |>
    dplyr::select(macro_grupo, grupo, dplyr::any_of(.coluna_total), dplyr::everything())

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = .ano)

  tab_wide |>
    dplyr::rename_with(
      \(x) "total",
      dplyr::any_of(.coluna_total)
    ) |>
    reactable::reactable(
      striped = TRUE,
      groupBy = "macro_grupo",
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        aggregate = "sum",
        minWidth = 200,
        format = reactable::colFormat(digits = 0, separators = TRUE, locales = locale)
      ),
      columns = c(
        list(
          macro_grupo = reactable::colDef(
            name = lab1,
            align = "left",
            width = 160,
            sticky = "left"
          ),
          grupo = reactable::colDef(
            name = lab2,
            align = "left",
            width = 180,
            sticky = "left"
          ),
          total = reactable::colDef(
            name = .coluna_total,
            align = "right",
            sticky = "left"
          )
        )
      )
    )
}


#' Tabela do Capítulo VIII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Nome da primeira coluna
#' @param lab2 Nome da segunda coluna
#'
#' @export
tab_consumo_residencial_eletricidade <- function(con, lang = "pt", .tipo_dado, lab1, lab2) {
  tab_name <- "tab_consumo_residencial_eletricidade"

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

#' Tabela do Capítulo VIII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Nome da primeira coluna
#' @param lab2 Nome da segunda coluna
#'
#' @export
tab_consumo_residencial_gas_liquefeito_petroleo <- function(con, lang = "pt", .tipo_dado, lab1, lab2) {
  tab_name <- "tab_consumo_residencial_gas_liquefeito_petroleo"

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


#' Tabela do Capítulo VIII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#' @param lab2 Nome da segunda coluna
#'
#' @export
tab_capacidade_instalada_geracao_energia <- function(con, lang = "pt", .tipo_dado, lab1, lab2) {
  tab_name <- "tab_capacidade_instalada_geracao_energia"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::filter(tipo_dado == .tipo_dado) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$macro_grupo <- tab[[glue::glue("macro_grupo_{lang}")]]
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$fonte <- tab[[glue::glue("fonte_{lang}")]]
    tab$classificacao <- tab[[glue::glue("classificacao_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(macro_grupo, grupo, fonte, classificacao, valor)

  tab_wide <- tab_long |>
    dplyr::mutate(fonte_classificacao = glue::glue("{fonte}_{classificacao}")) |>
    dplyr::select(-fonte, -classificacao) |>
    tidyr::pivot_wider(
      names_from = fonte_classificacao,
      values_from = valor
    )

  colunas <- tab_wide |>
    dplyr::select(-grupo, -macro_grupo) |>
    names()

  fontes <- unique(tab$fonte)

  col_defs <- purrr::map(
    colunas,
    \(x) {
      nome <- stringr::str_remove(x, ".*_")
      reactable::colDef(
        name = nome
      )
    }
  ) |> purrr::set_names(colunas)

  col_groups <- purrr::map(
    fontes,
    \(x) {
      reactable::colGroup(
        name = x,
        columns = colunas[stringr::str_detect(colunas, stringr::fixed(x))]
      )
    }
  )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = .tipo_dado)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = .tipo_dado)

  casas_dec <- ifelse(.tipo_dado == "Absoluto", 0, 1)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      groupBy = "macro_grupo",
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        aggregate = "sum",
        format = reactable::colFormat(digits = casas_dec, separators = TRUE, locales = locale)
      ),
      columnGroups = col_groups,
      columns = c(
        list(
          macro_grupo = reactable::colDef(
            name = lab1,
            align = "left",
            width = 160,
            sticky = "left"
          ),
          grupo = reactable::colDef(
            name = lab2,
            align = "left",
            minWidth = 100,
            width = 180
          )
        ),
        col_defs
      )
    )
}

#' Tabela do Capítulo VIII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#' @param lab2 Nome da segunda coluna
#'
#' @export
tab_capacidade_instalada_mini_micro_geracao_distribuida_1 <- function(con, lang = "pt", .coluna_total, lab1, lab2) {
  tab_name <- "tab_capacidade_instalada_mini_micro_geracao_distribuida_1"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$macro_grupo <- tab[[glue::glue("macro_grupo_{lang}")]]
    tab$classificacao <- tab[[glue::glue("classificacao_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(macro_grupo, grupo, classificacao, total)

  tab_wide <- tab_long |>
    tidyr::pivot_wider(
      names_from = classificacao,
      values_from = total
    )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      groupBy = "macro_grupo",
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        aggregate = "sum",
        minWidth = 200,
        format = reactable::colFormat(digits = 0, separators = TRUE, locales = locale)
      ),
      columns = c(
        list(
          macro_grupo = reactable::colDef(
            name = lab1,
            align = "left",
            width = 160
          ),
          grupo = reactable::colDef(
            name = lab2,
            align = "left",
            width = 180
          )
        )
      )
    )
}

#' Tabela do Capítulo VIII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#' @param lab2 Nome da segunda coluna
#'
#' @export
tab_capacidade_instalada_mini_micro_geracao_distribuida_2 <- function(con, lang = "pt", lab1) {
  tab_name <- "tab_capacidade_instalada_mini_micro_geracao_distribuida_2"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$fonte <- tab[[glue::glue("fonte_{lang}")]]
    tab$classificacao <- tab[[glue::glue("classificacao_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(grupo, fonte, classificacao, valor)

  tab_wide <- tab_long |>
    dplyr::mutate(fonte_classificacao = glue::glue("{fonte}_{classificacao}")) |>
    dplyr::select(-fonte, -classificacao) |>
    tidyr::pivot_wider(
      names_from = fonte_classificacao,
      values_from = valor
    )

  colunas <- tab_wide |>
    dplyr::select(-grupo) |>
    names()

  fontes <- unique(as.character(tab$fonte))

  col_defs <- purrr::map(
    colunas,
    \(x) {
      nome <- stringr::str_remove(x, ".*_")
      reactable::colDef(
        name = nome
      )
    }
  ) |> purrr::set_names(colunas)

  col_groups <- purrr::map(
    fontes,
    \(x) {
      reactable::colGroup(
        name = x,
        columns = colunas[stringr::str_detect(colunas, stringr::fixed(x))]
      )
    }
  )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        minWidth = 150,
        format = reactable::colFormat(digits = 1, separators = TRUE, locales = locale)
      ),
      columnGroups = col_groups,
      columns = c(
        list(
          grupo = reactable::colDef(
            name = lab1,
            align = "left",
            sticky = "left",
            width = 160
          )
        ),
        col_defs
      )
    )
}

#' Tabela do Capítulo VIII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .setor Setor econômico
#' @param .tipo_dado Tipo de dado
#' @param lab1 Nome da primeira coluna
#' @param lab2 Nome da segunda coluna
#'
#' @export
tab_capacidade_instalada_autoprodutores_setor_economico <- function(con, lang = "pt", .setor, .tipo_dado, lab1, lab2) {
  tab_name <- "tab_capacidade_instalada_autoprodutores_setor_economico"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::filter(setor == .setor, tipo_dado == .tipo_dado) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$macro_grupo <- tab[[glue::glue("macro_grupo_{lang}")]]
    tab$fonte <- tab[[glue::glue("fonte_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(macro_grupo, grupo, fonte, valor)

  tab_wide <- tab_long |>
    tidyr::pivot_wider(
      names_from = fonte,
      values_from = valor
    )

  tab_name_setor <- glue::glue("{tab_name}_{.setor}")

  gerar_tabela_download(tab_long, tab_name = tab_name_setor, .tipo_dado = .tipo_dado)
  gerar_matriz_download(tab_wide, tab_name = tab_name_setor, .tipo_dado = .tipo_dado)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      groupBy = "macro_grupo",
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        aggregate = "sum",
        minWidth = 200,
        format = reactable::colFormat(digits = 1, separators = TRUE, locales = locale)
      ),
      columns = c(
        list(
          macro_grupo = reactable::colDef(
            name = lab1,
            align = "left",
            width = 160
          ),
          grupo = reactable::colDef(
            name = lab2,
            align = "left",
            width = 180
          )
        )
      )
    )
}

#' Tabela do Capítulo VIII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .setor Setor econômico
#' @param .tipo_dado Tipo de dado
#' @param lab1 Nome da primeira coluna
#' @param lab2 Nome da segunda coluna
#'
#' @export
tab_capacidade_instalada_autoprodutores_segmento_industrial <- function(con, lang = "pt", .setor, .tipo_dado, lab1, lab2) {
  tab_name <- "tab_capacidade_instalada_autoprodutores_segmento_industrial"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::filter(setor == .setor, tipo_dado == .tipo_dado) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$macro_grupo <- tab[[glue::glue("macro_grupo_{lang}")]]
    tab$fonte <- tab[[glue::glue("fonte_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(macro_grupo, grupo, fonte, valor)

  tab_wide <- tab_long |>
    tidyr::pivot_wider(
      names_from = fonte,
      values_from = valor
    )

  tab_name_setor <- glue::glue("{tab_name}_{.setor}")

  gerar_tabela_download(tab_long, tab_name = tab_name_setor, .tipo_dado = .tipo_dado)
  gerar_matriz_download(tab_wide, tab_name = tab_name_setor, .tipo_dado = .tipo_dado)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      groupBy = "macro_grupo",
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        aggregate = "sum",
        minWidth = 200,
        format = reactable::colFormat(digits = 1, separators = TRUE, locales = locale)
      ),
      columns = c(
        list(
          macro_grupo = reactable::colDef(
            name = lab1,
            align = "left",
            width = 160
          ),
          grupo = reactable::colDef(
            name = lab2,
            align = "left",
            width = 180
          )
        )
      )
    )
}

#' Tabela do Capítulo VIII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#' @param lab2 Nome da segunda coluna
#'
#' @export
tab_capacidade_instalada_1 <- function(con, lang = "pt", lab1, lab2) {
  tab_name <- "tab_capacidade_instalada_1"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$macro_grupo <- tab[[glue::glue("macro_grupo_{lang}")]]
    tab$setor <- tab[[glue::glue("setor_{lang}")]]
    tab$unidade <- tab[[glue::glue("unidade_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(macro_grupo, grupo, setor, unidade, valor)

  tab_wide <- tab_long |>
    dplyr::mutate(setor_unidade = glue::glue("{setor}_{unidade}")) |>
    dplyr::select(-setor, -unidade) |>
    tidyr::pivot_wider(
      names_from = setor_unidade,
      values_from = valor
    )

  colunas <- tab_wide |>
    dplyr::select(-grupo, -macro_grupo) |>
    names()

  setores <- unique(as.character(tab$setor))

  col_defs <- purrr::map(
    colunas,
    \(x) {
      nome <- stringr::str_remove(x, ".*_")
      reactable::colDef(
        name = nome
      )
    }
  ) |> purrr::set_names(colunas)

  col_groups <- purrr::map(
    setores,
    \(x) {
      reactable::colGroup(
        name = x,
        columns = colunas[stringr::str_detect(colunas, stringr::fixed(x))]
      )
    }
  )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      groupBy = "macro_grupo",
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        minWidth = 150,
        aggregate = "sum",
        format = reactable::colFormat(digits = 1, separators = TRUE, locales = locale)
      ),
      columnGroups = col_groups,
      columns = c(
        list(
          macro_grupo = reactable::colDef(
            name = lab1,
            align = "left",
            width = 160
          ),
          grupo = reactable::colDef(
            name = lab2,
            align = "left",
            width = 180
          )
        ),
        col_defs
      )
    )
}


#' Tabela do Capítulo VIII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#'
#' @export
tab_capacidade_instalada_2 <- function(con, lang = "pt", lab1) {
  tab_name <- "tab_capacidade_instalada_2"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$setor <- tab[[glue::glue("setor_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(grupo, setor, valor)

  tab_wide <- tab_long |>
    tidyr::pivot_wider(
      names_from = setor,
      values_from = valor
    )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        minWidth = 200,
        format = reactable::colFormat(
          digits = 1,
          percent = TRUE,
          separators = TRUE,
          locales = locale
        )
      ),
      columns = c(
        list(
          grupo = reactable::colDef(
            name = lab1,
            align = "left",
            width = 160,
            format = reactable::colFormat(
              percent = FALSE
            )
          )
        )
      )
    )
}

#' Tabela do Capítulo VIII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#'
#' @export
tab_reservas_provadas_potencial_hidraulico_1 <- function(con, lang = "pt", lab1) {
  tab_name <- "tab_reservas_provadas_potencial_hidraulico_1"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$setor <- tab[[glue::glue("setor_{lang}")]]
    tab$info <- tab[[glue::glue("info_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(grupo, setor, info, valor)

  tab_wide <- tab_long |>
    dplyr::mutate(setor_info = glue::glue("{setor}_{info}")) |>
    dplyr::select(-setor, -info) |>
    tidyr::pivot_wider(
      names_from = setor_info,
      values_from = valor
    )

  colunas <- tab_wide |>
    dplyr::select(-grupo) |>
    names()

  setores <- unique(as.character(tab$setor))

  col_defs <- purrr::map(
    colunas,
    \(x) {
      nome <- stringr::str_remove(x, ".*_")
      reactable::colDef(
        name = nome,
        format = if (stringr::str_detect(x, "%")) {
          reactable::colFormat(
            digits = 2
          )
        },
        width = if (stringr::str_detect(x, "%")) {
          200
        }
      )
    }
  ) |> purrr::set_names(colunas)

  col_groups <- purrr::map(
    setores,
    \(x) {
      reactable::colGroup(
        name = x,
        columns = colunas[stringr::str_detect(colunas, stringr::fixed(x))]
      )
    }
  )

  tab_padding <- tab |>
    dplyr::distinct(grupo) |>
    dplyr::mutate(
      paddingLeft = dplyr::case_when(
        grupo %in% c("Brasil ") ~ "5px",
        grupo %in% c("Norte", "Nordeste", "Centro-Oeste", "Sul", "Sudeste") ~ "20px",
        TRUE ~ "40px"
      )
    )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      defaultPageSize = 50,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        minWidth = 140,
        format = reactable::colFormat(digits = 0, separators = TRUE, locales = locale)
      ),
      columnGroups = col_groups,
      columns = c(
        list(
          grupo = reactable::colDef(
            name = lab1,
            align = "left",
            width = 180,
            style = function(value, index) {
              paddingLeft <- tab_padding$paddingLeft[tab_padding$grupo == value]
              list(paddingLeft = paddingLeft)
            }
          )
        ),
        col_defs
      )
    )
}


#' Tabela do Capítulo VIII
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#'
#' @export
tab_reservas_provadas_potencial_hidraulico_2 <- function(con, lang = "pt", lab1) {
  tab_name <- "tab_reservas_provadas_potencial_hidraulico_2"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$setor <- tab[[glue::glue("setor_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(grupo, setor, valor)

  tab_wide <- tab_long |>
    tidyr::pivot_wider(
      names_from = setor,
      values_from = valor
    )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        minWidth = 200,
        format = reactable::colFormat(
          digits = 1,
          percent = TRUE,
          separators = TRUE,
          locales = locale
        )
      ),
      columns = c(
        list(
          grupo = reactable::colDef(
            name = lab1,
            align = "left",
            width = 160,
            format = reactable::colFormat(
              percent = FALSE
            )
          )
        )
      )
    )
}

# ANEXO 1 ----------------------------------------------------------------------

#' Tabela do ANEXO 1
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#'
#' @export
tab_capacidade_instalada_geracao_eletrica <- function(con, lang = "pt", lab1) {
  tab_name <- "tab_capacidade_instalada_geracao_eletrica"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$setor <- tab[[glue::glue("setor_{lang}")]]
    tab$fonte <- tab[[glue::glue("fonte_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(ano, setor, fonte, valor)

  tab_wide <- tab_long |>
    dplyr::mutate(setor_fonte = glue::glue("{setor}_{fonte}")) |>
    dplyr::select(-setor, -fonte) |>
    tidyr::pivot_wider(
      names_from = setor_fonte,
      values_from = valor
    )

  colunas <- tab_wide |>
    dplyr::select(-ano) |>
    names()

  setores <- unique(as.character(tab$setor))

  col_defs <- purrr::map(
    colunas,
    \(x) {
      nome <- stringr::str_remove(x, ".*_")
      reactable::colDef(
        name = nome
      )
    }
  ) |> purrr::set_names(colunas)

  col_groups <- purrr::map(
    setores,
    \(x) {
      reactable::colGroup(
        name = x,
        columns = colunas[stringr::str_detect(colunas, stringr::fixed(x))]
      )
    }
  )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      defaultPageSize = 50,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        minWidth = 140,
        format = reactable::colFormat(digits = 0, separators = TRUE, locales = locale)
      ),
      columnGroups = col_groups,
      columns = c(
        list(
          ano = reactable::colDef(
            name = lab1,
            align = "left",
            width = 100,
            format = reactable::colFormat(digits = 0, separators = FALSE)
          )
        ),
        col_defs
      )
    )
}


#' Tabela do ANEXO 1
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#'
#' @export
tab_capacidade_instalada_itaipu <- function(con, lang = "pt", lab1) {
  tab_name <- "tab_capacidade_instalada_itaipu"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  gerar_tabela_download(tab, tab_name = tab_name, .tipo_dado = NULL)

  tab |>
    reactable::reactable(
      striped = TRUE,
      theme = tema_reactable(),
      fullWidth = FALSE,
      columns = c(
        list(
          grupo = reactable::colDef(
            name = lab1,
            align = "center",
            width = 100,
            format = reactable::colFormat(digits = 0, separators = FALSE)
          ),
          valor = reactable::colDef(
            name = "MW",
            align = "right",
            width = 120,
            format = reactable::colFormat(digits = 0, separators = TRUE, locales = locale)
          )
        )
      )
    )
}

#' Tabela do Anexo 1
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_capacidade_instalada_geracao_energia_fonte <- function(con, lang = "pt", lab1) {
  tab_name <- "tab_capacidade_instalada_geracao_energia_fonte"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_3(
    tab = tab,
    tab_name = tab_name,
    lang = lang,
    lab1 = lab1,
    lab2 = "",
    lab3 = "",
    lab4 = "",
    min_width = 150,
    casas_dec = 0
  )
}

#' Tabela do Anexo 1
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#'
#' @export
tab_capacidade_instalada_mini_micro_gd <- function(con, lang = "pt", lab1) {
  tab_name <- "tab_capacidade_instalada_mini_micro_gd"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_3(
    tab = tab,
    tab_name = tab_name,
    lang = lang,
    lab1 = lab1,
    lab2 = "",
    lab3 = "",
    lab4 = "",
    min_width = 150,
    casas_dec = 0
  )
}

#' Tabela do Anexo 1
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#' @param lab2 Nome da segunda coluna
#'
#' @export
tab_capacidade_instalada_refino_petroleo <- function(con, lang = "pt", lab1, lab2) {
  tab_name <- "tab_capacidade_instalada_refino_petroleo"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  gerar_tabela_download(tab, tab_name = tab_name, .tipo_dado = NULL)

  tab |>
    reactable::reactable(
      striped = TRUE,
      theme = tema_reactable(),
      defaultPageSize = 50,
      fullWidth = FALSE,
      columns = c(
        list(
          grupo = reactable::colDef(
            name = lab1,
            align = "center",
            width = 150,
            format = reactable::colFormat(digits = 0, separators = FALSE)
          ),
          valor = reactable::colDef(
            name = lab2,
            align = "right",
            width = 150,
            format = reactable::colFormat(digits = 0, separators = TRUE, locales = locale)
          )
        )
      )
    )
}

#' Tabela do Anexo 1
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#' @param lab2 Nome da segunda coluna
#'
#' @export
tab_capacidade_instalada_producao_biodiesel <- function(con, lang = "pt", lab1, lab2) {
  tab_name <- "tab_capacidade_instalada_producao_biodiesel"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  gerar_tabela_download(tab, tab_name = tab_name, .tipo_dado = NULL)

  tab |>
    reactable::reactable(
      striped = TRUE,
      theme = tema_reactable(),
      defaultPageSize = 50,
      fullWidth = FALSE,
      columns = c(
        list(
          grupo = reactable::colDef(
            name = lab1,
            align = "center",
            width = 150,
            format = reactable::colFormat(digits = 0, separators = FALSE)
          ),
          valor = reactable::colDef(
            name = lab2,
            align = "right",
            width = 150,
            format = reactable::colFormat(digits = 0, separators = TRUE, locales = locale)
          )
        )
      )
    )
}


#' Tabela do Anexo 2
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#' @param lab2 Nome da segunda coluna
#'
#' @export
tab_autoproducao_eletrecidade_setor_fonte <- function(con, lang = "pt", lab1, lab2) {
  tab_name <- "tab_autoproducao_eletrecidade_setor_fonte"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$setor_nivel_1 <- tab[[glue::glue("setor_nivel_1_{lang}")]]
    tab$setor_nivel_2 <- tab[[glue::glue("setor_nivel_2_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(setor_nivel_1, setor_nivel_2, fonte, valor)

  tab_wide <- tab_long |>
    tidyr::pivot_wider(
      names_from = fonte,
      values_from = valor
    )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      theme = tema_reactable(),
      groupBy = "setor_nivel_1",
      defaultPageSize = 50,
      defaultColDef = reactable::colDef(
        width = 130,
        aggregate = "sum",
        format = reactable::colFormat(digits = 0, separators = TRUE, locales = locale)
      ),
      columns = c(
        list(
          setor_nivel_1 = reactable::colDef(
            name = lab1,
            align = "left",
            width = 160
          ),
          setor_nivel_2 = reactable::colDef(
            name = lab2,
            align = "left",
            width = 160
          )
        )
      )
    )
}

#' Tabela do Anexo 2
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#' @param lab2 Nome da segunda coluna
#'
#' @export
tab_autoproducao_eletrecidade_setor_fonte_total <- function(con, lang = "pt", lab1, lab2) {
  tab_name <- "tab_autoproducao_eletrecidade_setor_fonte_total"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$setor_nivel_1 <- tab[[glue::glue("setor_nivel_1_{lang}")]]
    tab$setor_nivel_2 <- tab[[glue::glue("setor_nivel_2_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(setor_nivel_1, setor_nivel_2, total)

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)

  tab_long |>
    reactable::reactable(
      striped = TRUE,
      theme = tema_reactable(),
      groupBy = "setor_nivel_1",
      defaultPageSize = 50,
      fullWidth = FALSE,
      defaultColDef = reactable::colDef(
        width = 100,
        aggregate = "sum"
      ),
      columns = c(
        list(
          setor_nivel_1 = reactable::colDef(
            name = lab1,
            align = "left",
            width = 160
          ),
          setor_nivel_2 = reactable::colDef(
            name = lab2,
            align = "left",
            width = 160
          ),
          total = reactable::colDef(
            name = "Total",
            width = 150,
            format = reactable::colFormat(digits = 0, separators = TRUE, locales = locale)
          )
        )
      )
    )
}

#' Tabela do Anexo 4
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#'
#' @export
tab_evolucao_rendimentos_energeticos_setores <- function(con, lang = "pt", lab1) {
  tab_name <- "tab_evolucao_rendimentos_energeticos_setores"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
  }

  tab_wide <- tab |> 
    dplyr::select(-dplyr::matches("grupo_"))

  tab_long <- tab_wide |>
    tidyr::pivot_longer(
      cols = -grupo,
      names_to = "ano",
      values_to = "valor"
    )

  tab_padding <- tab |>
    dplyr::distinct(grupo) |>
    dplyr::mutate(
      paddingLeft = dplyr::case_when(
        grupo %in% c("Principais Energéticos", "Principais Setores de Atividade", "Principais Usos Finais") ~ "5px",
        TRUE ~ "40px"
      )
    )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      theme = tema_reactable(),
      defaultPageSize = 50,
      defaultColDef = reactable::colDef(
        width = 130,
        format = reactable::colFormat(
          digits = 1,
          separators = TRUE,
          locales = locale
        )
      ),
      columns = c(
        list(
          grupo = reactable::colDef(
            name = lab1,
            align = "left",
            width = 160,
            style = function(value, index) {
              paddingLeft <- tab_padding$paddingLeft[tab_padding$grupo == value]
              list(paddingLeft = paddingLeft)
            }
          )
        )
      )
    )
}

#' Tabela do Anexo 4
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#'
#' @export
tab_evolucao_rendimentos_energeticos_setores_efeitos <- function(con, lang = "pt", lab1) {
  tab_name <- "tab_evolucao_rendimentos_energeticos_setores_efeitos"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$info <- tab[[glue::glue("info_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(grupo, info, ano, total)

  tab_wide <- tab_long |>
    dplyr::mutate(info_ano = glue::glue("{info}_{ano}")) |>
    dplyr::select(-info, -ano) |>
    tidyr::pivot_wider(
      names_from = info_ano,
      values_from = total
    )

  colunas <- tab_wide |>
    dplyr::select(-grupo) |>
    names()

  infos <- unique(tab$info)

  col_defs <- purrr::map(
    colunas,
    \(x) {
      nome <- stringr::str_remove(x, ".*_")
      reactable::colDef(
        name = nome
      )
    }
  ) |> purrr::set_names(colunas)

  col_groups <- purrr::map(
    infos,
    \(x) {
      reactable::colGroup(
        name = x,
        columns = colunas[stringr::str_detect(colunas, stringr::fixed(x))]
      )
    }
  )

  tab_padding <- tab |>
    dplyr::distinct(grupo) |>
    dplyr::mutate(
      paddingLeft = dplyr::case_when(
        grupo %in% c("Principais Energéticos", "Principais Setores de Atividade", "Principais Usos Finais", "Global") ~ "5px",
        TRUE ~ "40px"
      )
    )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      defaultPageSize = 50,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        format = reactable::colFormat(digits = 1, separators = TRUE, locales = locale)
      ),
      columnGroups = col_groups,
      columns = c(
        list(
          grupo = reactable::colDef(
            name = lab1,
            align = "left",
            width = 250,
            style = function(value, index) {
              paddingLeft <- tab_padding$paddingLeft[tab_padding$grupo == value]
              list(paddingLeft = paddingLeft)
            }
          )
        ),
        col_defs
      )
    )
}

#' Tabela do Anexo 4
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#'
#' @export
tab_variacao_rendimentos_energeticos_participacao <- function(con, lang = "pt", lab1) {
  tab_name <- "tab_variacao_rendimentos_energeticos_participacao"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$info <- tab[[glue::glue("info_{lang}")]]
  }

  tab_long <- tab |>
    dplyr::select(grupo, info, ano, total)

  tab_wide <- tab_long |>
    dplyr::mutate(ano_info = glue::glue("{ano}_{info}")) |>
    dplyr::select(-info, -ano) |>
    tidyr::pivot_wider(
      names_from = ano_info,
      values_from = total
    )

  colunas <- tab_wide |>
    dplyr::select(-grupo) |>
    names()

  anos <- unique(tab$ano)

  col_defs <- purrr::map(
    colunas,
    \(x) {
      nome <- stringr::str_remove(x, ".*_")
      reactable::colDef(
        name = nome
      )
    }
  ) |> purrr::set_names(colunas)

  col_groups <- purrr::map(
    anos,
    \(x) {
      reactable::colGroup(
        name = x,
        columns = colunas[stringr::str_detect(colunas, stringr::fixed(x))]
      )
    }
  )

  tab_padding <- tab |>
    dplyr::distinct(grupo) |>
    dplyr::mutate(
      paddingLeft = dplyr::case_when(
        grupo %in% c("Principais Energéticos", "Principais Setores de Atividade", "Principais Usos Finais", "Global") ~ "5px",
        TRUE ~ "40px"
      )
    )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = NULL)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = NULL)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      defaultPageSize = 50,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        format = reactable::colFormat(digits = 1, separators = TRUE, locales = locale)
      ),
      columnGroups = col_groups,
      columns = c(
        list(
          grupo = reactable::colDef(
            name = lab1,
            align = "left",
            width = 250,
            style = function(value, index) {
              paddingLeft <- tab_padding$paddingLeft[tab_padding$grupo == value]
              list(paddingLeft = paddingLeft)
            }
          )
        ),
        col_defs
      )
    )
}

#' Tabela do Anexo 5
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#'
#' @export
tab_conceituacao_energia_primaria <- function(con, lang = "pt") {
  
  tab_lang <- ifelse(lang == "pt", "", paste0("_", lang))
  
  tab_name <- glue::glue("tab_conceituacao_energia_primaria{tab_lang}")

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  tab |> 
    reactable::reactable(
      striped = TRUE,
      defaultPageSize = 50,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        align = "center"
      )
    )
}

#' Tabela do Anexo 5 - Energia Secundária
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#'
#' @export
tab_conceituacao_energia_secundaria <- function(con, lang = "pt") {
  
  tab_lang <- ifelse(lang == "pt", "", paste0("_", lang))
  
  tab_name <- glue::glue("tab_conceituacao_energia_secundaria{tab_lang}")

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  tab |> 
    reactable::reactable(
      striped = TRUE,
      defaultPageSize = 50,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        align = "center"
      )
    )
}

#' Tabela do Anexo 5 - Total Geral
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#'
#' @export
tab_conceituacao_total_geral <- function(con, lang = "pt") {
  
  tab_lang <- ifelse(lang == "pt", "", paste0("_", lang))
  
  tab_name <- glue::glue("tab_conceituacao_total_geral{tab_lang}")

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  tab |> 
    reactable::reactable(
      striped = TRUE,
      defaultPageSize = 50,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        align = "center"
      )
    )
}

#' Tabela do Anexo 5 - Oferta
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#'
#' @export
tab_conceituacao_oferta <- function(con, lang = "pt") {
  
  tab_lang <- ifelse(lang == "pt", "", paste0("_", lang))
  
  tab_name <- glue::glue("tab_conceituacao_oferta{tab_lang}")

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  tab |> 
    reactable::reactable(
      striped = TRUE,
      defaultPageSize = 50,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        align = "center"
      )
    )
}

#' Tabela do Anexo 5 - Transformação
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#'
#' @export
tab_conceituacao_transformacao <- function(con, lang = "pt") {
  
  tab_lang <- ifelse(lang == "pt", "", paste0("_", lang))
  
  tab_name <- glue::glue("tab_conceituacao_transformacao{tab_lang}")

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  tab |> 
    reactable::reactable(
      striped = TRUE,
      defaultPageSize = 50,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        align = "center"
      )
    )
}

#' Tabela do Anexo 5 - Perdas
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#'
#' @export
tab_conceituacao_perdas <- function(con, lang = "pt") {
  
  tab_lang <- ifelse(lang == "pt", "", paste0("_", lang))
  
  tab_name <- glue::glue("tab_conceituacao_perdas{tab_lang}")

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  tab |> 
    reactable::reactable(
      striped = TRUE,
      defaultPageSize = 50,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        align = "center"
      )
    )
}

#' Tabela do Anexo 5 - Consumo Final
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#'
#' @export
tab_conceituacao_consumo_final <- function(con, lang = "pt") {
  
  tab_lang <- ifelse(lang == "pt", "", paste0("_", lang))
  
  tab_name <- glue::glue("tab_conceituacao_consumo_final{tab_lang}")

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  tab |> 
    reactable::reactable(
      striped = TRUE,
      defaultPageSize = 50,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        align = "center"
      )
    )
}

#' Tabela do Anexo 5 - Ajustes Estatísticos
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param lab1 Nome da primeira coluna
#'
#' @export
tab_conceituacao_ajustes_estatisticos <- function(con, lang = "pt") {
  
  tab_lang <- ifelse(lang == "pt", "", paste0("_", lang))
  
  tab_name <- glue::glue("tab_conceituacao_ajustes_estatisticos{tab_lang}")

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  tab |> 
    reactable::reactable(
      striped = TRUE,
      defaultPageSize = 50,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        align = "center"
      )
    )
}
