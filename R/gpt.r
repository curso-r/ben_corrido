#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#' @param lab2 Label 2
#' @param lab3 Label 3
#' @param lab4 Label 4
#' @param lab5 Label 5
#'
#' @export
tab_alcool_etilico_total <- function(con, lang = "pt", .tipo_dado, lab1 = "", lab2 = "", lab3 = "", lab4 = "", lab5 = "") {
  tab_name <- "tab_alcool_etilico_total"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_4(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = lab1,
    lab2 = lab2,
    lab3 = lab3,
    lab4 = lab4,
    lab5 = lab5,
    min_width = 220
  )
}

#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#' @param lab2 Label 2
#' @param lab3 Label 3
#' @param lab4 Label 4
#' @param lab5 Label 5
#'
#' @export
tab_alcool_anidro <- function(con, lang = "pt", .tipo_dado, lab1 = "", lab2 = "", lab3 = "", lab4 = "", lab5 = "") {
  tab_name <- "tab_alcool_anidro"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_4(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = lab1,
    lab2 = lab2,
    lab3 = lab3,
    lab4 = lab4,
    lab5 = lab5,
    min_width = 220
  )
}

#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#' @param lab2 Label 2
#' @param lab3 Label 3
#' @param lab4 Label 4
#' @param lab5 Label 5
#'
#' @export
tab_alcool_hidratado <- function(con, lang = "pt", .tipo_dado, lab1 = "", lab2 = "", lab3 = "", lab4 = "", lab5 = "") {
  tab_name <- "tab_alcool_hidratado"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_4(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = lab1,
    lab2 = lab2,
    lab3 = lab3,
    lab4 = lab4,
    lab5 = lab5,
    min_width = 220
  )
}

#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#' @param lab2 Label 2
#' @param lab3 Label 3
#' @param lab4 Label 4
#' @param lab5 Label 5
#'
#' @export
tab_outras_secundarias_petroleo <- function(con, lang = "pt", .tipo_dado, lab1 = "", lab2 = "", lab3 = "", lab4 = "", lab5 = "") {
  tab_name <- "tab_outras_secundarias_petroleo"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_4(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = lab1,
    lab2 = lab2,
    lab3 = lab3,
    lab4 = lab4,
    lab5 = lab5,
    min_width = 220
  )
}

#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#' @param lab2 Label 2
#' @param lab3 Label 3
#' @param lab4 Label 4
#' @param lab5 Label 5
#'
#' @export
tab_alcatrao <- function(con, lang = "pt", .tipo_dado, lab1 = "", lab2 = "", lab3 = "", lab4 = "", lab5 = "") {
  tab_name <- "tab_alcatrao"

  tab <- dplyr::tbl(con, tab_name) |>
    dplyr::collect()

  reactable_painel_nivel_4(
    tab = tab,
    tab_name = tab_name,
    .tipo_dado = .tipo_dado,
    lang = lang,
    lab1 = lab1,
    lab2 = lab2,
    lab3 = lab3,
    lab4 = lab4,
    lab5 = lab5,
    min_width = 220
  )
}

#' Tabela do Capítulo II
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo_dado Tipo de dado
#' @param lab1 Label 1
#' @param lab2 Label 2
#' @param lab3 Label 3
#'
#' @export
tab_produtos_nao_energeticos_petroleo <- function(con, lang = "pt", .tipo_dado, lab1 = "", lab2 = "", lab3 = "") {
  tab_name <- "tab_produtos_nao_energeticos_petroleo"

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