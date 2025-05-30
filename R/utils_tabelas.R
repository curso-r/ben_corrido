tema_reactable <- function() {
  reactable::reactableTheme(
    borderColor = "black",
    style = list(
      fontSize = "85%"
    )
  )
}

reactable_tabela_simples <- function(tab, tab_name, .tipo_dado = NULL, lang, ..., labs = NULL) {
  gerar_matriz_download(tab, tab_name = tab_name, .tipo_dado = .tipo_dado)

  locale <- pegar_locale(lang)

  if (is.null(labs)) {
    labs <- names(tab)
  }

  col_defs <- purrr::map(
    labs,
    \(lab) reactable::colDef(
      name = lab,
      minWidth = max(nchar(lab) * 10, 100)
    )
  ) |>
    purrr::set_names(names(tab))

  tab |>
    reactable::reactable(
      striped = TRUE,
      pagination = FALSE,
      resizable = TRUE,
      theme = tema_reactable(),
      defaultColDef = reactable::colDef(
        format = reactable::colFormat(
          digits = 0,
          separators = TRUE,
          locales = locale
        )
      ),
      columns = col_defs,
      ...
    )
}

reactable_painel_simples <- function(tab, tab_name, lang, lab1, casas_dec = NULL,
                                     min_width = 100, .tipo_dado = NULL) {
  if (lang != "pt") {
    tab$grupo <- tab[[glue::glue("grupo_{lang}")]]
  }

  locale <- pegar_locale(lang)

  menor_ano <- determinar_menor_ano(tab$ano)

  if (!is.null(.tipo_dado)) {
    tab <- tab |>
      dplyr::filter(tipo_dado == .tipo_dado)

    if (is.null(casas_dec)) {
      casas_dec <- ifelse(.tipo_dado == "Absoluto", 0, 1)
    }
  }

  tab_long <- tab |>
    dplyr::filter(
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
      pagination = FALSE,
      theme = tema_reactable(),
      defaultColDef = reactable::colDef(
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
      pagination = FALSE,
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

reactable_painel_nivel_2 <- function(tab, tab_name, lang, lab1, lab2, lab3, ...,
                                     casas_dec = NULL, .tipo_dado = NULL, min_width = 100) {
  if (lang != "pt") {
    tab$grupo_nivel_1 <- tab[[glue::glue("grupo_nivel_1_{lang}")]]
    tab$grupo_nivel_2 <- tab[[glue::glue("grupo_nivel_2_{lang}")]]
    tab$grupo_nivel_menor <- tab[[glue::glue("grupo_nivel_menor_{lang}")]]
  }

  locale <- pegar_locale(lang)

  menor_ano <- determinar_menor_ano(tab$ano)

  if (!is.null(.tipo_dado)) {
    tab <- tab |>
      dplyr::filter(tipo_dado == .tipo_dado)

    if (is.null(casas_dec)) {
      casas_dec <- ifelse(.tipo_dado == "Absoluto", 0, 1)
    }
  }

  tab_long <- tab |>
    dplyr::filter(
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
      pagination = FALSE,
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


reactable_painel_nivel_3 <- function(tab, tab_name, .tipo_dado = NULL, lang, lab1, lab2,
                                     lab3, lab4, min_width = 100, casas_dec = NULL) {
  if (lang != "pt") {
    tab$grupo_nivel_1 <- tab[[glue::glue("grupo_nivel_1_{lang}")]]
    tab$grupo_nivel_2 <- tab[[glue::glue("grupo_nivel_2_{lang}")]]
    tab$grupo_nivel_3 <- tab[[glue::glue("grupo_nivel_3_{lang}")]]
    tab$grupo_nivel_menor <- tab[[glue::glue("grupo_nivel_menor_{lang}")]]
  }

  locale <- pegar_locale(lang)

  menor_ano <- determinar_menor_ano(tab$ano)

  if (!is.null(.tipo_dado)) {
    tab <- tab |>
      dplyr::filter(tipo_dado == .tipo_dado)

    if (is.null(casas_dec)) {
      casas_dec <- ifelse(.tipo_dado == "Absoluto", 0, 1)
    }
  }

  tab_long <- tab |>
    dplyr::filter(
      ano > menor_ano
    ) |>
    dplyr::select(
      grupo_nivel_1,
      grupo_nivel_2,
      grupo_nivel_3,
      grupo_nivel_menor,
      ano,
      total
    )

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
      pagination = FALSE,
      groupBy = c(
        "grupo_nivel_1",
        "grupo_nivel_2",
        "grupo_nivel_3"
      ),
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
        grupo_nivel_3 = reactable::colDef(
          name = lab3,
          align = "left",
          minWidth = min_width
        ),
        grupo_nivel_menor = reactable::colDef(
          name = lab4,
          align = "left",
          minWidth = min_width,
          sticky = "left"
        )
      )
    )
}


reactable_painel_nivel_4 <- function(tab, tab_name, .tipo_dado, lang, lab1, lab2,
                                     lab3, lab4, lab5, min_width = 100) {
  if (lang != "pt") {
    tab$grupo_nivel_1 <- tab[[glue::glue("grupo_nivel_1_{lang}")]]
    tab$grupo_nivel_2 <- tab[[glue::glue("grupo_nivel_2_{lang}")]]
    tab$grupo_nivel_3 <- tab[[glue::glue("grupo_nivel_3_{lang}")]]
    tab$grupo_nivel_4 <- tab[[glue::glue("grupo_nivel_4_{lang}")]]
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
    dplyr::select(
      grupo_nivel_1,
      grupo_nivel_2,
      grupo_nivel_3,
      grupo_nivel_4,
      grupo_nivel_menor,
      ano,
      total
    )

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
      pagination = FALSE,
      groupBy = c(
        "grupo_nivel_1",
        "grupo_nivel_2",
        "grupo_nivel_3",
        "grupo_nivel_4"
      ),
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
        grupo_nivel_3 = reactable::colDef(
          name = lab3,
          align = "left",
          minWidth = min_width
        ),
        grupo_nivel_4 = reactable::colDef(
          name = lab4,
          align = "left",
          minWidth = min_width
        ),
        grupo_nivel_menor = reactable::colDef(
          name = lab5,
          align = "left",
          minWidth = min_width,
          sticky = "left"
        )
      )
    )
}

reactable_fator_conversao <- function(tab, lang, lab1, lab2, casas_dec = NULL) {
  locale <- pegar_locale(lang)

  if (lang != "pt") {
    tab$unidade_origem <- tab[[glue::glue("unidade_origem_{lang}")]]
    tab$unidade_destino <- tab[[glue::glue("unidade_destino_{lang}")]]
  }

  tab_wide <- tab |>
    dplyr::select(unidade_origem, unidade_destino, fator_conversao) |>
    tidyr::pivot_wider(
      names_from = unidade_destino,
      values_from = fator_conversao
    )

  colunas <- tab_wide |>
    dplyr::select(-unidade_origem) |>
    names()

  tab_wide |>
    reactable::reactable(
      striped = TRUE,
      pagination = FALSE,
      theme = reactable::reactableTheme(
        borderColor = "black",
        style = list(
          fontSize = "85%"
        )
      ),
      defaultColDef = reactable::colDef(
        format = reactable::colFormat(digits = casas_dec, separators = TRUE, locales = locale),
        minWidth = 200,
        align = "center"
      ),
      columnGroups = list(
        reactable::colGroup(
          name = lab2,
          columns = colunas
        )
      ),
      columns = c(
        list(
          unidade_origem = reactable::colDef(
            name = lab1,
            align = "left",
            width = 200
          )
        )
      )
    )
}
