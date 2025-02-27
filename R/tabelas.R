#' Tabela do Capítulo I
#'
#' @param con Conexão com o banco de dados
#' @param lang Idioma
#' @param .tipo Tipo de dado
#'
#' @export
tab_producao_energia_primaria <- function(con, lang = "pt", .tipo = "Absoluto") {
  tab <- dplyr::tbl(con, "tab_producao_energia_primaria") |>
    dplyr::collect()

  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$macro_grupo <- tab[[glue::glue("macro_grupo_{lang}")]]
    locale <- NULL
  } else {
    locale <- "pt-BR"
  }

  ano_atual <- lubridate::year(Sys.Date())
  casas_dec <- ifelse(.tipo == "Absoluto", 0, 1)

  tab |>
    dplyr::filter(
      tipo_dado == .tipo,
      ano > ano_atual - 10
    ) |>
    dplyr::select(macro_grupo, grupo, ano, total) |>
    tidyr::pivot_wider(
      names_from = ano,
      values_from = total
    ) |>
    reactable::reactable(
      striped = TRUE,
      sortable = FALSE,
      resizable = TRUE,
      groupBy = "macro_grupo",
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        aggregate = "sum",
        minWidth = 90,
        format = reactable::colFormat(
          digits = casas_dec,
          separators = TRUE,
          locales = locale
        )
      ),
      columns = list(
        macro_grupo = reactable::colDef(
          name = "Renovabilidade",
          align = "left",
          minWidth = 100,
          width = 220
        ),
        grupo = reactable::colDef(
          aggregate = htmlwidgets::JS(""),
          name = "Fonte",
          align = "left",
          minWidth = 100,
          width = 220
        )
      )
    )


  # se tiver um parametro macro grupo, ele vai agrupar por esse macro grupo, aso
  # contrario, ele nao vai precisar agrupar nada e vai retornar direto o grupo 'menor'.

  # if(is.null(numero_de_linhas)){
  #   linhas_na_tabela <- 10
  # }else{
  #   linhas_na_tabela <- numero_de_linhas
  # }
}
