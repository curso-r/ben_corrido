# Gráficos ---------------------------------------------------------------------

# CAPÍTULO 1

# grafico_geracao_energia_fontes_nr
tab <- readr::read_rds("data-raw/rds/pt/dados_agregados_1_1_a_tratados.rds")
tab_en <- readr::read_rds("data-raw/rds/en/dados_agregados_1_1_a_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
salvar_tab_bd(tab, "grafico_geracao_energia_fontes_nr")

# grafico_oferta_interna_el_fonte
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_b_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_b_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "grafico_oferta_interna_el_fonte")

# grafico_variacao_consumo_setorial_el
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_1_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_1_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "grafico_variacao_consumo_setorial_el")

# grafico_crescimento_consumo_eletricidade_industria
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_2_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_2_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "grafico_crescimento_consumo_eletricidade_industria")

# grafico_participacao_setorial_consumo_el
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_3_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_3_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "grafico_participacao_setorial_consumo_el")

# grafico_participacao_fontes_capacidade_instalada
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_4_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_4_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "grafico_participacao_fontes_capacidade_instalada")

# grafico_consumo_gas_natural
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_5_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_5_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "grafico_consumo_gas_natural")

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

salvar_tab_bd(tab, "grafico_producao_energia_primaria")

# grafico_oferta_interna_energia
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_3_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_3_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Petróleo e Derivados", "Derivados da Cana", "Carvão Mineral e Coque", "Lenha e Carvão Vegetal", "Hidráulica"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_oferta_interna_energia")

# grafico_consumo_final_fonte
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_4_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_1)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_4_traduzido.rds") |>
  dplyr::select(
    grupo = grupo_nivel_1,
    ano,
    tipo_dado,
    total
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Bagaço de Cana", "Derivados de Petróleo", "Eletricidade", "Lenha", "Gás Natural"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_consumo_final_fonte")

# grafico_consumo_final_setor
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_5_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_menor)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_5_traduzido.rds") |>
  dplyr::select(
    grupo = grupo_nivel_menor,
    ano,
    tipo_dado,
    total
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Consumo Final Não-Energético", "Transportes", "Industrial", "Residencial", "Setor Energético", "Agropecuário"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_consumo_final_setor")

# grafico_dependencia_externa_energia
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_8_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_8_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(tipo_dado == "Percentual") |>
  dplyr::select(
    grupo,
    grupo_en,
    ano,
    total
  )

salvar_tab_bd(tab, "grafico_dependencia_externa_energia")

# grafico_composicao_setorial_consumo_derivados_petroleo
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_9_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_9_traduzido.rds") |>
  dplyr::select(
    grupo,
    ano,
    tipo_dado,
    total
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Consumo Final Não-Energético", "Transportes", "Industrial", "Residencial", "Setor Energético", "Agropecuário"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_composicao_setorial_consumo_derivados_petroleo")

# grafico_composicao_setorial_consumo_eletricidade
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_10_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_10_traduzido.rds") |>
  dplyr::select(
    grupo,
    ano,
    tipo_dado,
    total
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Transportes", "Comercial", "Público", "Industrial", "Residencial", "Setor Energético", "Agropecuário"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_composicao_setorial_consumo_eletricidade")

# grafico_composicao_setorial_consumo_carvao_vapor
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_11_traduzido.rds") |>
  dplyr::select(grupo_en = macro_grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_11_traduzido.rds") |>
  dplyr::select(
    grupo = macro_grupo,
    ano,
    tipo_dado,
    total
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Termeletricidade", "Industrial", "Outros Setores"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_composicao_setorial_consumo_carvao_vapor")

# grafico_composicao_setorial_consumo_biomassa
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_12_traduzido.rds") |>
  dplyr::select(grupo_en = macro_grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_12_traduzido.rds") |>
  dplyr::select(
    grupo = macro_grupo,
    ano,
    tipo_dado,
    total
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Agropecuário", "Industrial", "Residencial", "Setor Energético", "Transportes", "Comercial e Público"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_composicao_setorial_consumo_biomassa")

# grafico_oferta_interna_energia
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_13_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_13_traduzido.rds") |>
  dplyr::select(
    grupo,
    ano,
    tipo_dado,
    total
  ) |>
  dplyr::bind_cols(tab_en)

salvar_tab_bd(tab, "grafico_oferta_interna_energia")

# grafico_sankey_fluxo_energetico

source("inst/scripts/gerar_fluxo_energetico.R")
salvar_tab_bd(grafico_sankey_fluxo_energetico, "grafico_sankey_fluxo_energetico")

# grafico_sankey_fluxo_eletrico

source("inst/scripts/gerar_fluxo_energetico.R")
salvar_tab_bd(grafico_sankey_fluxo_eletrico, "grafico_sankey_fluxo_eletrico")


# grafico_comp_oferta_energia_fonte

tab <- readr::read_rds("./data-raw/rds/pt/dados_grafico_anexo_iii_1.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_grafico_anexo_iii_1.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)

salvar_tab_bd(tab, "grafico_comp_oferta_energia_fonte")

# CAPÍTULO 2

# grafico_estrutura_consumo_fontes_primarias
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_1_traduzido.rds") |> 
  dplyr::select(grupo_en = grupo_nivel_2)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_1_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_2, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(grupo %in% c("Transformação", "Consumo Final")) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |> 
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_estrutura_consumo_fontes_primarias")

# grafico_fontes_primarias
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_1_traduzido.rds") |> 
  dplyr::select(grupo_en = grupo_nivel_1)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_1_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_1, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(grupo %in% c("Produção", "Consumo Total")) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |> 
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_fontes_primarias")


# Tabelas ---------------------------------------------------------------------

# CAPÍTULO 1

# tab_producao_energia_primaria
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_2_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_2_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)
tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_producao_energia_primaria")

# tab_oferta_interna_energia
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_3_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_3_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)
tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_oferta_interna_energia")

# tab_consumo_final_fonte
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_4_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_4_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )
tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_consumo_final_fonte")

# tab_consumo_final_setor
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_5_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_5_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )
tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_consumo_final_setor")

# tab_consumo_final_energetico_fonte
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_6_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_6_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_consumo_final_energetico_fonte")

# tab_consumo_final_nao_energetico_fonte
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_7_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_7_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_consumo_final_nao_energetico_fonte")

# tab_dependencia_externa_energia
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_8_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_8_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_dependencia_externa_energia")

# tab_composicao_setorial_consumo_derivados_petroleo
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_9_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_9_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_composicao_setorial_consumo_derivados_petroleo")

# tab_composicao_setorial_consumo_eletricidade
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_10_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_10_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_composicao_setorial_consumo_eletricidade")

# tab_composicao_setorial_consumo_carvao_vapor
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_11_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_11_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_composicao_setorial_consumo_carvao_vapor")

# tab_composicao_setorial_consumo_final_biomassa
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_12_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_12_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_composicao_setorial_consumo_final_biomassa")

# tab_oferta_interna_energia_2
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_13_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_13_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_oferta_interna_energia_2")

# CAPÍTULO 2


# tab_total_fontes_primarias

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_1_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_1_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_total_fontes_primarias")

# tab_petroleo

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_2_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_2_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_petroleo")

# tab_gas_natural

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_3_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_3_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_gas_natural")

# tab_carvao_vapor

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_4_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_4_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_carvao_vapor")

# tab_carvao_metalurgico

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_5_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_5_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_carvao_metalurgico")

# tab_energia_hidraulica

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_6_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_6_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_energia_hidraulica")

# tab_energia_eolica

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_7_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_7_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_energia_eolica")

# tab_energia_solar_fotovoltaica

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_8_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_8_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_energia_solar_fotovoltaica")

# tab_energia_solar_termica

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_9_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_9_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_energia_solar_termica")

# tab_uranio
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_10_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_10_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_uranio")


# tab_lenha
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_11_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_11_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_lenha")

# tab_caldo_cana
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_12_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_12_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_caldo_cana")

# tab_melaco
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_13_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_13_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_melaco")

# tab_bagaco_cana
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_14_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_14_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_bagaco_cana")

# tab_lixivia
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_15_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_15_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_lixivia")

# tab_outras_fontes_primarias
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_16_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_16_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_outras_fontes_primarias")

# tab_total_fontes_secundarias
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_17_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_17_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_total_fontes_secundarias")

# tab_derivados_petroleo_e_gas_natural
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_18_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_18_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_derivados_petroleo_e_gas_natural")

# tab_oleo_diesel_total
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_19_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_19_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_oleo_diesel_total")

# tab_diesel_petroleo
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_20_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_20_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_diesel_petroleo")

# tab_biodiesel
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_21_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_21_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_biodiesel")

# tab_oleo_combustivel
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_22_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_22_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_oleo_combustivel")

# tab_gasolina
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_23_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_23_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_gasolina")

# tab_gas_liquefeito_de_petroleo
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_24_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_24_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_gas_liquefeito_de_petroleo")

# tab_nafta
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_25_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_25_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_nafta")

# tab_coque_carvao_mineral
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_26_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_26_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_coque_carvao_mineral")

# tab_querosene
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_27_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_27_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_querosene")

# tab_gas_cidade
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_28_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_28_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_gas_cidade")

# tab_gas_coqueira
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_29_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_29_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_gas_coqueira")

# tab_eletricidade
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_30_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_30_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_eletricidade")

# tab_carvao_vegetal
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_31_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_31_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_carvao_vegetal")

# tab_alcool_etilico_total
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_32_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_32_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_alcool_etilico_total")

# tab_alcool_anidro
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_33_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_33_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_alcool_anidro")

# tab_alcool_hidratado
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_34_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_34_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_alcool_hidratado")

# tab_outras_secundarias_petroleo
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_35_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_35_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_outras_secundarias_petroleo")

# tab_alcatrao
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_36_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_36_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_alcatrao")

# tab_produtos_nao_energeticos_petroleo
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_37_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_37_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_produtos_nao_energeticos_petroleo")
