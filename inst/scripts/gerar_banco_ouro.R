con <- DBI::dbConnect(duckdb::duckdb(), "bd_ouro.duckdb")

tab <- readr::read_rds("data-raw/rds/dados_agregados_1_1_a_tratados.rds")
DBI::dbWriteTable(con, "grafico_geracao_energia_fontes_nr", tab, overwrite = TRUE)
