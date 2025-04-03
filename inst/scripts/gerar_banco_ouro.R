# Gráficos ---------------------------------------------------------------------

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
