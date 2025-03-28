con <- DBI::dbConnect(RSQLite::SQLite(), "data-raw/sqlite/Balanco_Energetico_testando_v07.sqlite")

tab_fluxo_energetico <- dplyr::tbl(con, "fluxo_energetico") |> dplyr::collect()
tab_fluxo_eletrico <- dplyr::tbl(con, "fluxo_eletrico") |> dplyr::collect()

DBI::dbDisconnect(con)

# Fluxo energético

tab_oferta_interna <- tab_fluxo_energetico |>
  dplyr::filter(stringr::str_detect(dado, "Oferta interna de energia por fonte por ano")) |>
  dplyr::select(
    ano,
    fonte_2 = fonte_nivel_2,
    valor
  ) |>
  dplyr::mutate(
    fonte_2 = dplyr::case_when(
      stringr::str_detect(fonte_2, "OUTRAS|SOLAR|EÓLICA") ~ "OUTROS",
      TRUE ~ fonte_2
    )
  ) |>
  dplyr::group_by(ano, fonte_2) |>
  dplyr::summarise(valor = sum(valor), .groups = "drop") |>
  dplyr::ungroup() |>
  dplyr::mutate(
    origem = stringr::str_to_title(fonte_2),
    destino = "Oferta Interna de Energia",
    ordem = 1
  ) |>
  dplyr::select(-c(fonte_2))


tab_consumo_final_nao_energetico <- tab_fluxo_energetico |>
  dplyr::filter(
    stringr::str_detect(setor_nivel_1, "CONSUMO FINAL NÃO-ENERGÉTICO")
  ) |>
  dplyr::select(
    ano, valor
  ) |>
  dplyr::mutate(
    origem = "Oferta Interna de Energia",
    destino = "Consumo Final Não Energético",
    ordem = 2
  )

tab_consumo_final_energetico <- tab_fluxo_energetico |>
  dplyr::filter(stringr::str_detect(setor_nivel_1, "CONSUMO FINAL ENERGÉTICO")) |>
  dplyr::select(
    ano,
    setor_2 = setor_nivel_2,
    valor
  ) |>
  dplyr::group_by(ano, setor_2) |>
  dplyr::summarise(valor = sum(valor), .groups = "drop") |>
  dplyr::mutate(
    origem = "Oferta Interna de Energia",
    destino = stringr::str_to_title(setor_2),
    ordem = 3
  ) |>
  dplyr::select(-c(setor_2))


tab_perdas <- tab_fluxo_energetico |>
  dplyr::filter(stringr::str_detect(fonte_nivel_1, "PERDAS")) |>
  dplyr::select(
    ano,
    fonte_1 = fonte_nivel_1,
    valor
  ) |>
  dplyr::mutate(
    valor = -valor,
    origem = "Oferta Interna de Energia",
    destino = stringr::str_to_title(fonte_1),
    ordem = 4
  ) |>
  dplyr::select(-c(fonte_1))


tab_ajustes <- tab_fluxo_energetico |>
  dplyr::filter(
    stringr::str_detect(fonte_nivel_1, "AJUSTES ESTATÍSTICOS"),
    valor < 0
  ) |>
  dplyr::select(ano, valor) |>
  dplyr::mutate(
    valor = -valor,
    origem = "Oferta Interna de Energia",
    destino = "Ajustes Estatísticos",
    ordem = 5
  )

tab_ajustes_oferta_interna_energia <- tab_fluxo_energetico |>
  dplyr::filter(
    stringr::str_detect(fonte_nivel_1, "AJUSTES ESTATÍSTICOS"),
    valor > 0
  ) |>
  dplyr::select(ano, valor) |>
  dplyr::mutate(
    origem = "Ajustes Estatísticos",
    destino = "Oferta Interna de Energia",
    ordem = 6
  )

# Juntando tabelas
grafico_sankey_fluxo_energetico <- dplyr::bind_rows(
  tab_oferta_interna,
  tab_consumo_final_nao_energetico,
  tab_consumo_final_energetico,
  tab_perdas,
  tab_ajustes,
  tab_ajustes_oferta_interna_energia
) |>
  dplyr::mutate(valor = valor / 1000) |>
  dplyr::group_by(
    origem, ano
  ) |>
  dplyr::mutate(
    total_origem = sum(valor)
  ) |>
  dplyr::ungroup() |>
  dplyr::group_by(
    destino, ano
  ) |>
  dplyr::mutate(
    total_destino = sum(valor)
  ) |>
  dplyr::ungroup() |>
  dplyr::mutate(
    base_destino = destino %in% c("Oferta Interna de Energia Elétrica", "Oferta Interna de Energia"),
    percentual = dplyr::if_else(base_destino, valor / total_destino, valor / total_origem),
    percentual_no_formato = scales::percent(percentual, accuracy = 0.1),
    nome_base = dplyr::if_else(base_destino, destino, origem),
    rotulo_percentual = stringr:::str_glue("{percentual_no_formato} de {nome_base}")
  ) |>
  dplyr::filter(ano == max(ano))


# Fluxo elétrico

tab_oferta_interna_energia_eletrica <- tab_fluxo_eletrico |>
  dplyr::filter(identificacao_nivel_1 == "Geração de Eletricidade") |>
  dplyr::select(
    ano,
    id_3 = identificacao_nivel_3, valor
  ) |>
  dplyr::mutate(
    id_3 = dplyr::case_when(
      stringr::str_detect(id_3, "[Óó]leo") ~ "DERIVADOS DE PETRÓLEO",
      stringr::str_detect(id_3, "Lenha|Bagaço|Lixívia|Biodiesel") ~ "BIOMASSA",
      stringr::str_detect(id_3, "[Cc]oqueria|Outras") ~ "OUTROS",
      TRUE ~ id_3
    )
  ) |>
  dplyr::group_by(ano, id_3) |>
  dplyr::summarise(valor = sum(valor), .groups = "drop") |>
  dplyr::ungroup() |>
  dplyr::mutate(
    origem = stringr::str_to_title(id_3),
    destino = "Oferta Interna de Energia Elétrica",
    ordem = 1
  ) |>
  dplyr::select(-id_3)


tab_importacao_oferta <- tab_fluxo_eletrico |>
  dplyr::filter(stringr::str_detect(fluxo_nivel_1, "importacao|exportacao")) |>
  dplyr::select(
    ano,
    fluxo_1 = fluxo_nivel_1,
    valor
  ) |>
  tidyr::pivot_wider(
    names_from = fluxo_1,
    values_from = valor
  ) |>
  janitor::clean_names() |>
  dplyr::mutate(
    importacao_liquida = importacao - exportacao
  ) |>
  dplyr::filter(importacao_liquida > 0) |>
  dplyr::select(ano, importacao_liquida) |>
  tidyr::pivot_longer(
    cols = -ano,
    names_to = "fluxo_1",
    values_to = "valor"
  ) |>
  dplyr::mutate(
    origem = "Importação Líquida de Eletricidade",
    destino = "Oferta Interna de Energia Elétrica",
    ordem = 2
  ) |>
  dplyr::select(-fluxo_1)

tab_oferta_importacao <- tab_fluxo_eletrico |>
  dplyr::filter(stringr::str_detect(fluxo_nivel_1, "importacao|exportacao")) |>
  dplyr::select(
    ano,
    fluxo_1 = fluxo_nivel_1,
    valor
  ) |>
  tidyr::pivot_wider(
    names_from = fluxo_1,
    values_from = valor
  ) |>
  janitor::clean_names() |>
  dplyr::mutate(
    importacao_liquida = importacao - exportacao
  ) |>
  dplyr::filter(importacao_liquida < 0) |>
  dplyr::select(ano, importacao_liquida) |>
  tidyr::pivot_longer(
    cols = -ano,
    names_to = "fluxo_1",
    values_to = "valor"
  ) |>
  dplyr::mutate(
    origem = "Oferta Interna de Energia Elétrica",
    destino = "Importação Líquida de Eletricidade",
    ordem = 3
  ) |>
  dplyr::select(-fluxo_1)

tab_consumo_final <- tab_fluxo_eletrico |>
  dplyr::filter(
    fluxo_nivel_1 == "Consumo Total",
    fluxo_nivel_2 == "Consumo Final",
    fluxo_nivel_3 == "Consumo Final Energético"
  ) |>
  dplyr::select(
    ano,
    fluxo_4 = fluxo_nivel_4, valor
  ) |>
  dplyr::group_by(ano, fluxo_4) |>
  dplyr::summarise(valor = sum(valor), .groups = "drop") |>
  dplyr::ungroup() |>
  dplyr::mutate(
    origem = "Oferta Interna de Energia Elétrica",
    destino = stringr::str_to_title(fluxo_4),
    ordem = 4
  ) |>
  dplyr::select(-fluxo_4)

tab_perdas <- tab_fluxo_eletrico |>
  dplyr::filter(fluxo_nivel_1 == "Perdas") |>
  dplyr::select(
    ano,
    fluxo_2 = fluxo_nivel_2,
    valor
  ) |>
  dplyr::mutate(
    valor = -valor,
    origem = "Oferta Interna de Energia Elétrica",
    destino = "Perdas na Distribuição e Transmissão",
    ordem = 5
  ) |>
  dplyr::select(-fluxo_2)

# Jutando tabelas
grafico_sankey_fluxo_eletrico <- dplyr::bind_rows(
  tab_oferta_interna_energia_eletrica,
  tab_importacao_oferta,
  tab_oferta_importacao,
  tab_consumo_final,
  tab_perdas
) |>
  dplyr::mutate(valor = valor / 1000) |>
  dplyr::group_by(
    origem, ano
  ) |>
  dplyr::mutate(
    total_origem = sum(valor)
  ) |>
  dplyr::ungroup() |>
  dplyr::group_by(
    destino, ano
  ) |>
  dplyr::mutate(
    total_destino = sum(valor)
  ) |>
  dplyr::ungroup() |>
  dplyr::mutate(
    base_destino = destino %in% c("Oferta Interna de Energia Elétrica", "Oferta Interna de Energia"),
    percentual = dplyr::if_else(base_destino, valor / total_destino, valor / total_origem),
    percentual_no_formato = scales::percent(percentual, accuracy = 0.1),
    nome_base = dplyr::if_else(base_destino, destino, origem),
    rotulo_percentual = stringr:::str_glue("{percentual_no_formato} de {nome_base}")
  ) |>
  dplyr::filter(ano == max(ano))
