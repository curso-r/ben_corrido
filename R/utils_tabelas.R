tema_reactable <- function() {
  reactable::reactableTheme(
    borderColor = "black",
    style = list(
      fontSize = "85%"
    )
  )
}

reactable_painel_simples <- function(tab, tab_name, .tipo_dado, lang, lab1, min_width = 100) {
  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
  }

  locale <- pegar_locale(lang)

  menor_ano <- determinar_menor_ano(tab$ano)
  casas_dec <- ifelse(.tipo_dado == "Absoluto", 0, 1)

  tab_long <- tab |>
    dplyr::filter(
      tipo_dado == .tipo_dado,
      ano > menor_ano
    ) |>
    dplyr::select(grupo, ano, total)

  tab_wide <- tab_long |>
    tidyr::pivot_wider(
      names_from = ano,
      values_from = total
    )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = .tipo_dado)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = .tipo_dado)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      sortable = FALSE,
      resizable = TRUE,
      theme = tema_reactable(),
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
        grupo = reactable::colDef(
          name = lab1,
          align = "left",
          minWidth = min_width,
          width = 220,
          sticky = "left"
        )
      )
    )
}

reactable_painel_nivel_1 <- function(tab, tab_name, .tipo_dado, lang, lab1, lab2,
                                     min_width = 100) {
  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
    tab$macro_grupo <- tab[[glue::glue("macro_grupo_{lang}")]]
  }

  locale <- pegar_locale(lang)

  menor_ano <- determinar_menor_ano(tab$ano)
  casas_dec <- ifelse(.tipo_dado == "Absoluto", 0, 1)

  tab_long <- tab |>
    dplyr::filter(
      tipo_dado == .tipo_dado,
      ano > menor_ano
    ) |>
    dplyr::select(macro_grupo, grupo, ano, total)

  tab_wide <- tab_long |>
    tidyr::pivot_wider(
      names_from = ano,
      values_from = total
    )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = .tipo_dado)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = .tipo_dado)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      sortable = FALSE,
      resizable = TRUE,
      defaultPageSize = 50,
      groupBy = "macro_grupo",
      theme = tema_reactable(),
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
          name = lab1,
          align = "left",
          minWidth = min_width
        ),
        grupo = reactable::colDef(
          name = lab2,
          align = "left",
          minWidth = min_width
        )
      )
    )
}

reactable_painel_nivel_2 <- function(tab, tab_name, .tipo_dado, lang, lab1, lab2, lab3,
                                     min_width = 100) {
  if (lang != "pt") {
    tab$grupo_nivel_1 <- tab[[glue::glue("grupo_nivel_1_{lang}")]]
    tab$grupo_nivel_2 <- tab[[glue::glue("grupo_nivel_2_{lang}")]]
    tab$grupo_nivel_menor <- tab[[glue::glue("grupo_nivel_menor_{lang}")]]
  }

  locale <- pegar_locale(lang)

  menor_ano <- determinar_menor_ano(tab$ano)
  casas_dec <- ifelse(.tipo_dado == "Absoluto", 0, 1)

  tab_long <- tab |>
    dplyr::filter(
      tipo_dado == .tipo_dado,
      ano > menor_ano
    ) |>
    dplyr::select(grupo_nivel_1, grupo_nivel_2, grupo_nivel_menor, ano, total)

  tab_wide <- tab_long |>
    tidyr::pivot_wider(
      names_from = ano,
      values_from = total
    )

  gerar_tabela_download(tab_long, tab_name = tab_name, .tipo_dado = .tipo_dado)
  gerar_matriz_download(tab_wide, tab_name = tab_name, .tipo_dado = .tipo_dado)

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      resizable = TRUE,
      defaultPageSize = 50,
      groupBy = c("grupo_nivel_1", "grupo_nivel_2"),
      theme = tema_reactable(),
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
        grupo_nivel_1 = reactable::colDef(
          name = lab1,
          align = "left",
          minWidth = min_width
        ),
        grupo_nivel_2 = reactable::colDef(
          name = lab2,
          align = "left",
          minWidth = min_width
        ),
        grupo_nivel_menor = reactable::colDef(
          name = lab3,
          align = "left",
          minWidth = min_width,
          sticky = "left"
        )
      )
    )
}


reactable_painel_nivel_3 <- function() {

}
