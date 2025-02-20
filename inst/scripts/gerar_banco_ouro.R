con <- DBI::dbConnect(duckdb::duckdb(), "data-raw/bd_ouro.duckdb")

tab <- readr::read_rds("data-raw/rds/pt/dados_agregados_1_1_a_tratados.rds")
tab_en <- readr::read_rds("data-raw/rds/en/dados_agregados_1_1_a_tratados.rds") |> 
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
DBI::dbWriteTable(con, "grafico_geracao_energia_fontes_nr", tab, overwrite = TRUE)
