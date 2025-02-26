con <- DBI::dbConnect(duckdb::duckdb(), "data-raw/bd_ouro.duckdb")

# grafico_geracao_energia_fontes_nr
tab <- readr::read_rds("data-raw/rds/pt/dados_agregados_1_1_a_tratados.rds")
tab_en <- readr::read_rds("data-raw/rds/en/dados_agregados_1_1_a_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
DBI::dbWriteTable(con, "grafico_geracao_energia_fontes_nr", tab, overwrite = TRUE)

# grafico_oferta_interna_el_fonte
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_b_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_b_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
DBI::dbWriteTable(con, "grafico_oferta_interna_el_fonte", tab, overwrite = TRUE)

# grafico_variacao_consumo_setorial_el
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_1_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_1_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
DBI::dbWriteTable(con, "grafico_variacao_consumo_setorial_el", tab, overwrite = TRUE)

# grafico_crescimento_consumo_eletricidade_industria
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_2_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_2_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
DBI::dbWriteTable(con, "grafico_crescimento_consumo_eletricidade_industria", tab, overwrite = TRUE)

# grafico_participacao_setorial_consumo_el
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_3_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_3_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
DBI::dbWriteTable(con, "grafico_participacao_setorial_consumo_el", tab, overwrite = TRUE)

# grafico_participacao_fontes_capacidade_instalada
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_4_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_4_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
DBI::dbWriteTable(con, "grafico_participacao_fontes_capacidade_instalada", tab, overwrite = TRUE)


DBI::dbDisconnect(con)
