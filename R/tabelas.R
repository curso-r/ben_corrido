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