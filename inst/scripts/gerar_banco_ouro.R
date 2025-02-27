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

# grafico_consumo_gas_natural
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_5_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_5_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
DBI::dbWriteTable(con, "grafico_consumo_gas_natural", tab, overwrite = TRUE)

# tab_producao_energia_primaria
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_2_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_2_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)
tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
DBI::dbWriteTable(con, "tab_producao_energia_primaria", tab, overwrite = TRUE)


# grafico_producao_energia_primaria
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_2_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_2_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Petróleo", "Gás Natural", "Energia Hidráulica", "Lenha", "Produtos da Cana"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

DBI::dbWriteTable(con, "grafico_producao_energia_primaria", tab, overwrite = TRUE)

DBI::dbDisconnect(con)
